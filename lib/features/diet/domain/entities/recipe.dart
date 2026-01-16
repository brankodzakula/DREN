import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

/// Represents a recipe with ingredients and nutrition info
@freezed
class Recipe with _$Recipe {
  const Recipe._();

  const factory Recipe({
    required String id,
    required String name,
    required String description,
    String? imageUrl,
    required int prepTimeMinutes,
    required int cookTimeMinutes,
    required int servings,
    required List<RecipeIngredient> ingredients,
    required List<String> instructions,
    required NutritionPerServing nutrition,
    required List<String> dietaryTags,
    required List<String> allergens,
    String? longevityRationale,
    @Default(false) bool isBlueprintRecipe, // Core Blueprint meal
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  /// Get total time for recipe
  int get totalTimeMinutes => prepTimeMinutes + cookTimeMinutes;

  /// Format total time as string
  String get totalTimeDisplay {
    final total = totalTimeMinutes;
    if (total < 60) {
      return '$total min';
    }
    final hours = total ~/ 60;
    final mins = total % 60;
    return mins > 0 ? '${hours}h ${mins}m' : '${hours}h';
  }

  /// Check if recipe matches dietary restriction
  bool matchesDietaryRestriction(String restriction) {
    return dietaryTags.contains(restriction);
  }

  /// Check if recipe contains allergen
  bool containsAllergen(String allergen) {
    return allergens.contains(allergen);
  }
}

/// Represents an ingredient in a recipe
@freezed
class RecipeIngredient with _$RecipeIngredient {
  const RecipeIngredient._();

  const factory RecipeIngredient({
    required String name,
    required double amount,
    required String unit,
    String? notes, // "diced", "optional"
  }) = _RecipeIngredient;

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);

  /// Format ingredient for display
  String get displayText {
    final amountStr = amount == amount.roundToDouble()
        ? amount.toInt().toString()
        : amount.toStringAsFixed(1);
    final base = '$amountStr $unit $name';
    return notes != null ? '$base ($notes)' : base;
  }
}

/// Nutrition information per serving
@freezed
class NutritionPerServing with _$NutritionPerServing {
  const NutritionPerServing._();

  const factory NutritionPerServing({
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    double? fiber,
    double? sugar,
  }) = _NutritionPerServing;

  factory NutritionPerServing.fromJson(Map<String, dynamic> json) =>
      _$NutritionPerServingFromJson(json);

  /// Calculate calories from macros (for verification)
  int get calculatedCalories => (protein * 4 + carbs * 4 + fat * 9).round();

  /// Format macros summary
  String get macrosSummary =>
      '${protein.round()}p · ${carbs.round()}c · ${fat.round()}f';
}

/// Dietary tag constants
class DietaryTags {
  static const String vegetarian = 'vegetarian';
  static const String vegan = 'vegan';
  static const String pescatarian = 'pescatarian';
  static const String keto = 'keto';
  static const String paleo = 'paleo';
  static const String glutenFree = 'gluten_free';
  static const String dairyFree = 'dairy_free';
  static const String nutFree = 'nut_free';
  static const String lowSodium = 'low_sodium';
  static const String halal = 'halal';
  static const String kosher = 'kosher';
}

/// Common allergen constants
class Allergens {
  static const String gluten = 'gluten';
  static const String dairy = 'dairy';
  static const String nuts = 'nuts';
  static const String peanuts = 'peanuts';
  static const String soy = 'soy';
  static const String eggs = 'eggs';
  static const String fish = 'fish';
  static const String shellfish = 'shellfish';
}
