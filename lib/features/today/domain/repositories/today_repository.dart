import '../entities/daily_progress.dart';
import '../../../protocol_engine/domain/entities/daily_protocol.dart';

/// Repository interface for Today feature data operations
abstract class TodayRepository {
  /// Get progress for a specific date
  Future<DailyProgress?> getProgressForDate(DateTime date);

  /// Get today's progress
  Future<DailyProgress> getTodayProgress();

  /// Get the protocol for a specific date
  Future<DailyProtocol?> getProtocolForDate(DateTime date);

  /// Get today's protocol
  Future<DailyProtocol?> getTodayProtocol();

  /// Save/update daily progress
  Future<void> saveProgress(DailyProgress progress);

  /// Save/update daily protocol
  Future<void> saveProtocol(DailyProtocol protocol);

  /// Get progress for the last N days
  Future<List<DailyProgress>> getProgressHistory(int days);

  /// Update specific progress field (calories consumed, exercise minutes, etc.)
  Future<void> updateCaloriesConsumed(DateTime date, int calories);
  Future<void> updateCaloriesBurned(DateTime date, int calories);
  Future<void> updateExerciseMinutes(DateTime date, int minutes);
  Future<void> updateSleepMinutes(DateTime date, int minutes);
  Future<void> updateMacros(
      DateTime date, double protein, double carbs, double fat);
  Future<void> updateSteps(DateTime date, int steps);
  Future<void> updateWeight(DateTime date, double? weightKg);
}
