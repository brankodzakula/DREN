import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../entities/food_item.dart';
import '../entities/meal_entry.dart';
import '../repositories/diet_repository.dart';

/// Use case for logging meals
@injectable
class LogMeal {
  final DietRepository _repository;
  final Uuid _uuid;

  LogMeal(this._repository) : _uuid = const Uuid();

  /// Log a new meal with food items
  Future<MealEntry> call({
    required String mealType,
    required List<FoodItem> items,
    required String source,
    DateTime? timestamp,
  }) async {
    final now = timestamp ?? DateTime.now();
    final orderId = _generateOrderId(now);

    final meal = MealEntry.fromItems(
      id: _uuid.v4(),
      oderId: orderId,
      timestamp: now,
      mealType: mealType,
      items: items,
      source: source,
    );

    return _repository.logMeal(meal);
  }

  /// Update an existing meal
  Future<MealEntry> update(MealEntry meal) async {
    return _repository.updateMeal(meal);
  }

  /// Delete a meal
  Future<void> delete(String mealId) async {
    return _repository.deleteMeal(mealId);
  }

  /// Quick log a single food item as a meal
  Future<MealEntry> quickLog({
    required FoodItem food,
    required String mealType,
    double quantity = 1.0,
  }) async {
    final scaledFood = food.scaled(quantity * food.servingSize);
    return call(
      mealType: mealType,
      items: [scaledFood],
      source: MealSource.manual,
    );
  }

  /// Generate order ID based on timestamp (YYYYMMDD-HHmmss)
  String _generateOrderId(DateTime timestamp) {
    return '${timestamp.year}'
        '${timestamp.month.toString().padLeft(2, '0')}'
        '${timestamp.day.toString().padLeft(2, '0')}'
        '-'
        '${timestamp.hour.toString().padLeft(2, '0')}'
        '${timestamp.minute.toString().padLeft(2, '0')}'
        '${timestamp.second.toString().padLeft(2, '0')}';
  }
}
