import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'daily_progress_dao.g.dart';

@DriftAccessor(tables: [DailyProgressEntries])
class DailyProgressDao extends DatabaseAccessor<AppDatabase>
    with _$DailyProgressDaoMixin {
  DailyProgressDao(super.db);

  /// Get progress for a specific date
  Future<DailyProgressEntry?> getProgressForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(dailyProgressEntries)
          ..where((t) => t.date.isBetweenValues(startOfDay, endOfDay)))
        .getSingleOrNull();
  }

  /// Get today's progress
  Future<DailyProgressEntry?> getTodayProgress() async {
    return getProgressForDate(DateTime.now());
  }

  /// Insert or update progress
  Future<void> upsertProgress(DailyProgressEntriesCompanion progress) async {
    await into(dailyProgressEntries).insertOnConflictUpdate(progress);
  }

  /// Get progress for date range
  Future<List<DailyProgressEntry>> getProgressInRange(
      DateTime start, DateTime end) async {
    return (select(dailyProgressEntries)
          ..where((t) => t.date.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  /// Get last 7 days progress
  Future<List<DailyProgressEntry>> getLastWeekProgress() async {
    final start = DateTime.now().subtract(const Duration(days: 7));
    return getProgressInRange(start, DateTime.now());
  }

  /// Get last 30 days progress
  Future<List<DailyProgressEntry>> getLastMonthProgress() async {
    final start = DateTime.now().subtract(const Duration(days: 30));
    return getProgressInRange(start, DateTime.now());
  }

  /// Calculate average calories consumed for last N days
  Future<double> getAverageCaloriesConsumed(int days) async {
    final start = DateTime.now().subtract(Duration(days: days));
    final progress = await getProgressInRange(start, DateTime.now());
    if (progress.isEmpty) return 0;
    return progress.map((p) => p.caloriesConsumed).reduce((a, b) => a + b) /
        progress.length;
  }

  /// Calculate average exercise minutes for last N days
  Future<double> getAverageExerciseMinutes(int days) async {
    final start = DateTime.now().subtract(Duration(days: days));
    final progress = await getProgressInRange(start, DateTime.now());
    if (progress.isEmpty) return 0;
    return progress.map((p) => p.exerciseMinutes).reduce((a, b) => a + b) /
        progress.length;
  }

  /// Get weight trend (last weight - first weight in range)
  Future<double?> getWeightTrend(int days) async {
    final start = DateTime.now().subtract(Duration(days: days));
    final progress = await (select(dailyProgressEntries)
          ..where((t) =>
              t.date.isBetweenValues(start, DateTime.now()) &
              t.weightKg.isNotNull())
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();

    if (progress.length < 2) return null;
    final first = progress.first.weightKg;
    final last = progress.last.weightKg;
    if (first == null || last == null) return null;
    return last - first;
  }

  /// Delete old progress entries (older than 90 days)
  Future<void> deleteOldProgress() async {
    final cutoff = DateTime.now().subtract(const Duration(days: 90));
    await (delete(dailyProgressEntries)
          ..where((t) => t.date.isSmallerThanValue(cutoff)))
        .go();
  }
}
