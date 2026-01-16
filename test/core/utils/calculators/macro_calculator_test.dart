import 'package:dren/core/utils/calculators/macro_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MacroCalculator', () {
    group('calculate', () {
      test('calculates macros for 2249 kcal target and 70kg weight', () {
        final macros = MacroCalculator.calculate(
          targetCalories: 2249,
          weightKg: 70,
        );

        // Protein: max(2249 * 0.23 / 4, 70 * 1.2) = max(129, 84) = 129g
        // Fat: 2249 * 0.42 / 9 = 105g
        // Carbs: (2249 - 129*4 - 105*9) / 4 = (2249 - 516 - 945) / 4 = 197g
        expect(macros.protein, 129);
        expect(macros.fat, 105);
        expect(macros.carbs, 197);
      });

      test('ensures minimum protein per kg of body weight', () {
        // For a low-calorie target, protein from weight should take precedence
        final macros = MacroCalculator.calculate(
          targetCalories: 1200,
          weightKg: 80, // 80 * 1.2 = 96g minimum
        );

        // Protein from percent: 1200 * 0.23 / 4 = 69g
        // Protein from weight: 80 * 1.2 = 96g
        // Should use 96g (higher value)
        expect(macros.protein, greaterThanOrEqualTo(96));
      });

      test('macro calories approximately equal target calories', () {
        final macros = MacroCalculator.calculate(
          targetCalories: 2000,
          weightKg: 70,
        );

        final totalCalories = macros.totalCalories;

        // Allow small rounding differences
        expect(totalCalories, closeTo(2000, 20));
      });

      test('protein percentage is around 22-25%', () {
        final macros = MacroCalculator.calculate(
          targetCalories: 2000,
          weightKg: 70,
        );

        expect(macros.proteinPercent, greaterThanOrEqualTo(20));
        expect(macros.proteinPercent, lessThanOrEqualTo(30));
      });

      test('fat percentage is around 40-45%', () {
        final macros = MacroCalculator.calculate(
          targetCalories: 2000,
          weightKg: 70,
        );

        expect(macros.fatPercent, greaterThanOrEqualTo(38));
        expect(macros.fatPercent, lessThanOrEqualTo(48));
      });

      test('carbs percentage is the remainder (33-38%)', () {
        final macros = MacroCalculator.calculate(
          targetCalories: 2000,
          weightKg: 70,
        );

        expect(macros.carbsPercent, greaterThanOrEqualTo(25));
        expect(macros.carbsPercent, lessThanOrEqualTo(45));
      });

      test('throws ArgumentError for non-positive calories', () {
        expect(
          () => MacroCalculator.calculate(
            targetCalories: 0,
            weightKg: 70,
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for non-positive weight', () {
        expect(
          () => MacroCalculator.calculate(
            targetCalories: 2000,
            weightKg: 0,
          ),
          throwsArgumentError,
        );
      });
    });

    group('calculateCustom', () {
      test('calculates with custom ratios', () {
        final macros = MacroCalculator.calculateCustom(
          targetCalories: 2000,
          proteinRatio: 0.30, // 30%
          fatRatio: 0.30, // 30%
        );

        // Protein: 2000 * 0.30 / 4 = 150g
        // Fat: 2000 * 0.30 / 9 = 67g
        // Carbs: (2000 - 150*4 - 67*9) / 4 = (2000 - 600 - 603) / 4 = 199g
        expect(macros.protein, 150);
        expect(macros.fat, closeTo(67, 1));
      });

      test('throws ArgumentError if ratios exceed 1', () {
        expect(
          () => MacroCalculator.calculateCustom(
            targetCalories: 2000,
            proteinRatio: 0.6,
            fatRatio: 0.5,
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for negative ratios', () {
        expect(
          () => MacroCalculator.calculateCustom(
            targetCalories: 2000,
            proteinRatio: -0.1,
            fatRatio: 0.4,
          ),
          throwsArgumentError,
        );
      });
    });

    group('MacroTargets', () {
      test('toString formats correctly', () {
        const macros = MacroTargets(protein: 130, carbs: 200, fat: 100);

        expect(
          macros.toString(),
          contains('protein: 130g'),
        );
        expect(
          macros.toString(),
          contains('carbs: 200g'),
        );
        expect(
          macros.toString(),
          contains('fat: 100g'),
        );
      });

      test('equality works correctly', () {
        const macros1 = MacroTargets(protein: 130, carbs: 200, fat: 100);
        const macros2 = MacroTargets(protein: 130, carbs: 200, fat: 100);
        const macros3 = MacroTargets(protein: 131, carbs: 200, fat: 100);

        expect(macros1, equals(macros2));
        expect(macros1, isNot(equals(macros3)));
      });

      test('totalCalories calculates correctly', () {
        const macros = MacroTargets(protein: 100, carbs: 200, fat: 50);

        // 100*4 + 200*4 + 50*9 = 400 + 800 + 450 = 1650
        expect(macros.totalCalories, 1650);
      });
    });
  });
}
