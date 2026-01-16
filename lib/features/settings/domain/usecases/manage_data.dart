import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';

/// Use case for data management (export/clear)
@injectable
class ManageData {
  final SettingsRepository _repository;

  ManageData(this._repository);

  /// Export all user data as JSON
  Future<Map<String, dynamic>> exportData() => _repository.exportUserData();

  /// Clear all user data (factory reset)
  Future<void> clearAllData() => _repository.clearAllData();
}
