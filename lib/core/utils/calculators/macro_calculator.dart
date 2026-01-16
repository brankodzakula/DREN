import 'dart:math';

/// Macro targets in grams
class MacroTargets {
  /// Protein in grams
  final int protein;

  /// Carbohydrates in grams
  final int carbs;

  /// Fat in grams
  final int fat;

  /// Total calories (calculated from macros)
  int get totalCalories => (protein * 4) + (carbs * 4) + (fat * 9);

  /// Protein percentage of total calories
  double get proteinPercent => (protein * 4) / totalCalories * 100;

  /// Carbs percentage of total calories
  double get carbsPercent => (carbs * 4) / totalCalories * 100;

  /// Fat percentage of total calories
  double get fatPercent => (fat * 9) / totalCalories * 100;

  const MacroTargets({
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  @override
  String toString() {
    return 'MacroTargets(protein: ${protein}g, carbs: ${carbs}g, fat: ${fat}g, total: ${totalCalories}kcal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MacroTargets &&
        other.protein == protein &&
        other.carbs == carbs &&
        other.fat == fat;
  }

  @override
  int get hashCode => protein.hashCode ^ carbs.hashCode ^ fat.hashCode;
}

/// Macro Calculator - Longevity-Optimized Macro Distribution
///
/// Based on Blueprint protocol ratios:
/// - Protein: 22-25% (minimum 1.2g/kg for muscle preservation)
/// - Fat: 40-45% (emphasizing healthy fats)
/// - Carbs: 33-38% (remainder, low-glycemic sources)
class MacroCalculator {
  /// Calories per gram for each macro
  static const int caloriesPerGramProtein = 4;
  static const int caloriesPerGramCarbs = 4;
  static const int caloriesPerGramFat = 9;

  /// Target percentages (Blueprint-inspired)
  static const double proteinPercent = 0.23; // 23%
  static const double fatPercent = 0.42; // 42%
  // Carbs make up the remainder (~35%)

  /// Minimum protein per kg of body weight
  static const double minProteinPerKg = 1.2;

  /// Calculate macro targets for longevity optimization
  ///
  /// [targetCalories] - Daily calorie target
  /// [weightKg] - Body weight in kilograms (for minimum protein calculation)
  ///
  /// Returns MacroTargets with protein, carbs, and fat in grams
  static MacroTargets calculate({
    required int targetCalories,
    required double weightKg,
  }) {
    if (targetCalories <= 0) {
      throw ArgumentError('Target calories must be positive');
    }
    if (weightKg <= 0) {
      throw ArgumentError('Weight must be positive');
    }

    // Calculate protein (ensure minimum threshold for muscle preservation)
    final proteinFromPercent =
        (targetCalories * proteinPercent / caloriesPerGramProtein).round();
    final proteinFromWeight = (weightKg * minProteinPerKg).round();
    final proteinGrams = max(proteinFromPercent, proteinFromWeight);

    // Calculate fat
    final fatGrams =
        (targetCalories * fatPercent / caloriesPerGramFat).round();

    // Carbs are the remainder
    final proteinCalories = proteinGrams * caloriesPerGramProtein;
    final fatCalories = fatGrams * caloriesPerGramFat;
    final remainingCalories = targetCalories - proteinCalories - fatCalories;
    final carbGrams = (remainingCalories / caloriesPerGramCarbs).round();

    // Ensure carbs don't go negative
    final finalCarbGrams = max(0, carbGrams);

    return MacroTargets(
      protein: proteinGrams,
      carbs: finalCarbGrams,
      fat: fatGrams,
    );
  }

  /// Calculate macros with custom ratios
  ///
  /// [targetCalories] - Daily calorie target
  /// [proteinRatio] - Protein percentage (0.0 to 1.0)
  /// [fatRatio] - Fat percentage (0.0 to 1.0)
  /// Carbs will be the remainder
  static MacroTargets calculateCustom({
    required int targetCalories,
    required double proteinRatio,
    required double fatRatio,
  }) {
    if (targetCalories <= 0) {
      throw ArgumentError('Target calories must be positive');
    }
    if (proteinRatio < 0 || proteinRatio > 1) {
      throw ArgumentError('Protein ratio must be between 0 and 1');
    }
    if (fatRatio < 0 || fatRatio > 1) {
      throw ArgumentError('Fat ratio must be between 0 and 1');
    }
    if (proteinRatio + fatRatio > 1) {
      throw ArgumentError('Protein + fat ratios cannot exceed 1');
    }

    final proteinGrams =
        (targetCalories * proteinRatio / caloriesPerGramProtein).round();
    final fatGrams = (targetCalories * fatRatio / caloriesPerGramFat).round();

    final proteinCalories = proteinGrams * caloriesPerGramProtein;
    final fatCalories = fatGrams * caloriesPerGramFat;
    final carbGrams =
        ((targetCalories - proteinCalories - fatCalories) / caloriesPerGramCarbs)
            .round();

    return MacroTargets(
      protein: proteinGrams,
      carbs: max(0, carbGrams),
      fat: fatGrams,
    );
  }
}
