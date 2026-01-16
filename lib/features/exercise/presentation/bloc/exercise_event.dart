import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'exercise_event.freezed.dart';

/// Events for the Exercise BLoC
@freezed
class ExerciseEvent with _$ExerciseEvent {
  /// Load all exercise data (workouts, exercises, history)
  const factory ExerciseEvent.loadExercises() = LoadExercises;

  /// Refresh exercise data
  const factory ExerciseEvent.refresh() = RefreshExercises;

  /// Start a workout session
  const factory ExerciseEvent.startWorkout({
    required Workout workout,
  }) = StartWorkout;

  /// Complete the current set
  const factory ExerciseEvent.completeSet() = CompleteSet;

  /// Skip to the next exercise
  const factory ExerciseEvent.skipExercise() = SkipExercise;

  /// Move to the next exercise after completing all sets
  const factory ExerciseEvent.nextExercise() = NextExercise;

  /// Complete the entire workout
  const factory ExerciseEvent.completeWorkout() = CompleteWorkout;

  /// Cancel the current workout
  const factory ExerciseEvent.cancelWorkout() = CancelWorkout;

  /// Swap an exercise for an alternative
  const factory ExerciseEvent.swapExercise({
    required int exerciseIndex,
    required Exercise newExercise,
  }) = SwapExercise;

  /// Filter workouts by category
  const factory ExerciseEvent.filterByCategory({
    String? category,
  }) = FilterByCategory;

  /// Filter workouts by difficulty
  const factory ExerciseEvent.filterByDifficulty({
    String? difficulty,
  }) = FilterByDifficulty;

  /// Sync workouts from health platform (HealthKit/Health Connect)
  const factory ExerciseEvent.syncHealthWorkouts() = SyncHealthWorkouts;
}
