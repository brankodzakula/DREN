import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_session.freezed.dart';
part 'workout_session.g.dart';

/// A completed workout session record
@freezed
class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required String id,
    required String oderId,
    String? workoutId, // null if from HealthKit
    required DateTime startTime,
    required DateTime endTime,
    required int durationMinutes,
    required int caloriesBurned,
    required String category,
    double? averageHeartRate,
    double? maxHeartRate,
    double? distanceMeters,
    required String source, // app, healthkit, health_connect
    String? externalId, // HealthKit/HC UUID
  }) = _WorkoutSession;

  factory WorkoutSession.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionFromJson(json);
}

/// Data source for workout sessions
enum WorkoutSource {
  app,
  healthkit,
  healthConnect,
}
