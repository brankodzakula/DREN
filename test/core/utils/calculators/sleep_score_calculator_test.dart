import 'package:dren/core/utils/calculators/sleep_score_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SleepScoreCalculator', () {
    group('calculate', () {
      test('returns perfect score for optimal sleep', () {
        final session = SleepSessionData(
          totalMinutes: 480, // 8 hours - optimal
          efficiency: 0.92, // >90% - optimal
          deepSleepMinutes: 80, // ~17% - optimal
          remSleepMinutes: 100, // ~21% - optimal
          latencyMinutes: 15, // 10-20 min - optimal
          bedTime: DateTime(2024, 1, 1, 22, 0), // 10 PM
        );

        final score = SleepScoreCalculator.calculate(
          session,
          targetBedtime: const TimeOfDay(hour: 22, minute: 0),
        );

        // Should be close to 100 (25+25+20+15+10+5 = 100)
        expect(score, greaterThanOrEqualTo(95));
      });

      test('returns lower score for poor sleep', () {
        final session = SleepSessionData(
          totalMinutes: 300, // 5 hours - poor
          efficiency: 0.70, // <75% - poor
          deepSleepMinutes: 15, // ~5% - poor
          remSleepMinutes: 30, // ~10% - poor
          latencyMinutes: 50, // >45 min - poor
        );

        final score = SleepScoreCalculator.calculate(session);

        expect(score, lessThan(50));
      });

      test('score is clamped between 0 and 100', () {
        final goodSession = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.95,
          deepSleepMinutes: 90,
          remSleepMinutes: 110,
          latencyMinutes: 15,
        );

        final score = SleepScoreCalculator.calculate(goodSession);

        expect(score, greaterThanOrEqualTo(0));
        expect(score, lessThanOrEqualTo(100));
      });
    });

    group('calculateBreakdown', () {
      test('duration score is 25 for 7-9 hours', () {
        final session = SleepSessionData(
          totalMinutes: 480, // 8 hours
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.durationScore, 25);
      });

      test('duration score is 20 for 6-7 hours', () {
        final session = SleepSessionData(
          totalMinutes: 390, // 6.5 hours
          efficiency: 0.90,
          deepSleepMinutes: 60,
          remSleepMinutes: 80,
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.durationScore, 20);
      });

      test('duration score is 5 for less than 5 hours', () {
        final session = SleepSessionData(
          totalMinutes: 240, // 4 hours
          efficiency: 0.90,
          deepSleepMinutes: 40,
          remSleepMinutes: 50,
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.durationScore, 5);
      });

      test('efficiency score is 25 for >= 90%', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.92,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.efficiencyScore, 25);
      });

      test('deep sleep score is 20 for 13-23%', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 86, // 18%
          remSleepMinutes: 100,
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.deepSleepScore, 20);
      });

      test('REM score is 15 for 20-25%', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 106, // 22%
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.remScore, 15);
      });

      test('latency score is 10 for 10-20 minutes', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 15,
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.latencyScore, 10);
      });

      test('latency score is 7 for falling asleep too fast', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 5, // Too fast
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(session);

        expect(breakdown.latencyScore, 7);
      });

      test('consistency bonus is 5 for within 15 minutes of target', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 15,
          bedTime: DateTime(2024, 1, 1, 22, 10), // 10:10 PM
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(
          session,
          targetBedtime: const TimeOfDay(hour: 22, minute: 0), // 10 PM target
        );

        expect(breakdown.consistencyBonus, 5);
      });

      test('consistency bonus is 3 for within 30 minutes of target', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 15,
          bedTime: DateTime(2024, 1, 1, 22, 25), // 10:25 PM
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(
          session,
          targetBedtime: const TimeOfDay(hour: 22, minute: 0), // 10 PM target
        );

        expect(breakdown.consistencyBonus, 3);
      });

      test('consistency bonus is 0 for more than 30 minutes off', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.90,
          deepSleepMinutes: 70,
          remSleepMinutes: 100,
          latencyMinutes: 15,
          bedTime: DateTime(2024, 1, 1, 23, 0), // 11 PM
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(
          session,
          targetBedtime: const TimeOfDay(hour: 22, minute: 0), // 10 PM target
        );

        expect(breakdown.consistencyBonus, 0);
      });

      test('totalScore sums all components correctly', () {
        final session = SleepSessionData(
          totalMinutes: 480,
          efficiency: 0.92,
          deepSleepMinutes: 86,
          remSleepMinutes: 106,
          latencyMinutes: 15,
          bedTime: DateTime(2024, 1, 1, 22, 0),
        );

        final breakdown = SleepScoreCalculator.calculateBreakdown(
          session,
          targetBedtime: const TimeOfDay(hour: 22, minute: 0),
        );

        final expectedTotal = breakdown.durationScore +
            breakdown.efficiencyScore +
            breakdown.deepSleepScore +
            breakdown.remScore +
            breakdown.latencyScore +
            breakdown.consistencyBonus;

        expect(breakdown.totalScore, expectedTotal);
      });
    });

    group('getScoreRating', () {
      test('returns Excellent for >= 90', () {
        expect(SleepScoreCalculator.getScoreRating(90), 'Excellent');
        expect(SleepScoreCalculator.getScoreRating(100), 'Excellent');
      });

      test('returns Good for >= 80', () {
        expect(SleepScoreCalculator.getScoreRating(80), 'Good');
        expect(SleepScoreCalculator.getScoreRating(89), 'Good');
      });

      test('returns Fair for >= 70', () {
        expect(SleepScoreCalculator.getScoreRating(70), 'Fair');
        expect(SleepScoreCalculator.getScoreRating(79), 'Fair');
      });

      test('returns Poor for >= 60', () {
        expect(SleepScoreCalculator.getScoreRating(60), 'Poor');
        expect(SleepScoreCalculator.getScoreRating(69), 'Poor');
      });

      test('returns Very Poor for < 60', () {
        expect(SleepScoreCalculator.getScoreRating(59), 'Very Poor');
        expect(SleepScoreCalculator.getScoreRating(0), 'Very Poor');
      });
    });

    group('getImprovementSuggestions', () {
      test('suggests duration improvement for low duration score', () {
        const breakdown = SleepScoreBreakdown(
          durationScore: 15,
          efficiencyScore: 25,
          deepSleepScore: 20,
          remScore: 15,
          latencyScore: 10,
          consistencyBonus: 5,
        );

        final suggestions =
            SleepScoreCalculator.getImprovementSuggestions(breakdown);

        expect(
          suggestions.any((s) => s.contains('7-9 hours')),
          isTrue,
        );
      });

      test('suggests efficiency improvement for low efficiency score', () {
        const breakdown = SleepScoreBreakdown(
          durationScore: 25,
          efficiencyScore: 15,
          deepSleepScore: 20,
          remScore: 15,
          latencyScore: 10,
          consistencyBonus: 5,
        );

        final suggestions =
            SleepScoreCalculator.getImprovementSuggestions(breakdown);

        expect(
          suggestions.any((s) => s.contains('efficiency')),
          isTrue,
        );
      });

      test('returns empty list for optimal scores', () {
        const breakdown = SleepScoreBreakdown(
          durationScore: 25,
          efficiencyScore: 25,
          deepSleepScore: 20,
          remScore: 15,
          latencyScore: 10,
          consistencyBonus: 5,
        );

        final suggestions =
            SleepScoreCalculator.getImprovementSuggestions(breakdown);

        expect(suggestions, isEmpty);
      });
    });
  });

  group('SleepSessionData', () {
    test('creates session with required parameters', () {
      final session = SleepSessionData(
        totalMinutes: 480,
        efficiency: 0.90,
        deepSleepMinutes: 70,
        remSleepMinutes: 100,
        latencyMinutes: 15,
      );

      expect(session.totalMinutes, 480);
      expect(session.efficiency, 0.90);
      expect(session.deepSleepMinutes, 70);
      expect(session.remSleepMinutes, 100);
      expect(session.latencyMinutes, 15);
      expect(session.bedTime, isNull);
    });
  });
}
