import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/food_item.dart';
import '../../domain/entities/meal_entry.dart';

part 'diet_event.freezed.dart';

/// Events for the Diet feature
@freezed
class DietEvent with _$DietEvent {
  /// Load meals and nutrition data for a date
  const factory DietEvent.loadMeals({
    DateTime? date,
  }) = LoadMealsEvent;

  /// Refresh data
  const factory DietEvent.refresh() = RefreshDietEvent;

  /// Search for food items
  const factory DietEvent.searchFood({
    required String query,
  }) = SearchFoodEvent;

  /// Clear search results
  const factory DietEvent.clearSearch() = ClearSearchEvent;

  /// Scan barcode to find food
  const factory DietEvent.scanBarcode({
    required String barcode,
  }) = ScanBarcodeEvent;

  /// Log a meal with food items
  const factory DietEvent.logMeal({
    required String mealType,
    required List<FoodItem> items,
    String? source,
  }) = LogMealEvent;

  /// Log a single food item as quick log
  const factory DietEvent.quickLogFood({
    required FoodItem food,
    required String mealType,
    @Default(1.0) double servings,
  }) = QuickLogFoodEvent;

  /// Update an existing meal
  const factory DietEvent.updateMeal({
    required MealEntry meal,
  }) = UpdateMealEvent;

  /// Delete a meal
  const factory DietEvent.deleteMeal({
    required String mealId,
  }) = DeleteMealEvent;

  /// Change the selected date
  const factory DietEvent.changeDate({
    required DateTime date,
  }) = ChangeDateEvent;
}
