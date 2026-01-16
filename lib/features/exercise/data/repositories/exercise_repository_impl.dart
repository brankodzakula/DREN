import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../datasources/exercise_local_datasource.dart';
import '../datasources/workout_session_datasource.dart';

@LazySingleton(as: ExerciseRepository)
class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseLocalDataSource _localDataSource;
  final WorkoutSessionDataSource _sessionDataSource;

  ExerciseRepositoryImpl(
    this._localDataSource,
    this._sessionDataSource,
  );

  @override
  Future<List<Workout>> getExerciseLibrary() async {
    return _localDataSource.loadWorkouts();
  }

  @override
  Future<List<Workout>> getWorkoutsByCategory(String category) async {
    final workouts = await _localDataSource.loadWorkouts();
    return workouts.where((w) => w.category == category).toList();
  }

  @override
  Future<List<Workout>> getWorkoutsByDifficulty(String difficulty) async {
    final workouts = await _localDataSource.loadWorkouts();
    return workouts.where((w) => w.difficulty == difficulty).toList();
  }

  @override
  Future<Workout?> getWorkoutById(String id) async {
    final workouts = await _localDataSource.loadWorkouts();
    try {
      return workouts.firstWhere((w) => w.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Workout?> getTodayWorkout() async {
    // For now, return a workout based on the day of week
    // This could be enhanced to use the user's protocol/schedule
    final workouts = await _localDataSource.loadWorkouts();
    if (workouts.isEmpty) return null;

    final dayOfWeek = DateTime.now().weekday;

    // Simple rotation based on day of week
    // Monday (1): Strength
    // Tuesday (2): HIIT
    // Wednesday (3): Core
    // Thursday (4): Strength
    // Friday (5): HIIT
    // Saturday (6): Yoga
    // Sunday (7): Rest (Active Recovery)
    final categories = {
      1: 'strength',
      2: 'hiit',
      3: 'core',
      4: 'strength',
      5: 'hiit',
      6: 'yoga',
      7: 'yoga', // Rest day - light yoga
    };

    final targetCategory = categories[dayOfWeek] ?? 'strength';
    final categoryWorkouts =
        workouts.where((w) => w.category == targetCategory).toList();

    if (categoryWorkouts.isEmpty) return workouts.first;

    // Return intermediate difficulty if available, otherwise first match
    final intermediate = categoryWorkouts
        .where((w) => w.difficulty == 'intermediate')
        .toList();
    if (intermediate.isNotEmpty) return intermediate.first;

    return categoryWorkouts.first;
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    return _localDataSource.loadExercises();
  }

  @override
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) async {
    final exercises = await _localDataSource.loadExercises();
    return exercises.where((e) => e.muscleGroup == muscleGroup).toList();
  }

  @override
  Future<List<Exercise>> getAlternatives(String exerciseId) async {
    final exercises = await _localDataSource.loadExercises();
    try {
      final exercise = exercises.firstWhere((e) => e.id == exerciseId);
      final alternativeIds = exercise.alternatives ?? [];
      return exercises.where((e) => alternativeIds.contains(e.id)).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> logWorkoutSession(WorkoutSession session) async {
    await _sessionDataSource.insertSession(session);
  }

  @override
  Future<List<WorkoutSession>> getWorkoutHistory({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final start =
        startDate ?? DateTime.now().subtract(const Duration(days: 30));
    final end = endDate ?? DateTime.now();
    return _sessionDataSource.getSessionsInRange(start, end);
  }

  @override
  Future<List<WorkoutSession>> getWorkoutSessionsForDate(DateTime date) async {
    return _sessionDataSource.getSessionsForDate(date);
  }

  @override
  Future<WorkoutSession?> getLastWorkoutSession() async {
    return _sessionDataSource.getLastSession();
  }

  @override
  Future<void> deleteWorkoutSession(String sessionId) async {
    await _sessionDataSource.deleteSession(sessionId);
  }

  @override
  Future<int> getTotalWorkoutMinutes({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final sessions =
        await _sessionDataSource.getSessionsInRange(startDate, endDate);
    return sessions.fold<int>(0, (sum, s) => sum + s.durationMinutes);
  }

  @override
  Future<int> getTotalCaloriesBurned({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final sessions =
        await _sessionDataSource.getSessionsInRange(startDate, endDate);
    return sessions.fold<int>(0, (sum, s) => sum + s.caloriesBurned);
  }
}
