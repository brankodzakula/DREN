import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/onboarding_data.dart';

part 'onboarding_state.freezed.dart';

/// Total number of onboarding steps
const int totalOnboardingSteps = 11;

/// Onboarding step definitions
enum OnboardingStep {
  welcome(0, 'Welcome'),
  birthDate(1, 'Birth Date'),
  sex(2, 'Sex'),
  measurements(3, 'Measurements'),
  targetWeight(4, 'Target Weight'),
  activityLevel(5, 'Activity Level'),
  goals(6, 'Goals'),
  wakeTime(7, 'Wake Time'),
  ambition(8, 'Ambition'),
  healthPermissions(9, 'Health Permissions'),
  disclaimer(10, 'Disclaimer');

  final int stepIndex;
  final String title;

  const OnboardingStep(this.stepIndex, this.title);

  /// Get step by index
  static OnboardingStep fromIndex(int index) {
    return OnboardingStep.values.firstWhere(
      (step) => step.stepIndex == index,
      orElse: () => OnboardingStep.welcome,
    );
  }

  /// Check if this step can be skipped
  bool get isSkippable {
    return this == OnboardingStep.targetWeight ||
        this == OnboardingStep.goals ||
        this == OnboardingStep.healthPermissions;
  }

  /// Check if this is the last step
  bool get isLastStep => stepIndex == totalOnboardingSteps - 1;

  /// Check if this is the first step
  bool get isFirstStep => stepIndex == 0;

  /// Get next step
  OnboardingStep? get next {
    if (isLastStep) return null;
    return OnboardingStep.fromIndex(stepIndex + 1);
  }

  /// Get previous step
  OnboardingStep? get previous {
    if (isFirstStep) return null;
    return OnboardingStep.fromIndex(stepIndex - 1);
  }
}

/// Onboarding BLoC State
@freezed
class OnboardingState with _$OnboardingState {
  /// Initial state before onboarding starts
  const factory OnboardingState.initial() = OnboardingInitial;

  /// Loading state when checking existing progress
  const factory OnboardingState.loading() = OnboardingLoading;

  /// Collecting data state - main onboarding flow
  const factory OnboardingState.collecting({
    required OnboardingStep currentStep,
    required OnboardingData data,
    @Default(false) bool isStepValid,
    String? stepError,
  }) = OnboardingCollecting;

  /// Validating state when moving between steps
  const factory OnboardingState.validating({
    required OnboardingStep currentStep,
    required OnboardingData data,
  }) = OnboardingValidating;

  /// Saving state when submitting final data
  const factory OnboardingState.saving({
    required OnboardingData data,
  }) = OnboardingSaving;

  /// Complete state when onboarding is finished
  const factory OnboardingState.complete({
    required String userId,
  }) = OnboardingComplete;

  /// Error state
  const factory OnboardingState.error({
    required String message,
    OnboardingData? data,
    OnboardingStep? lastStep,
  }) = OnboardingError;
}

/// Extension methods for OnboardingState
extension OnboardingStateExtension on OnboardingState {
  /// Get current onboarding data if available
  OnboardingData? get currentData {
    return maybeMap(
      collecting: (state) => state.data,
      validating: (state) => state.data,
      saving: (state) => state.data,
      error: (state) => state.data,
      orElse: () => null,
    );
  }

  /// Get current step if available
  OnboardingStep? get currentStep {
    return maybeMap(
      collecting: (state) => state.currentStep,
      validating: (state) => state.currentStep,
      error: (state) => state.lastStep,
      orElse: () => null,
    );
  }

  /// Check if currently collecting data
  bool get isCollecting => this is OnboardingCollecting;

  /// Check if currently saving
  bool get isSaving => this is OnboardingSaving;

  /// Check if complete
  bool get isComplete => this is OnboardingComplete;

  /// Check if in error state
  bool get hasError => this is OnboardingError;

  /// Get progress percentage (0.0 to 1.0)
  double get progress {
    final step = currentStep;
    if (step == null) return 0.0;
    return (step.stepIndex + 1) / totalOnboardingSteps;
  }
}
