import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

/// Represents a food item from any source (USDA, Open Food Facts, manual, etc.)
@freezed
class FoodItem with _$FoodItem {
  const FoodItem._();

  const factory FoodItem({
    required String id,
    required String name,
    String? brand,
    required double servingSize,
    required String servingUnit, // g, ml, oz, cup, piece
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    double? fiber,
    double? sugar,
    double? sodium,
    String? barcode,
    required String databaseSource, // usda, open_food_facts, manual, recipe
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  /// Calculate nutrition for a given quantity
  FoodItem scaled(double quantity) {
    final multiplier = quantity / servingSize;
    return FoodItem(
      id: id,
      name: name,
      brand: brand,
      servingSize: quantity,
      servingUnit: servingUnit,
      calories: (calories * multiplier).round(),
      protein: protein * multiplier,
      carbs: carbs * multiplier,
      fat: fat * multiplier,
      fiber: fiber != null ? fiber! * multiplier : null,
      sugar: sugar != null ? sugar! * multiplier : null,
      sodium: sodium != null ? sodium! * multiplier : null,
      barcode: barcode,
      databaseSource: databaseSource,
    );
  }

  /// Get display name with brand if available
  String get displayName => brand != null ? '$name ($brand)' : name;

  /// Format serving info
  String get servingInfo => '${servingSize.round()}$servingUnit';

  /// Calculate calories from macros (for verification)
  int get calculatedCalories =>
      (protein * 4 + carbs * 4 + fat * 9).round();
}

/// Database source constants
class FoodDatabaseSource {
  static const String usda = 'usda';
  static const String openFoodFacts = 'open_food_facts';
  static const String manual = 'manual';
  static const String recipe = 'recipe';
}
