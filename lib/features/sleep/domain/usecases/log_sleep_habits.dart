import 'package:injectable/injectable.dart';

import '../entities/sleep_habit_log.dart';
import '../repositories/sleep_repository.dart';

/// Use case to log and manage sleep hygiene habits
@injectable
class LogSleepHabits {
  final SleepRepository _repository;

  LogSleepHabits(this._repository);

  /// Get sleep habits for a specific date
  Future<SleepHabitLog?> getForDate(DateTime date) async {
    return _repository.getSleepHabitLog(date);
  }

  /// Save a complete sleep habit log
  Future<void> save(SleepHabitLog log) async {
    return _repository.saveSleepHabitLog(log);
  }

  /// Toggle a specific habit
  Future<SleepHabitLog> toggleHabit({
    required DateTime date,
    required String habitName,
    required bool value,
  }) async {
    return _repository.toggleHabit(
      date: date,
      habitName: habitName,
      value: value,
    );
  }
}
