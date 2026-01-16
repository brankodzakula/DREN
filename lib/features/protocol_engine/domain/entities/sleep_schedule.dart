import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_protocol.dart';

part 'sleep_schedule.freezed.dart';
part 'sleep_schedule.g.dart';

/// Complete sleep schedule with all timing cutoffs
@freezed
class SleepSchedule with _$SleepSchedule {
  const factory SleepSchedule({
    /// Target bedtime
    @TimeOfDayConverter() required TimeOfDay targetBedtime,

    /// Target wake time
    @TimeOfDayConverter() required TimeOfDay targetWakeTime,

    /// When to start wind-down routine (60 min before bed)
    @TimeOfDayConverter() required TimeOfDay windDownStart,

    /// Last caffeine cutoff (9 hours after wake)
    @TimeOfDayConverter() required TimeOfDay lastCaffeineCutoff,

    /// Last meal cutoff (3 hours before bed)
    @TimeOfDayConverter() required TimeOfDay lastMealCutoff,

    /// Stop fluids time (2.5 hours before bed)
    @TimeOfDayConverter() required TimeOfDay stopFluidsTime,

    /// Target sleep duration in hours
    @Default(8) int targetSleepHours,
  }) = _SleepSchedule;

  factory SleepSchedule.fromJson(Map<String, dynamic> json) =>
      _$SleepScheduleFromJson(json);
}

/// Extension methods for SleepSchedule
extension SleepScheduleExtension on SleepSchedule {
  /// Check if current time is within wind-down period
  bool isInWindDownPeriod(TimeOfDay currentTime) {
    final currentMinutes = currentTime.hour * 60 + currentTime.minute;
    final windDownMinutes = windDownStart.hour * 60 + windDownStart.minute;
    final bedtimeMinutes = targetBedtime.hour * 60 + targetBedtime.minute;

    // Handle day boundary
    if (windDownMinutes > bedtimeMinutes) {
      // Wind-down crosses midnight
      return currentMinutes >= windDownMinutes || currentMinutes <= bedtimeMinutes;
    }
    return currentMinutes >= windDownMinutes && currentMinutes <= bedtimeMinutes;
  }

  /// Check if it's past caffeine cutoff
  bool isPastCaffeineCutoff(TimeOfDay currentTime) {
    final currentMinutes = currentTime.hour * 60 + currentTime.minute;
    final cutoffMinutes =
        lastCaffeineCutoff.hour * 60 + lastCaffeineCutoff.minute;
    return currentMinutes >= cutoffMinutes;
  }

  /// Get minutes until bedtime from current time
  int minutesUntilBedtime(TimeOfDay currentTime) {
    final currentMinutes = currentTime.hour * 60 + currentTime.minute;
    final bedtimeMinutes = targetBedtime.hour * 60 + targetBedtime.minute;

    var diff = bedtimeMinutes - currentMinutes;
    if (diff < 0) {
      diff += 24 * 60; // Add a day if bedtime is tomorrow
    }
    return diff;
  }

  /// Format time until bedtime as human-readable string
  String formatTimeUntilBedtime(TimeOfDay currentTime) {
    final minutes = minutesUntilBedtime(currentTime);
    final hours = minutes ~/ 60;
    final mins = minutes % 60;

    if (hours > 0 && mins > 0) {
      return '${hours}h ${mins}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${mins}m';
    }
  }
}
