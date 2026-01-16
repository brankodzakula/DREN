import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'workout_dao.g.dart';

@DriftAccessor(tables: [Workouts])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  WorkoutDao(super.db);

  /// Get all workouts
  Future<List<Workout>> getAllWorkouts() async {
    return select(workouts).get();
  }

  /// Get workout by ID
  Future<Workout?> getWorkoutById(String id) async {
    return (select(workouts)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Get workouts by category
  Future<List<Workout>> getWorkoutsByCategory(String category) async {
    return (select(workouts)..where((t) => t.category.equals(category))).get();
  }

  /// Get workouts by difficulty
  Future<List<Workout>> getWorkoutsByDifficulty(String difficulty) async {
    return (select(workouts)..where((t) => t.difficulty.equals(difficulty)))
        .get();
  }

  /// Insert workout
  Future<void> insertWorkout(WorkoutsCompanion workout) async {
    await into(workouts).insert(workout);
  }

  /// Insert multiple workouts
  Future<void> insertWorkouts(List<WorkoutsCompanion> workoutList) async {
    await batch((batch) {
      batch.insertAll(workouts, workoutList, mode: InsertMode.insertOrReplace);
    });
  }

  /// Search workouts by name
  Future<List<Workout>> searchWorkouts(String query) async {
    return (select(workouts)
          ..where((t) => t.name.like('%$query%'))
          ..limit(20))
        .get();
  }

  /// Get workouts suitable for user (based on difficulty and equipment)
  Future<List<Workout>> getWorkoutsForUser({
    required String difficulty,
    required List<String> availableEquipment,
  }) async {
    // Get workouts matching difficulty
    final allWorkouts =
        await (select(workouts)..where((t) => t.difficulty.equals(difficulty)))
            .get();

    // Filter by equipment (in a real app, you'd do this in SQL with JSON functions)
    // For now, return all matching difficulty
    return allWorkouts;
  }

  /// Get categories (distinct)
  Future<List<String>> getCategories() async {
    final result = await customSelect(
      'SELECT DISTINCT category FROM workouts',
      readsFrom: {workouts},
    ).get();
    return result.map((row) => row.read<String>('category')).toList();
  }
}
