import 'package:injectable/injectable.dart';

import '../entities/workout_session.dart';
import '../repositories/exercise_repository.dart';

/// Use case to log a completed workout session
@injectable
class LogWorkoutSession {
  final ExerciseRepository _repository;

  LogWorkoutSession(this._repository);

  /// Log a completed workout session
  Future<void> call(WorkoutSession session) async {
    return _repository.logWorkoutSession(session);
  }

  /// Get workout history for a date range
  Future<List<WorkoutSession>> getHistory({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return _repository.getWorkoutHistory(
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Get workout sessions for today
  Future<List<WorkoutSession>> getTodaySessions() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    return _repository.getWorkoutSessionsForDate(startOfDay);
  }

  /// Get the most recent workout session
  Future<WorkoutSession?> getLastSession() async {
    return _repository.getLastWorkoutSession();
  }

  /// Delete a workout session
  Future<void> delete(String sessionId) async {
    return _repository.deleteWorkoutSession(sessionId);
  }

  /// Get total workout minutes for a date range
  Future<int> getTotalMinutes({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _repository.getTotalWorkoutMinutes(
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Get total calories burned for a date range
  Future<int> getTotalCaloriesBurned({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _repository.getTotalCaloriesBurned(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
