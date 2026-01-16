import 'package:freezed_annotation/freezed_annotation.dart';

import 'exercise.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

/// A complete workout routine with exercises
@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required String category, // strength, hiit, running, yoga, core, cycling, swimming
    required int durationMinutes,
    required String difficulty, // beginner, intermediate, advanced
    required List<String> equipmentRequired,
    required int estimatedCalories,
    required List<Exercise> exercises,
    String? videoUrl,
    String? thumbnailUrl,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

/// Workout category types
enum WorkoutCategory {
  strength,
  hiit,
  running,
  yoga,
  core,
  cycling,
  swimming,
}

/// Difficulty levels for workouts
enum DifficultyLevel {
  beginner,
  intermediate,
  advanced,
}
