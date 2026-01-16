import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_item.dart';

part 'meal_entry.freezed.dart';
part 'meal_entry.g.dart';

/// Represents a logged meal with one or more food items
@freezed
class MealEntry with _$MealEntry {
  const MealEntry._();

  const factory MealEntry({
    required String id,
    required String oderId, // Order/sequence ID for the day
    required DateTime timestamp,
    required String mealType, // breakfast, lunch, dinner, snack
    required List<FoodItem> items,
    required int totalCalories,
    required double totalProtein,
    required double totalCarbs,
    required double totalFat,
    required String source, // manual, barcode, recipe, healthkit
  }) = _MealEntry;

  factory MealEntry.fromJson(Map<String, dynamic> json) =>
      _$MealEntryFromJson(json);

  /// Create a meal entry from a list of food items
  factory MealEntry.fromItems({
    required String id,
    required String oderId,
    required DateTime timestamp,
    required String mealType,
    required List<FoodItem> items,
    required String source,
  }) {
    final totalCalories = items.fold(0, (sum, item) => sum + item.calories);
    final totalProtein = items.fold(0.0, (sum, item) => sum + item.protein);
    final totalCarbs = items.fold(0.0, (sum, item) => sum + item.carbs);
    final totalFat = items.fold(0.0, (sum, item) => sum + item.fat);

    return MealEntry(
      id: id,
      oderId: oderId,
      timestamp: timestamp,
      mealType: mealType,
      items: items,
      totalCalories: totalCalories,
      totalProtein: totalProtein,
      totalCarbs: totalCarbs,
      totalFat: totalFat,
      source: source,
    );
  }

  /// Get display time
  String get displayTime {
    final hour = timestamp.hour;
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }

  /// Get meal type display name
  String get mealTypeDisplay {
    switch (mealType) {
      case 'breakfast':
        return 'Breakfast';
      case 'lunch':
        return 'Lunch';
      case 'dinner':
        return 'Dinner';
      case 'snack':
        return 'Snack';
      default:
        return mealType;
    }
  }
}

/// Meal type constants
class MealType {
  static const String breakfast = 'breakfast';
  static const String lunch = 'lunch';
  static const String dinner = 'dinner';
  static const String snack = 'snack';

  static const List<String> all = [breakfast, lunch, dinner, snack];
}

/// Data source constants for meals
class MealSource {
  static const String manual = 'manual';
  static const String barcode = 'barcode';
  static const String recipe = 'recipe';
  static const String healthkit = 'healthkit';
}
