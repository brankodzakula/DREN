import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/food_item.dart';

/// Data source for Open Food Facts API (barcode scanning)
@injectable
class OpenFoodFactsDataSource {
  final Dio _dio;
  static const _baseUrl = 'https://world.openfoodfacts.org/api/v2';
  static const _userAgent = 'Dren/1.0 (longevity-protocol-app)';

  OpenFoodFactsDataSource(this._dio) {
    _dio.options.headers['User-Agent'] = _userAgent;
  }

  /// Get product by barcode (UPC/EAN)
  Future<FoodItem?> getProductByBarcode(String barcode) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/product/$barcode.json',
        options: Options(
          headers: {'User-Agent': _userAgent},
        ),
      );

      final status = response.data['status'] as int?;
      if (status != 1) {
        return null; // Product not found
      }

      final product = response.data['product'] as Map<String, dynamic>?;
      if (product == null) {
        return null;
      }

      return _mapToFoodItem(product, barcode);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw OpenFoodFactsNetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw OpenFoodFactsParseException('Failed to parse response: $e');
    }
  }

  /// Search products by name (limited functionality)
  Future<List<FoodItem>> searchProducts(String query, {int pageSize = 20}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/search',
        queryParameters: {
          'search_terms': query,
          'page_size': pageSize,
          'json': 1,
        },
        options: Options(
          headers: {'User-Agent': _userAgent},
        ),
      );

      final products = response.data['products'] as List? ?? [];
      return products
          .map((p) => _mapToFoodItem(
                p as Map<String, dynamic>,
                p['code'] as String? ?? '',
              ))
          .where((f) => f.calories > 0 && f.name.isNotEmpty)
          .toList();
    } on DioException catch (e) {
      throw OpenFoodFactsNetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw OpenFoodFactsParseException('Failed to parse response: $e');
    }
  }

  /// Map Open Food Facts product to FoodItem entity
  FoodItem _mapToFoodItem(Map<String, dynamic> product, String barcode) {
    final nutrients = product['nutriments'] as Map<String, dynamic>? ?? {};

    // Parse serving size (e.g., "15 g" -> 15.0)
    final servingString = product['serving_size'] as String? ?? '100 g';
    final servingSize = _parseServingSize(servingString);

    // Get product name with fallback
    final productName = product['product_name'] as String? ??
        product['product_name_en'] as String? ??
        'Unknown Product';

    // Get brands (may be comma-separated)
    final brands = product['brands'] as String?;
    final brand = brands?.split(',').first.trim();

    return FoodItem(
      id: 'off_$barcode',
      name: productName.trim(),
      brand: brand,
      servingSize: servingSize,
      servingUnit: 'g',
      calories: _getInt(nutrients, 'energy-kcal_100g') ??
          _getInt(nutrients, 'energy-kcal') ??
          _convertKjToKcal(_getDouble(nutrients, 'energy_100g')) ??
          0,
      protein: _getDouble(nutrients, 'proteins_100g') ?? 0.0,
      carbs: _getDouble(nutrients, 'carbohydrates_100g') ?? 0.0,
      fat: _getDouble(nutrients, 'fat_100g') ?? 0.0,
      fiber: _getDouble(nutrients, 'fiber_100g'),
      sugar: _getDouble(nutrients, 'sugars_100g'),
      sodium: _convertSodium(nutrients),
      barcode: barcode,
      databaseSource: FoodDatabaseSource.openFoodFacts,
    );
  }

  /// Parse serving size from string (e.g., "15 g" -> 15.0)
  double _parseServingSize(String serving) {
    final match = RegExp(r'(\d+\.?\d*)').firstMatch(serving);
    return match != null ? double.tryParse(match.group(1)!) ?? 100.0 : 100.0;
  }

  /// Get double value from nutrients
  double? _getDouble(Map<String, dynamic> nutrients, String key) {
    final value = nutrients[key];
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  /// Get int value from nutrients
  int? _getInt(Map<String, dynamic> nutrients, String key) {
    final value = _getDouble(nutrients, key);
    return value?.toInt();
  }

  /// Convert kJ to kcal (some products only have energy in kJ)
  int? _convertKjToKcal(double? kj) {
    if (kj == null) return null;
    return (kj / 4.184).round();
  }

  /// Convert sodium (handle both mg and g units)
  double? _convertSodium(Map<String, dynamic> nutrients) {
    // First try sodium in mg
    final sodiumMg = _getDouble(nutrients, 'sodium_100g');
    if (sodiumMg != null) {
      // OFF stores sodium in g, convert to mg for display
      return sodiumMg * 1000;
    }

    // Try salt and convert to sodium (sodium = salt * 0.4)
    final salt = _getDouble(nutrients, 'salt_100g');
    if (salt != null) {
      return salt * 0.4 * 1000; // salt in g to sodium in mg
    }

    return null;
  }
}

/// Exception for Open Food Facts network errors
class OpenFoodFactsNetworkException implements Exception {
  final String message;
  OpenFoodFactsNetworkException(this.message);
  @override
  String toString() => 'Open Food Facts Network Error: $message';
}

/// Exception for Open Food Facts response parsing errors
class OpenFoodFactsParseException implements Exception {
  final String message;
  OpenFoodFactsParseException(this.message);
  @override
  String toString() => 'Open Food Facts Parse Error: $message';
}
