import 'package:dren/core/utils/calculators/tdee_calculator.dart';
import 'package:dren/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TdeeCalculator', () {
    group('calculate', () {
      test('calculates TDEE correctly for moderately active', () {
        // Example from CALCULATIONS.md:
        // BMR = 1648.75, Moderately active → TDEE = 1648.75 × 1.55 = 2555.56
        final tdee = TdeeCalculator.calculate(
          bmr: 1648.75,
          activityLevel: ActivityLevel.moderatelyActive,
        );

        expect(tdee, closeTo(2555.56, 0.01));
      });

      test('applies sedentary multiplier correctly (1.2)', () {
        final tdee = TdeeCalculator.calculate(
          bmr: 1000,
          activityLevel: ActivityLevel.sedentary,
        );

        expect(tdee, 1200);
      });

      test('applies lightly active multiplier correctly (1.375)', () {
        final tdee = TdeeCalculator.calculate(
          bmr: 1000,
          activityLevel: ActivityLevel.lightlyActive,
        );

        expect(tdee, 1375);
      });

      test('applies very active multiplier correctly (1.725)', () {
        final tdee = TdeeCalculator.calculate(
          bmr: 1000,
          activityLevel: ActivityLevel.veryActive,
        );

        expect(tdee, 1725);
      });

      test('applies extra active multiplier correctly (1.9)', () {
        final tdee = TdeeCalculator.calculate(
          bmr: 1000,
          activityLevel: ActivityLevel.extraActive,
        );

        expect(tdee, 1900);
      });

      test('throws ArgumentError for non-positive BMR', () {
        expect(
          () => TdeeCalculator.calculate(
            bmr: 0,
            activityLevel: ActivityLevel.moderatelyActive,
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for invalid activity level', () {
        expect(
          () => TdeeCalculator.calculate(
            bmr: 1648.75,
            activityLevel: 'invalid',
          ),
          throwsArgumentError,
        );
      });
    });

    group('calculateTargetCalories', () {
      test('calculates target with moderate deficit (6%)', () {
        // TDEE = 2555.56, Moderate → Target = 2555.56 × 0.94
        final target = TdeeCalculator.calculateTargetCalories(
          tdee: 2555.56,
          ambition: LongevityAmbition.moderate,
        );

        expect(target, closeTo(2402, 1));
      });

      test('calculates target with aggressive deficit (12%)', () {
        // Example from CALCULATIONS.md:
        // TDEE = 2555.56, Aggressive → Target = 2555.56 × 0.88 = 2249 kcal
        final target = TdeeCalculator.calculateTargetCalories(
          tdee: 2555.56,
          ambition: LongevityAmbition.aggressive,
        );

        expect(target, 2249);
      });

      test('throws ArgumentError for non-positive TDEE', () {
        expect(
          () => TdeeCalculator.calculateTargetCalories(
            tdee: 0,
            ambition: LongevityAmbition.moderate,
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for invalid ambition level', () {
        expect(
          () => TdeeCalculator.calculateTargetCalories(
            tdee: 2555.56,
            ambition: 'invalid',
          ),
          throwsArgumentError,
        );
      });
    });

    group('getActivityMultiplier', () {
      test('returns correct multipliers', () {
        expect(
          TdeeCalculator.getActivityMultiplier(ActivityLevel.sedentary),
          1.2,
        );
        expect(
          TdeeCalculator.getActivityMultiplier(ActivityLevel.lightlyActive),
          1.375,
        );
        expect(
          TdeeCalculator.getActivityMultiplier(ActivityLevel.moderatelyActive),
          1.55,
        );
        expect(
          TdeeCalculator.getActivityMultiplier(ActivityLevel.veryActive),
          1.725,
        );
        expect(
          TdeeCalculator.getActivityMultiplier(ActivityLevel.extraActive),
          1.9,
        );
      });
    });

    group('getDeficitPercentage', () {
      test('returns 6% for moderate', () {
        expect(
          TdeeCalculator.getDeficitPercentage(LongevityAmbition.moderate),
          6,
        );
      });

      test('returns 12% for aggressive', () {
        expect(
          TdeeCalculator.getDeficitPercentage(LongevityAmbition.aggressive),
          12,
        );
      });
    });

    group('full calculation flow', () {
      test('complete example from CALCULATIONS.md', () {
        // Male, 70kg, 175cm, 30 years → BMR = 1648.75
        // Moderately active → TDEE = 2555.56
        // Aggressive ambition → Target = 2249 kcal
        const bmr = 1648.75;

        final tdee = TdeeCalculator.calculate(
          bmr: bmr,
          activityLevel: ActivityLevel.moderatelyActive,
        );
        expect(tdee, closeTo(2555.56, 0.01));

        final target = TdeeCalculator.calculateTargetCalories(
          tdee: tdee,
          ambition: LongevityAmbition.aggressive,
        );
        expect(target, 2249);
      });
    });
  });
}
