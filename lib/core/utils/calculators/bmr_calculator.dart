/// BMR Calculator using Mifflin-St Jeor Equation
///
/// The Mifflin-St Jeor Equation is considered the most accurate
/// for calculating Basal Metabolic Rate (BMR).
class BmrCalculator {
  /// Calculate BMR using Mifflin-St Jeor Equation
  ///
  /// [weightKg] - Body weight in kilograms
  /// [heightCm] - Height in centimeters
  /// [ageYears] - Age in years
  /// [sex] - Biological sex ('male' or 'female')
  ///
  /// Returns BMR in kcal/day
  ///
  /// Formula:
  /// - Male: (10 × weight) + (6.25 × height) - (5 × age) + 5
  /// - Female: (10 × weight) + (6.25 × height) - (5 × age) - 161
  static double calculate({
    required double weightKg,
    required double heightCm,
    required int ageYears,
    required String sex,
  }) {
    if (weightKg <= 0) {
      throw ArgumentError('Weight must be positive');
    }
    if (heightCm <= 0) {
      throw ArgumentError('Height must be positive');
    }
    if (ageYears <= 0) {
      throw ArgumentError('Age must be positive');
    }

    final base = (10 * weightKg) + (6.25 * heightCm) - (5 * ageYears);

    if (sex.toLowerCase() == 'male') {
      return base + 5;
    } else if (sex.toLowerCase() == 'female') {
      return base - 161;
    } else {
      throw ArgumentError('Sex must be "male" or "female"');
    }
  }
}
