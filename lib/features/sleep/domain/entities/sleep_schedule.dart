import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_schedule.freezed.dart';
part 'sleep_schedule.g.dart';

/// Custom JSON converter for TimeOfDay
class TimeOfDayConverter implements JsonConverter<TimeOfDay, Map<String, dynamic>> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(Map<String, dynamic> json) {
    return TimeOfDay(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson(TimeOfDay time) {
    return {
      'hour': time.hour,
      'minute': time.minute,
    };
  }
}

/// Represents the user's sleep schedule from their protocol
@freezed
class SleepSchedule with _$SleepSchedule {
  const factory SleepSchedule({
    @TimeOfDayConverter() required TimeOfDay targetBedtime,
    @TimeOfDayConverter() required TimeOfDay targetWakeTime,
    required int targetSleepMinutes,
    @TimeOfDayConverter() required TimeOfDay windDownStart,
    @TimeOfDayConverter() required TimeOfDay lastCaffeineCutoff,
    @TimeOfDayConverter() required TimeOfDay lastMealCutoff,
  }) = _SleepSchedule;

  factory SleepSchedule.fromJson(Map<String, dynamic> json) =>
      _$SleepScheduleFromJson(json);
}
