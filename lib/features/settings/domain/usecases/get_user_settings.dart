import 'package:injectable/injectable.dart';

import '../entities/user_settings.dart';
import '../repositories/settings_repository.dart';

/// Use case for getting current user settings
@injectable
class GetUserSettings {
  final SettingsRepository _repository;

  GetUserSettings(this._repository);

  Future<UserSettings?> call() => _repository.getUserSettings();
}
