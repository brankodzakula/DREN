import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_event.freezed.dart';

/// Events for the Today feature BLoC
@freezed
class TodayEvent with _$TodayEvent {
  /// Load today's data (protocol, progress, rings)
  const factory TodayEvent.loadToday() = LoadToday;

  /// Refresh today's data (pull-to-refresh)
  const factory TodayEvent.refresh() = RefreshToday;

  /// Update calories consumed (after logging a meal)
  const factory TodayEvent.updateCaloriesConsumed(int calories) =
      UpdateCaloriesConsumed;

  /// Update calories burned (after logging exercise)
  const factory TodayEvent.updateCaloriesBurned(int calories) =
      UpdateCaloriesBurned;

  /// Update exercise minutes
  const factory TodayEvent.updateExerciseMinutes(int minutes) =
      UpdateExerciseMinutes;

  /// Update sleep minutes (from last night)
  const factory TodayEvent.updateSleepMinutes(int minutes) = UpdateSleepMinutes;

  /// Update macros (protein, carbs, fat)
  const factory TodayEvent.updateMacros({
    required double protein,
    required double carbs,
    required double fat,
  }) = UpdateMacros;

  /// Update step count
  const factory TodayEvent.updateSteps(int steps) = UpdateSteps;

  /// Log today's weight
  const factory TodayEvent.updateWeight(double? weightKg) = UpdateWeight;

  /// Regenerate protocol (e.g., after profile update)
  const factory TodayEvent.regenerateProtocol() = RegenerateProtocol;

  /// Sync data from health platform (HealthKit/Health Connect)
  const factory TodayEvent.syncHealthData() = SyncHealthData;
}
