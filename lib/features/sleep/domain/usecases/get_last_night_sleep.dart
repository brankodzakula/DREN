import 'package:injectable/injectable.dart';

import '../entities/sleep_session.dart';
import '../repositories/sleep_repository.dart';

/// Use case to retrieve the most recent sleep session (last night's sleep)
@injectable
class GetLastNightSleep {
  final SleepRepository _repository;

  GetLastNightSleep(this._repository);

  /// Returns the most recent sleep session, or null if no data exists
  Future<SleepSession?> call() async {
    return _repository.getLastNightSleep();
  }
}
