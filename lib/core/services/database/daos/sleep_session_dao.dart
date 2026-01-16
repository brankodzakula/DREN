import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'sleep_session_dao.g.dart';

@DriftAccessor(tables: [SleepSessions, SleepHabitLogs])
class SleepSessionDao extends DatabaseAccessor<AppDatabase>
    with _$SleepSessionDaoMixin {
  SleepSessionDao(super.db);

  /// Get sleep session for a specific night (woke up on this date)
  Future<SleepSession?> getSleepForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(sleepSessions)
          ..where((t) => t.wakeTime.isBetweenValues(startOfDay, endOfDay)))
        .getSingleOrNull();
  }

  /// Get last night's sleep
  Future<SleepSession?> getLastNightSleep() async {
    return getSleepForDate(DateTime.now());
  }

  /// Insert sleep session
  Future<void> insertSession(SleepSessionsCompanion session) async {
    await into(sleepSessions).insert(session);
  }

  /// Update sleep session
  Future<void> updateSession(SleepSessionsCompanion session) async {
    await into(sleepSessions).insertOnConflictUpdate(session);
  }

  /// Delete sleep session
  Future<void> deleteSession(String id) async {
    await (delete(sleepSessions)..where((t) => t.id.equals(id))).go();
  }

  /// Get sleep sessions in date range
  Future<List<SleepSession>> getSessionsInRange(
      DateTime start, DateTime end) async {
    return (select(sleepSessions)
          ..where((t) => t.wakeTime.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.wakeTime)]))
        .get();
  }

  /// Get average sleep score for last N days
  Future<double> getAverageSleepScore(int days) async {
    final start = DateTime.now().subtract(Duration(days: days));
    final sessions = await getSessionsInRange(start, DateTime.now());
    if (sessions.isEmpty) return 0;
    return sessions.map((s) => s.sleepScore).reduce((a, b) => a + b) /
        sessions.length;
  }

  /// Get average sleep duration for last N days
  Future<double> getAverageSleepHours(int days) async {
    final start = DateTime.now().subtract(Duration(days: days));
    final sessions = await getSessionsInRange(start, DateTime.now());
    if (sessions.isEmpty) return 0;
    return sessions.map((s) => s.totalMinutes / 60).reduce((a, b) => a + b) /
        sessions.length;
  }

  // Sleep Habit Log methods

  /// Get habit log for date
  Future<SleepHabitLog?> getHabitLogForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(sleepHabitLogs)
          ..where((t) => t.date.isBetweenValues(startOfDay, endOfDay)))
        .getSingleOrNull();
  }

  /// Insert or update habit log
  Future<void> upsertHabitLog(SleepHabitLogsCompanion log) async {
    await into(sleepHabitLogs).insertOnConflictUpdate(log);
  }

  /// Get tonight's habit log
  Future<SleepHabitLog?> getTonightHabitLog() async {
    return getHabitLogForDate(DateTime.now());
  }
}
