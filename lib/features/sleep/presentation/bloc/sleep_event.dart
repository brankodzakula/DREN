import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_event.freezed.dart';

@freezed
class SleepEvent with _$SleepEvent {
  /// Load all sleep data (last night, schedule, habits, meditations)
  const factory SleepEvent.loadSleep() = LoadSleep;

  /// Refresh sleep data
  const factory SleepEvent.refresh() = RefreshSleep;

  /// Toggle a sleep habit checkbox
  const factory SleepEvent.toggleHabit({
    required String habitName,
    required bool value,
  }) = ToggleHabit;

  /// Start playing a meditation
  const factory SleepEvent.startMeditation({
    required String meditationId,
  }) = StartMeditation;

  /// Stop the currently playing meditation
  const factory SleepEvent.stopMeditation() = StopMeditation;

  /// Filter meditations by category
  const factory SleepEvent.filterByCategory({
    String? category,
  }) = FilterByCategory;

  /// Mark meditation as completed
  const factory SleepEvent.completeMeditation({
    required String meditationId,
  }) = CompleteMeditation;

  /// Update bedtime countdown timer
  const factory SleepEvent.updateBedtimeCountdown() = UpdateBedtimeCountdown;

  /// Sync sleep data from health platform (HealthKit/Health Connect)
  const factory SleepEvent.syncHealthSleep() = SyncHealthSleep;
}
