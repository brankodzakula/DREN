import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

/// An individual exercise within a workout
@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required String muscleGroup, // chest, back, shoulders, arms, legs, core, full_body
    required int sets,
    required int reps, // 0 for time-based (use durationSeconds)
    int? durationSeconds, // For planks, cardio intervals
    required int restSeconds,
    String? videoUrl,
    String? instructions,
    List<String>? alternatives, // Swap-out options
    List<String>? contraindications, // Medical conditions to avoid
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
