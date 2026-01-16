import '../../../features/onboarding/domain/entities/onboarding_data.dart';

/// TDEE Calculator - Total Daily Energy Expenditure
///
/// Calculates the total calories burned per day based on BMR
/// and activity level, then applies longevity deficit.
class TdeeCalculator {
  /// Activity level multipliers for TDEE calculation
  static const Map<String, double> activityMultipliers = {
    ActivityLevel.sedentary: 1.2, // Desk job, little/no exercise
    ActivityLevel.lightlyActive: 1.375, // Light exercise 1-3 days/week
    ActivityLevel.moderatelyActive: 1.55, // Moderate exercise 3-5 days/week
    ActivityLevel.veryActive: 1.725, // Hard exercise 6-7 days/week
    ActivityLevel.extraActive: 1.9, // Physical job + intense training
  };

  /// Longevity deficit multipliers
  static const Map<String, double> ambitionDeficits = {
    LongevityAmbition.moderate: 0.94, // 6% deficit
    LongevityAmbition.aggressive: 0.88, // 12% deficit (Blueprint-aligned)
  };

  /// Calculate TDEE from BMR and activity level
  ///
  /// [bmr] - Basal Metabolic Rate in kcal/day
  /// [activityLevel] - One of the ActivityLevel constants
  ///
  /// Returns TDEE in kcal/day
  static double calculate({
    required double bmr,
    required String activityLevel,
  }) {
    if (bmr <= 0) {
      throw ArgumentError('BMR must be positive');
    }

    final multiplier = activityMultipliers[activityLevel];
    if (multiplier == null) {
      throw ArgumentError(
        'Invalid activity level. Must be one of: ${activityMultipliers.keys.join(", ")}',
      );
    }

    return bmr * multiplier;
  }

  /// Calculate target calories with longevity deficit applied
  ///
  /// [tdee] - Total Daily Energy Expenditure in kcal/day
  /// [ambition] - One of the LongevityAmbition constants
  ///
  /// Returns target calories in kcal/day (rounded to nearest integer)
  static int calculateTargetCalories({
    required double tdee,
    required String ambition,
  }) {
    if (tdee <= 0) {
      throw ArgumentError('TDEE must be positive');
    }

    final deficit = ambitionDeficits[ambition];
    if (deficit == null) {
      throw ArgumentError(
        'Invalid ambition level. Must be one of: ${ambitionDeficits.keys.join(", ")}',
      );
    }

    return (tdee * deficit).round();
  }

  /// Get the activity multiplier for a given activity level
  static double getActivityMultiplier(String activityLevel) {
    final multiplier = activityMultipliers[activityLevel];
    if (multiplier == null) {
      throw ArgumentError('Invalid activity level: $activityLevel');
    }
    return multiplier;
  }

  /// Get the deficit percentage for a given ambition level
  /// Returns as a percentage (e.g., 6 for 6% deficit)
  static int getDeficitPercentage(String ambition) {
    final deficit = ambitionDeficits[ambition];
    if (deficit == null) {
      throw ArgumentError('Invalid ambition level: $ambition');
    }
    return ((1 - deficit) * 100).round();
  }
}
