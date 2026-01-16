import 'package:injectable/injectable.dart';

import '../entities/sleep_session.dart';
import '../repositories/sleep_repository.dart';

export '../repositories/sleep_repository.dart' show WeeklySleepStats;

/// Use case to retrieve sleep history for a date range
@injectable
class GetSleepHistory {
  final SleepRepository _repository;

  GetSleepHistory(this._repository);

  /// Get sleep sessions for a specific date range
  Future<List<SleepSession>> call({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _repository.getSleepSessions(
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Get sleep session for a specific date
  Future<SleepSession?> forDate(DateTime date) async {
    return _repository.getSleepSessionForDate(date);
  }

  /// Get weekly statistics
  Future<WeeklySleepStats> getWeeklyStats(DateTime weekStart) async {
    return _repository.getWeeklySleepStats(weekStart);
  }

  /// Get average sleep score for last N days
  Future<double> getAverageScore(int days) async {
    return _repository.getAverageSleepScore(days);
  }
}
