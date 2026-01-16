import 'package:dren/core/utils/calculators/bmr_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BmrCalculator', () {
    group('calculate', () {
      test('calculates BMR correctly for male', () {
        // Example from CALCULATIONS.md:
        // Male, 70kg, 175cm, 30 years: (10 × 70) + (6.25 × 175) - (5 × 30) + 5 = 1648.75 kcal
        final bmr = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 30,
          sex: 'male',
        );

        expect(bmr, 1648.75);
      });

      test('calculates BMR correctly for female', () {
        // Female, 60kg, 165cm, 28 years: (10 × 60) + (6.25 × 165) - (5 × 28) - 161
        // = 600 + 1031.25 - 140 - 161 = 1330.25 kcal
        final bmr = BmrCalculator.calculate(
          weightKg: 60,
          heightCm: 165,
          ageYears: 28,
          sex: 'female',
        );

        expect(bmr, 1330.25);
      });

      test('handles case-insensitive sex parameter', () {
        final bmrLower = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 30,
          sex: 'male',
        );

        final bmrUpper = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 30,
          sex: 'MALE',
        );

        final bmrMixed = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 30,
          sex: 'Male',
        );

        expect(bmrLower, bmrUpper);
        expect(bmrLower, bmrMixed);
      });

      test('throws ArgumentError for invalid sex', () {
        expect(
          () => BmrCalculator.calculate(
            weightKg: 70,
            heightCm: 175,
            ageYears: 30,
            sex: 'other',
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for non-positive weight', () {
        expect(
          () => BmrCalculator.calculate(
            weightKg: 0,
            heightCm: 175,
            ageYears: 30,
            sex: 'male',
          ),
          throwsArgumentError,
        );

        expect(
          () => BmrCalculator.calculate(
            weightKg: -70,
            heightCm: 175,
            ageYears: 30,
            sex: 'male',
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for non-positive height', () {
        expect(
          () => BmrCalculator.calculate(
            weightKg: 70,
            heightCm: 0,
            ageYears: 30,
            sex: 'male',
          ),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for non-positive age', () {
        expect(
          () => BmrCalculator.calculate(
            weightKg: 70,
            heightCm: 175,
            ageYears: 0,
            sex: 'male',
          ),
          throwsArgumentError,
        );
      });

      test('BMR increases with weight', () {
        final bmrLow = BmrCalculator.calculate(
          weightKg: 60,
          heightCm: 175,
          ageYears: 30,
          sex: 'male',
        );

        final bmrHigh = BmrCalculator.calculate(
          weightKg: 80,
          heightCm: 175,
          ageYears: 30,
          sex: 'male',
        );

        expect(bmrHigh, greaterThan(bmrLow));
      });

      test('BMR decreases with age', () {
        final bmrYoung = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 25,
          sex: 'male',
        );

        final bmrOlder = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 45,
          sex: 'male',
        );

        expect(bmrYoung, greaterThan(bmrOlder));
      });

      test('male BMR is higher than female BMR with same parameters', () {
        final maleBmr = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 30,
          sex: 'male',
        );

        final femaleBmr = BmrCalculator.calculate(
          weightKg: 70,
          heightCm: 175,
          ageYears: 30,
          sex: 'female',
        );

        // Male formula adds 5, female subtracts 161
        // Difference should be 166
        expect(maleBmr - femaleBmr, 166);
      });
    });
  });
}
