import 'package:injectable/injectable.dart';

import '../entities/food_item.dart';
import '../repositories/diet_repository.dart';

/// Use case for searching food items
@injectable
class SearchFood {
  final DietRepository _repository;

  SearchFood(this._repository);

  /// Search for food by query string
  Future<List<FoodItem>> call(String query, {int limit = 20}) async {
    if (query.trim().isEmpty) {
      return [];
    }
    return _repository.searchFood(query.trim(), limit: limit);
  }

  /// Search for food by barcode
  Future<FoodItem?> byBarcode(String barcode) async {
    if (barcode.trim().isEmpty) {
      return null;
    }
    return _repository.searchFoodByBarcode(barcode.trim());
  }

  /// Get recent foods for quick selection
  Future<List<FoodItem>> getRecent({int limit = 10}) async {
    return _repository.getRecentFoods(limit: limit);
  }

  /// Get frequently used foods
  Future<List<FoodItem>> getFrequent({int limit = 10}) async {
    return _repository.getFrequentFoods(limit: limit);
  }
}
