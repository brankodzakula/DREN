import 'package:injectable/injectable.dart';

import '../entities/sleep_schedule.dart';
import '../repositories/sleep_repository.dart';

/// Use case to retrieve the user's sleep schedule from their protocol
@injectable
class GetSleepSchedule {
  final SleepRepository _repository;

  GetSleepSchedule(this._repository);

  /// Returns the user's target sleep schedule
  Future<SleepSchedule> call() async {
    return _repository.getSleepSchedule();
  }
}
