import 'package:injectable/injectable.dart';

import '../entities/daily_progress.dart';
import '../entities/ring_summary.dart';
import '../repositories/today_repository.dart';
import '../../../protocol_engine/domain/entities/daily_protocol.dart';

/// Use case to get daily progress and ring summary
@injectable
class GetDailyProgress {
  final TodayRepository _repository;

  GetDailyProgress(this._repository);

  /// Get progress for today
  Future<DailyProgress> call() async {
    return _repository.getTodayProgress();
  }

  /// Get progress for a specific date
  Future<DailyProgress?> forDate(DateTime date) async {
    return _repository.getProgressForDate(date);
  }

  /// Get ring summary combining progress with protocol targets
  Future<RingSummary> getRingSummary({DateTime? date}) async {
    final targetDate = date ?? DateTime.now();

    final progress = await (date != null
        ? _repository.getProgressForDate(date)
        : _repository.getTodayProgress());

    final protocol = await _repository.getProtocolForDate(targetDate);

    if (progress == null) {
      return RingSummary.empty();
    }

    // Use protocol targets if available, otherwise use defaults
    final targetCalories = protocol?.targetCalories ?? 2000;
    final targetCaloriesBurn = protocol?.estimatedCaloriesBurn ?? 300;
    final targetExerciseMinutes = protocol?.exerciseMinutes ?? 45;
    // Default 8 hours sleep target
    const targetSleepMinutes = 8 * 60;

    return RingSummary.fromProgressAndTargets(
      caloriesConsumed: progress.caloriesConsumed,
      targetCalories: targetCalories,
      caloriesBurned: progress.caloriesBurned,
      targetCaloriesBurn: targetCaloriesBurn,
      exerciseMinutes: progress.exerciseMinutes,
      targetExerciseMinutes: targetExerciseMinutes,
      sleepMinutes: progress.sleepMinutes,
      targetSleepMinutes: targetSleepMinutes,
    );
  }

  /// Get progress history for the last N days
  Future<List<DailyProgress>> getHistory({int days = 7}) async {
    return _repository.getProgressHistory(days);
  }
}

/// Result combining progress and protocol
class DailyProgressWithProtocol {
  final DailyProgress progress;
  final DailyProtocol? protocol;
  final RingSummary rings;

  const DailyProgressWithProtocol({
    required this.progress,
    this.protocol,
    required this.rings,
  });
}
