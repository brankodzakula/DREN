import 'package:flutter/material.dart';

/// Sleep session data for score calculation
class SleepSessionData {
  /// Total sleep time in minutes
  final int totalMinutes;

  /// Sleep efficiency (0.0 to 1.0)
  /// Ratio of time asleep to time in bed
  final double efficiency;

  /// Deep sleep time in minutes
  final int deepSleepMinutes;

  /// REM sleep time in minutes
  final int remSleepMinutes;

  /// Sleep onset latency in minutes
  /// Time to fall asleep after getting into bed
  final int latencyMinutes;

  /// Actual bedtime
  final DateTime? bedTime;

  const SleepSessionData({
    required this.totalMinutes,
    required this.efficiency,
    required this.deepSleepMinutes,
    required this.remSleepMinutes,
    required this.latencyMinutes,
    this.bedTime,
  });
}

/// Sleep score breakdown showing points for each category
class SleepScoreBreakdown {
  final int durationScore; // max 25
  final int efficiencyScore; // max 25
  final int deepSleepScore; // max 20
  final int remScore; // max 15
  final int latencyScore; // max 10
  final int consistencyBonus; // max 5

  int get totalScore =>
      (durationScore +
              efficiencyScore +
              deepSleepScore +
              remScore +
              latencyScore +
              consistencyBonus)
          .clamp(0, 100);

  const SleepScoreBreakdown({
    required this.durationScore,
    required this.efficiencyScore,
    required this.deepSleepScore,
    required this.remScore,
    required this.latencyScore,
    required this.consistencyBonus,
  });

  @override
  String toString() {
    return 'SleepScoreBreakdown(total: $totalScore, duration: $durationScore, '
        'efficiency: $efficiencyScore, deep: $deepSleepScore, '
        'rem: $remScore, latency: $latencyScore, consistency: $consistencyBonus)';
  }
}

/// Sleep Score Calculator (0-100 scale)
///
/// Components:
/// - Duration: max 25 points (optimal: 7-9 hours)
/// - Efficiency: max 25 points (optimal: ≥90%)
/// - Deep Sleep: max 20 points (optimal: 13-23% of total)
/// - REM Sleep: max 15 points (optimal: 20-25% of total)
/// - Latency: max 10 points (optimal: 10-20 minutes)
/// - Consistency Bonus: max 5 points (bedtime within ±30 min of target)
class SleepScoreCalculator {
  /// Calculate sleep score from session data
  ///
  /// [session] - Sleep session data
  /// [targetBedtime] - Optional target bedtime for consistency bonus
  ///
  /// Returns score from 0-100
  static int calculate(
    SleepSessionData session, {
    TimeOfDay? targetBedtime,
  }) {
    final breakdown = calculateBreakdown(session, targetBedtime: targetBedtime);
    return breakdown.totalScore;
  }

  /// Calculate sleep score with detailed breakdown
  static SleepScoreBreakdown calculateBreakdown(
    SleepSessionData session, {
    TimeOfDay? targetBedtime,
  }) {
    return SleepScoreBreakdown(
      durationScore: _getDurationScore(session.totalMinutes),
      efficiencyScore: _getEfficiencyScore(session.efficiency),
      deepSleepScore:
          _getDeepSleepScore(session.deepSleepMinutes, session.totalMinutes),
      remScore: _getRemScore(session.remSleepMinutes, session.totalMinutes),
      latencyScore: _getLatencyScore(session.latencyMinutes),
      consistencyBonus: _getConsistencyBonus(session.bedTime, targetBedtime),
    );
  }

  /// Duration score (max 25 points)
  /// Optimal: 7-9 hours (420-540 minutes)
  static int _getDurationScore(int minutes) {
    if (minutes >= 420 && minutes <= 540) return 25; // 7-9 hours - optimal
    if (minutes >= 360 && minutes < 420) return 20; // 6-7 hours
    if (minutes > 540 && minutes <= 600) return 20; // 9-10 hours
    if (minutes >= 300 && minutes < 360) return 15; // 5-6 hours
    if (minutes > 600) return 10; // >10 hours - too much
    return 5; // <5 hours - severely inadequate
  }

  /// Efficiency score (max 25 points)
  /// Optimal: ≥90%
  static int _getEfficiencyScore(double efficiency) {
    if (efficiency >= 0.90) return 25;
    if (efficiency >= 0.85) return 20;
    if (efficiency >= 0.80) return 15;
    if (efficiency >= 0.75) return 10;
    return 5;
  }

  /// Deep sleep score (max 20 points)
  /// Optimal: 13-23% of total sleep
  static int _getDeepSleepScore(int deepMinutes, int totalMinutes) {
    if (totalMinutes <= 0) return 0;

    final percent = deepMinutes / totalMinutes;
    if (percent >= 0.13 && percent <= 0.23) return 20; // Optimal
    if (percent >= 0.10 && percent < 0.13) return 15; // Slightly low
    if (percent > 0.23 && percent <= 0.30) return 15; // Slightly high
    if (percent >= 0.05 && percent < 0.10) return 10; // Low
    return 5; // Very low or very high
  }

  /// REM sleep score (max 15 points)
  /// Optimal: 20-25% of total sleep
  static int _getRemScore(int remMinutes, int totalMinutes) {
    if (totalMinutes <= 0) return 0;

    final percent = remMinutes / totalMinutes;
    if (percent >= 0.20 && percent <= 0.25) return 15; // Optimal
    if (percent >= 0.15 && percent < 0.20) return 12; // Slightly low
    if (percent > 0.25 && percent <= 0.30) return 12; // Slightly high
    if (percent >= 0.10 && percent < 0.15) return 8; // Low
    return 4; // Very low or very high
  }

  /// Sleep onset latency score (max 10 points)
  /// Optimal: 10-20 minutes
  static int _getLatencyScore(int minutes) {
    if (minutes >= 10 && minutes <= 20) return 10; // Optimal
    if (minutes < 10) return 7; // Too fast - may indicate sleep debt
    if (minutes <= 30) return 7; // Slightly long
    if (minutes <= 45) return 4; // Long
    return 2; // Very long - possible insomnia
  }

  /// Consistency bonus (max 5 points)
  /// Based on bedtime deviation from target
  static int _getConsistencyBonus(DateTime? actual, TimeOfDay? target) {
    if (actual == null || target == null) return 0;

    // Convert target to DateTime on the same day as actual
    final targetDateTime = DateTime(
      actual.year,
      actual.month,
      actual.day,
      target.hour,
      target.minute,
    );

    // Handle day boundary (e.g., target 11 PM, actual 12:30 AM next day)
    var difference = actual.difference(targetDateTime).inMinutes.abs();
    if (difference > 12 * 60) {
      // If difference > 12 hours, try next/previous day
      difference = (24 * 60 - difference).abs();
    }

    if (difference <= 15) return 5; // Within 15 minutes
    if (difference <= 30) return 3; // Within 30 minutes
    return 0; // More than 30 minutes off
  }

  /// Get a qualitative rating for the score
  static String getScoreRating(int score) {
    if (score >= 90) return 'Excellent';
    if (score >= 80) return 'Good';
    if (score >= 70) return 'Fair';
    if (score >= 60) return 'Poor';
    return 'Very Poor';
  }

  /// Get improvement suggestions based on score breakdown
  static List<String> getImprovementSuggestions(SleepScoreBreakdown breakdown) {
    final suggestions = <String>[];

    if (breakdown.durationScore < 20) {
      suggestions.add('Try to get 7-9 hours of sleep each night');
    }
    if (breakdown.efficiencyScore < 20) {
      suggestions.add('Improve sleep efficiency by limiting time in bed when awake');
    }
    if (breakdown.deepSleepScore < 15) {
      suggestions.add('Increase deep sleep with regular exercise and cooler room temperature');
    }
    if (breakdown.remScore < 12) {
      suggestions.add('Support REM sleep by maintaining consistent sleep schedule');
    }
    if (breakdown.latencyScore < 7) {
      suggestions.add('If taking too long to fall asleep, try relaxation techniques');
    }
    if (breakdown.consistencyBonus < 3) {
      suggestions.add('Keep a consistent bedtime, even on weekends');
    }

    return suggestions;
  }
}
