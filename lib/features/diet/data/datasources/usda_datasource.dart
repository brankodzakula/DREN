import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/food_item.dart';

/// Data source for USDA FoodData Central API
@injectable
class UsdaDataSource {
  final Dio _dio;
  static const _baseUrl = 'https://api.nal.usda.gov/fdc/v1';

  // Demo API key - should be replaced with env variable in production
  static const _apiKey = 'DEMO_KEY';

  UsdaDataSource(this._dio);

  /// Search for foods by query string
  Future<List<FoodItem>> searchFoods(String query, {int pageSize = 25}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/foods/search',
        queryParameters: {
          'api_key': _apiKey,
          'query': query,
          'pageSize': pageSize,
          'dataType': 'Foundation,SR Legacy',
        },
      );

      final foods = response.data['foods'] as List? ?? [];
      return foods
          .map((f) => _mapToFoodItem(f as Map<String, dynamic>))
          .where((f) => f.calories > 0) // Filter out items without nutrition data
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw UsdaRateLimitException();
      }
      throw UsdaNetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw UsdaParseException('Failed to parse response: $e');
    }
  }

  /// Get detailed food item by FDC ID
  Future<FoodItem?> getFoodById(String fdcId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/food/$fdcId',
        queryParameters: {
          'api_key': _apiKey,
        },
      );

      return _mapToFoodItem(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      if (e.response?.statusCode == 429) {
        throw UsdaRateLimitException();
      }
      throw UsdaNetworkException(e.message ?? 'Network error');
    } catch (e) {
      throw UsdaParseException('Failed to parse response: $e');
    }
  }

  /// Map USDA API response to FoodItem entity
  FoodItem _mapToFoodItem(Map<String, dynamic> json) {
    final nutrients = json['foodNutrients'] as List? ?? [];

    // Get brand from brandOwner or brandName
    final brandOwner = json['brandOwner'] as String?;
    final brandName = json['brandName'] as String?;
    final brand = brandOwner ?? brandName;

    return FoodItem(
      id: 'usda_${json['fdcId']}',
      name: _cleanFoodName(json['description'] as String? ?? 'Unknown Food'),
      brand: brand,
      servingSize: 100.0, // USDA provides values per 100g
      servingUnit: 'g',
      calories: _getNutrient(nutrients, 1008)?.toInt() ?? 0,
      protein: _getNutrient(nutrients, 1003) ?? 0.0,
      carbs: _getNutrient(nutrients, 1005) ?? 0.0,
      fat: _getNutrient(nutrients, 1004) ?? 0.0,
      fiber: _getNutrient(nutrients, 1079),
      sugar: _getNutrient(nutrients, 2000),
      sodium: _getNutrient(nutrients, 1093),
      barcode: null,
      databaseSource: FoodDatabaseSource.usda,
    );
  }

  /// Get nutrient value by nutrient ID
  double? _getNutrient(List nutrients, int nutrientId) {
    try {
      final nutrient = nutrients.firstWhere(
        (n) => n['nutrientId'] == nutrientId || n['nutrient']?['id'] == nutrientId,
        orElse: () => null,
      );
      if (nutrient == null) return null;

      final value = nutrient['value'] ?? nutrient['amount'];
      return value?.toDouble();
    } catch (e) {
      return null;
    }
  }

  /// Clean up USDA food descriptions
  String _cleanFoodName(String name) {
    // USDA names are often long and technical, clean them up
    return name
        .replaceAll(RegExp(r',\s*raw$', caseSensitive: false), '')
        .replaceAll(RegExp(r',\s*cooked.*$', caseSensitive: false), ' (cooked)')
        .replaceAll(RegExp(r',\s*NFS$'), '')
        .trim();
  }
}

/// USDA Nutrient IDs reference
class UsdaNutrientIds {
  static const int energy = 1008; // kcal
  static const int protein = 1003; // g
  static const int totalFat = 1004; // g
  static const int carbohydrates = 1005; // g
  static const int fiber = 1079; // g
  static const int sugars = 2000; // g
  static const int sodium = 1093; // mg
  static const int saturatedFat = 1258; // g
  static const int cholesterol = 1253; // mg
}

/// Exception for USDA rate limiting
class UsdaRateLimitException implements Exception {
  final String message = 'USDA API rate limit exceeded. Please try again later.';
  @override
  String toString() => message;
}

/// Exception for USDA network errors
class UsdaNetworkException implements Exception {
  final String message;
  UsdaNetworkException(this.message);
  @override
  String toString() => 'USDA Network Error: $message';
}

/// Exception for USDA response parsing errors
class UsdaParseException implements Exception {
  final String message;
  UsdaParseException(this.message);
  @override
  String toString() => 'USDA Parse Error: $message';
}
