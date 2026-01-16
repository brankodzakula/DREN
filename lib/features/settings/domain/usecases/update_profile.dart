import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';

/// Use case for updating user profile
@injectable
class UpdateProfile {
  final SettingsRepository _repository;

  UpdateProfile(this._repository);

  Future<void> call({
    double? weightKg,
    double? targetWeightKg,
    double? heightCm,
    String? activityLevel,
    String? fitnessLevel,
    TimeOfDay? wakeTime,
  }) =>
      _repository.updateProfile(
        weightKg: weightKg,
        targetWeightKg: targetWeightKg,
        heightCm: heightCm,
        activityLevel: activityLevel,
        fitnessLevel: fitnessLevel,
        wakeTime: wakeTime,
      );
}
