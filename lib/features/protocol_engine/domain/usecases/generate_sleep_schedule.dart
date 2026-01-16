import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../entities/sleep_schedule.dart';

/// Use case for generating a complete sleep schedule
@injectable
class GenerateSleepSchedule {
  /// Default target sleep duration in hours
  static const int defaultTargetHours = 8;

  /// Sleep latency buffer in minutes (time to fall asleep)
  static const int latencyBufferMinutes = 15;

  /// Wind-down period before bedtime in minutes
  static const int windDownMinutes = 60;

  /// Hours after wake for caffeine cutoff
  static const int caffeineCutoffHoursAfterWake = 9;

  /// Hours before bed for last meal
  static const int lastMealHoursBeforeBed = 3;

  /// Hours before bed to stop fluids
  static const double stopFluidsHoursBeforeBed = 2.5;

  /// Generate a complete sleep schedule based on wake time
  ///
  /// [wakeTime] - Desired wake time
  /// [targetHours] - Target sleep duration (default: 8 hours)
  SleepSchedule call(TimeOfDay wakeTime, {int targetHours = defaultTargetHours}) {
    // Calculate bedtime (wake time - sleep duration - latency buffer)
    final totalSleepMinutes = targetHours * 60;
    final bedtimeMinutes =
        _subtractMinutes(wakeTime, totalSleepMinutes + latencyBufferMinutes);
    final bedtime = _minutesToTimeOfDay(bedtimeMinutes);

    // Wind-down starts 60 minutes before bedtime
    final windDownMinutesTotal = _subtractMinutes(bedtime, windDownMinutes);
    final windDownStart = _minutesToTimeOfDay(windDownMinutesTotal);

    // Last caffeine: 9 hours after wake (or before 2 PM, whichever is earlier)
    final caffeineMinutesFromWake =
        _addMinutes(wakeTime, caffeineCutoffHoursAfterWake * 60);
    final twoPm = 14 * 60; // 2:00 PM in minutes
    final lastCaffeineMinutes =
        caffeineMinutesFromWake < twoPm ? caffeineMinutesFromWake : twoPm;
    final lastCaffeine = _minutesToTimeOfDay(lastCaffeineMinutes);

    // Last meal: 3 hours before bedtime
    final lastMealMinutes =
        _subtractMinutes(bedtime, lastMealHoursBeforeBed * 60);
    final lastMeal = _minutesToTimeOfDay(lastMealMinutes);

    // Stop fluids: 2.5 hours before bed
    final stopFluidsMinutes =
        _subtractMinutes(bedtime, (stopFluidsHoursBeforeBed * 60).round());
    final stopFluids = _minutesToTimeOfDay(stopFluidsMinutes);

    return SleepSchedule(
      targetBedtime: bedtime,
      targetWakeTime: wakeTime,
      windDownStart: windDownStart,
      lastCaffeineCutoff: lastCaffeine,
      lastMealCutoff: lastMeal,
      stopFluidsTime: stopFluids,
      targetSleepHours: targetHours,
    );
  }

  /// Convert TimeOfDay to minutes since midnight
  int _timeOfDayToMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  /// Convert minutes since midnight to TimeOfDay
  TimeOfDay _minutesToTimeOfDay(int minutes) {
    // Handle negative values (previous day)
    var normalizedMinutes = minutes % (24 * 60);
    if (normalizedMinutes < 0) {
      normalizedMinutes += 24 * 60;
    }

    final hours = normalizedMinutes ~/ 60;
    final mins = normalizedMinutes % 60;
    return TimeOfDay(hour: hours, minute: mins);
  }

  /// Subtract minutes from a TimeOfDay, returning minutes since midnight
  int _subtractMinutes(TimeOfDay time, int minutes) {
    return _timeOfDayToMinutes(time) - minutes;
  }

  /// Add minutes to a TimeOfDay, returning minutes since midnight
  int _addMinutes(TimeOfDay time, int minutes) {
    return _timeOfDayToMinutes(time) + minutes;
  }
}

/// Extension to format TimeOfDay as readable string
extension TimeOfDayFormatting on TimeOfDay {
  /// Format as 12-hour time with AM/PM
  String format12Hour() {
    final hourIn12 = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final minuteStr = minute.toString().padLeft(2, '0');
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hourIn12:$minuteStr $period';
  }

  /// Format as 24-hour time
  String format24Hour() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }
}
