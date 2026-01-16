import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/calculators/macro_calculator.dart';

part 'daily_protocol.freezed.dart';
part 'daily_protocol.g.dart';

/// Represents a complete daily protocol with all targets
@freezed
class DailyProtocol with _$DailyProtocol {
  const factory DailyProtocol({
    /// Date this protocol is for
    required DateTime date,

    /// Caloric targets
    required int targetCalories,
    required int proteinGrams,
    required int carbsGrams,
    required int fatGrams,

    /// Exercise targets
    required int exerciseMinutes,
    required String workoutType,
    required int estimatedCaloriesBurn,

    /// Sleep targets
    @TimeOfDayConverter() required TimeOfDay targetBedtime,
    @TimeOfDayConverter() required TimeOfDay targetWakeTime,
    @TimeOfDayConverter() required TimeOfDay windDownStart,

    /// Eating window
    @TimeOfDayConverter() TimeOfDay? eatingWindowStart,
    @TimeOfDayConverter() TimeOfDay? eatingWindowEnd,

    /// User's ambition level this was generated for
    required String ambitionLevel,

    /// User's fitness level
    required String fitnessLevel,
  }) = _DailyProtocol;

  factory DailyProtocol.fromJson(Map<String, dynamic> json) =>
      _$DailyProtocolFromJson(json);
}

/// JSON converter for TimeOfDay
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

/// Extension to create MacroTargets from protocol
extension DailyProtocolExtension on DailyProtocol {
  MacroTargets get macroTargets => MacroTargets(
        protein: proteinGrams,
        carbs: carbsGrams,
        fat: fatGrams,
      );
}
