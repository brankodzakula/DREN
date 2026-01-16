import 'package:injectable/injectable.dart';

import '../entities/onboarding_data.dart';
import '../repositories/onboarding_repository.dart';

/// Use case for saving user profile after onboarding completion
@injectable
class SaveUserProfile {
  final OnboardingRepository _repository;

  SaveUserProfile(this._repository);

  /// Saves the onboarding data as a user profile
  ///
  /// Validates that all required fields are present before saving.
  /// Returns the generated user profile ID on success.
  /// Throws [OnboardingIncompleteException] if required data is missing.
  Future<String> call(OnboardingData data) async {
    // Validate required fields
    if (!data.isComplete) {
      throw OnboardingIncompleteException(
        'Cannot save profile: onboarding data is incomplete',
        missingFields: _getMissingFields(data),
      );
    }

    // Save the user profile
    return await _repository.saveUserProfile(data);
  }

  List<String> _getMissingFields(OnboardingData data) {
    final missing = <String>[];
    if (data.dateOfBirth == null) missing.add('dateOfBirth');
    if (data.sex == null) missing.add('sex');
    if (data.heightCm == null) missing.add('heightCm');
    if (data.weightKg == null) missing.add('weightKg');
    if (data.activityLevel == null) missing.add('activityLevel');
    if (data.wakeTime == null) missing.add('wakeTime');
    if (data.longevityAmbition == null) missing.add('longevityAmbition');
    if (!data.disclaimerAccepted) missing.add('disclaimerAccepted');
    return missing;
  }
}

/// Exception thrown when attempting to save incomplete onboarding data
class OnboardingIncompleteException implements Exception {
  final String message;
  final List<String> missingFields;

  OnboardingIncompleteException(this.message, {this.missingFields = const []});

  @override
  String toString() {
    if (missingFields.isEmpty) {
      return 'OnboardingIncompleteException: $message';
    }
    return 'OnboardingIncompleteException: $message (missing: ${missingFields.join(', ')})';
  }
}
