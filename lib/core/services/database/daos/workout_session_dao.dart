import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'workout_session_dao.g.dart';

@DriftAccessor(tables: [WorkoutSessions])
class WorkoutSessionDao extends DatabaseAccessor<AppDatabase>
    with _$WorkoutSessionDaoMixin {
  WorkoutSessionDao(super.db);

  /// Get workout sessions for a specific date
  Future<List<WorkoutSession>> getSessionsForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(workoutSessions)
          ..where((t) => t.startTime.isBetweenValues(startOfDay, endOfDay))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  /// Get today's workout sessions
  Future<List<WorkoutSession>> getTodaySessions() async {
    return getSessionsForDate(DateTime.now());
  }

  /// Insert workout session
  Future<void> insertSession(WorkoutSessionsCompanion session) async {
    await into(workoutSessions).insert(session);
  }

  /// Update workout session
  Future<void> updateSession(WorkoutSessionsCompanion session) async {
    await into(workoutSessions).insertOnConflictUpdate(session);
  }

  /// Delete workout session
  Future<void> deleteSession(String id) async {
    await (delete(workoutSessions)..where((t) => t.id.equals(id))).go();
  }

  /// Get total exercise minutes for date
  Future<int> getTotalMinutesForDate(DateTime date) async {
    final sessions = await getSessionsForDate(date);
    return sessions.fold<int>(0, (sum, session) => sum + session.durationMinutes);
  }

  /// Get total calories burned for date
  Future<int> getTotalCaloriesBurnedForDate(DateTime date) async {
    final sessions = await getSessionsForDate(date);
    return sessions.fold<int>(0, (sum, session) => sum + session.caloriesBurned);
  }

  /// Get sessions in date range
  Future<List<WorkoutSession>> getSessionsInRange(
      DateTime start, DateTime end) async {
    return (select(workoutSessions)
          ..where((t) => t.startTime.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  /// Check if external workout already exists (for deduplication)
  Future<bool> externalWorkoutExists(String externalId) async {
    final existing = await (select(workoutSessions)
          ..where((t) => t.externalId.equals(externalId)))
        .getSingleOrNull();
    return existing != null;
  }

  /// Get sessions by category
  Future<List<WorkoutSession>> getSessionsByCategory(String category) async {
    return (select(workoutSessions)
          ..where((t) => t.category.equals(category))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .get();
  }
}
