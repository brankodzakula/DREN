import '../entities/sleep_session.dart';
import '../entities/sleep_habit_log.dart';
import '../entities/meditation.dart';
import '../entities/sleep_schedule.dart';

/// Repository interface for sleep-related data operations
abstract class SleepRepository {
  /// Get the most recent sleep session (last night's sleep)
  Future<SleepSession?> getLastNightSleep();

  /// Get sleep sessions for a date range
  Future<List<SleepSession>> getSleepSessions({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get sleep session for a specific date
  Future<SleepSession?> getSleepSessionForDate(DateTime date);

  /// Save a sleep session
  Future<void> saveSleepSession(SleepSession session);

  /// Delete a sleep session
  Future<void> deleteSleepSession(String id);

  /// Get the user's sleep schedule from their protocol
  Future<SleepSchedule> getSleepSchedule();

  /// Get sleep habit log for a specific date
  Future<SleepHabitLog?> getSleepHabitLog(DateTime date);

  /// Save or update sleep habit log
  Future<void> saveSleepHabitLog(SleepHabitLog log);

  /// Toggle a specific habit in the log
  Future<SleepHabitLog> toggleHabit({
    required DateTime date,
    required String habitName,
    required bool value,
  });

  /// Get all available meditations
  Future<List<Meditation>> getMeditations();

  /// Get meditations by category
  Future<List<Meditation>> getMeditationsByCategory(String category);

  /// Get a specific meditation by ID
  Future<Meditation?> getMeditationById(String id);

  /// Mark a meditation as downloaded
  Future<void> markMeditationDownloaded(String id, bool downloaded);

  /// Get weekly sleep statistics
  Future<WeeklySleepStats> getWeeklySleepStats(DateTime weekStart);

  /// Get average sleep score for last N days
  Future<double> getAverageSleepScore(int days);
}

/// Weekly sleep statistics summary
class WeeklySleepStats {
  final DateTime weekStart;
  final double avgSleepHours;
  final double avgSleepScore;
  final int totalSleepSessions;
  final double avgEfficiency;
  final int avgDeepSleepMinutes;
  final int avgRemSleepMinutes;

  const WeeklySleepStats({
    required this.weekStart,
    required this.avgSleepHours,
    required this.avgSleepScore,
    required this.totalSleepSessions,
    required this.avgEfficiency,
    required this.avgDeepSleepMinutes,
    required this.avgRemSleepMinutes,
  });
}
