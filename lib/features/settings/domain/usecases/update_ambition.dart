import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';

/// Use case for updating longevity ambition (protocol intensity)
@injectable
class UpdateAmbition {
  final SettingsRepository _repository;

  UpdateAmbition(this._repository);

  Future<void> call(String ambition) => _repository.updateAmbition(ambition);
}
