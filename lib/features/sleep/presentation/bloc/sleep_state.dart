import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/meditation.dart';
import '../../domain/entities/sleep_habit_log.dart';
import '../../domain/entities/sleep_schedule.dart';
import '../../domain/entities/sleep_session.dart';

part 'sleep_state.freezed.dart';

@freezed
class SleepState with _$SleepState {
  /// Initial state before any data is loaded
  const factory SleepState.initial() = SleepInitial;

  /// Loading state while fetching sleep data
  const factory SleepState.loading() = SleepLoading;

  /// Loaded state with all sleep data
  const factory SleepState.loaded({
    /// Last night's sleep session (may be null if no data)
    SleepSession? lastNight,

    /// User's sleep schedule from protocol
    required SleepSchedule schedule,

    /// Tonight's sleep habit checklist
    SleepHabitLog? todayHabits,

    /// Available meditations grouped by category
    required List<Meditation> meditations,

    /// Currently selected meditation category filter
    String? selectedCategory,

    /// Currently playing meditation (if any)
    Meditation? playingMeditation,

    /// Average sleep score for last 7 days
    @Default(0.0) double averageSleepScore,

    /// Time until bedtime in minutes (null if past bedtime)
    int? minutesToBedtime,

    /// Whether wind-down period has started
    @Default(false) bool isWindDownActive,
  }) = SleepLoaded;

  /// Error state
  const factory SleepState.error({
    required String message,
  }) = SleepError;
}
