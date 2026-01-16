import 'package:injectable/injectable.dart';

import '../entities/sleep_session.dart';
import '../repositories/sleep_repository.dart';

/// Use case to save a sleep session
@injectable
class SaveSleepSession {
  final SleepRepository _repository;

  SaveSleepSession(this._repository);

  /// Save a new sleep session to the database
  Future<void> call(SleepSession session) async {
    return _repository.saveSleepSession(session);
  }
}
