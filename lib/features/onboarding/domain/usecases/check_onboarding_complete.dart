import 'package:injectable/injectable.dart';

import '../repositories/onboarding_repository.dart';

/// Use case for checking if onboarding has been completed
@injectable
class CheckOnboardingComplete {
  final OnboardingRepository _repository;

  CheckOnboardingComplete(this._repository);

  /// Checks if onboarding is complete
  ///
  /// Returns [OnboardingStatus] indicating the current state:
  /// - [OnboardingStatus.complete] if user profile exists
  /// - [OnboardingStatus.inProgress] if partial data exists
  /// - [OnboardingStatus.notStarted] if no data exists
  Future<OnboardingStatus> call() async {
    // First check if onboarding is complete
    final isComplete = await _repository.isOnboardingComplete();
    if (isComplete) {
      return OnboardingStatus.complete;
    }

    // Check if there's partial progress
    final partialData = await _repository.loadOnboardingData();
    if (partialData != null) {
      return OnboardingStatus.inProgress;
    }

    return OnboardingStatus.notStarted;
  }
}

/// Represents the current onboarding status
enum OnboardingStatus {
  /// No onboarding data exists, fresh start needed
  notStarted,

  /// Partial onboarding data exists, can resume
  inProgress,

  /// Onboarding complete, user profile exists
  complete,
}

extension OnboardingStatusExtension on OnboardingStatus {
  /// Returns true if user needs to go through onboarding
  bool get needsOnboarding => this != OnboardingStatus.complete;

  /// Returns true if user can skip to where they left off
  bool get canResume => this == OnboardingStatus.inProgress;
}
