import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/health_service.dart';
import '../../domain/entities/entities.dart';

part 'exercise_state.freezed.dart';

/// State for the Exercise BLoC
@freezed
class ExerciseState with _$ExerciseState {
  /// Initial state before any data is loaded
  const factory ExerciseState.initial() = ExerciseInitial;

  /// Loading state while fetching exercise data
  const factory ExerciseState.loading() = ExerciseLoading;

  /// Loaded state with all exercise data
  const factory ExerciseState.loaded({
    /// Today's scheduled workout (null if rest day)
    Workout? todayWorkout,

    /// All available workout categories
    required List<String> categories,

    /// All workouts in the library
    required List<Workout> workouts,

    /// All individual exercises
    required List<Exercise> exercises,

    /// Recent workout history
    required List<WorkoutSession> history,

    /// Currently active workout session (null if not working out)
    Workout? activeWorkout,

    /// Index of current exercise in active workout
    @Default(0) int currentExerciseIndex,

    /// Current set number for active exercise
    @Default(1) int currentSet,

    /// Whether a workout is currently in progress
    @Default(false) bool isWorkoutInProgress,

    /// Workout start time (for tracking duration)
    DateTime? workoutStartTime,

    /// External workouts synced from health platform
    @Default([]) List<HealthWorkoutData> externalWorkouts,
  }) = ExerciseLoaded;

  /// Error state
  const factory ExerciseState.error({
    required String message,
  }) = ExerciseError;
}
