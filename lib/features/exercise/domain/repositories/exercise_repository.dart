import '../entities/entities.dart';

/// Repository interface for exercise-related operations
abstract class ExerciseRepository {
  /// Get all available workouts from the exercise library
  Future<List<Workout>> getExerciseLibrary();

  /// Get workouts filtered by category
  Future<List<Workout>> getWorkoutsByCategory(String category);

  /// Get workouts filtered by difficulty level
  Future<List<Workout>> getWorkoutsByDifficulty(String difficulty);

  /// Get a specific workout by ID
  Future<Workout?> getWorkoutById(String id);

  /// Get today's scheduled workout based on user's protocol
  Future<Workout?> getTodayWorkout();

  /// Get all individual exercises
  Future<List<Exercise>> getAllExercises();

  /// Get exercises by muscle group
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup);

  /// Get alternative exercises for a given exercise
  Future<List<Exercise>> getAlternatives(String exerciseId);

  /// Log a completed workout session
  Future<void> logWorkoutSession(WorkoutSession session);

  /// Get workout history for a date range
  Future<List<WorkoutSession>> getWorkoutHistory({
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get workout sessions for a specific date
  Future<List<WorkoutSession>> getWorkoutSessionsForDate(DateTime date);

  /// Get the most recent workout session
  Future<WorkoutSession?> getLastWorkoutSession();

  /// Delete a workout session
  Future<void> deleteWorkoutSession(String sessionId);

  /// Get total workout minutes for a date range
  Future<int> getTotalWorkoutMinutes({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get total calories burned for a date range
  Future<int> getTotalCaloriesBurned({
    required DateTime startDate,
    required DateTime endDate,
  });
}
