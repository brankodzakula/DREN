import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_habit_log.freezed.dart';
part 'sleep_habit_log.g.dart';

/// Log of sleep hygiene habits for a given date
@freezed
class SleepHabitLog with _$SleepHabitLog {
  const factory SleepHabitLog({
    required String id,
    required String oderId,
    required DateTime date,
    required bool noCaffeineAfterCutoff,
    required bool lastMealOnTime,
    required bool screenFreeBeforeBed,
    required bool roomTempOptimal,
    required bool meditationCompleted,
    String? notes,
  }) = _SleepHabitLog;

  factory SleepHabitLog.fromJson(Map<String, dynamic> json) =>
      _$SleepHabitLogFromJson(json);
}
