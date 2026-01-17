import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

/// Onboarding BLoC Events
@freezed
class OnboardingEvent with _$OnboardingEvent {
  /// Start or resume onboarding
  const factory OnboardingEvent.started() = OnboardingStarted;

  /// Move to the next step
  const factory OnboardingEvent.nextStep() = OnboardingNextStep;

  /// Move to the previous step
  const factory OnboardingEvent.previousStep() = OnboardingPreviousStep;

  /// Skip the current step (for skippable steps)
  const factory OnboardingEvent.skipStep() = OnboardingSkipStep;

  /// Go to a specific step
  const factory OnboardingEvent.goToStep({
    required int stepIndex,
  }) = OnboardingGoToStep;

  /// Update birth date
  const factory OnboardingEvent.updateBirthDate({
    required DateTime birthDate,
  }) = OnboardingUpdateBirthDate;

  /// Update sex selection
  const factory OnboardingEvent.updateSex({
    required String sex,
  }) = OnboardingUpdateSex;

  /// Update height
  const factory OnboardingEvent.updateHeight({
    required double heightCm,
  }) = OnboardingUpdateHeight;

  /// Update weight
  const factory OnboardingEvent.updateWeight({
    required double weightKg,
  }) = OnboardingUpdateWeight;

  /// Update target weight
  const factory OnboardingEvent.updateTargetWeight({
    double? targetWeightKg,
  }) = OnboardingUpdateTargetWeight;

  /// Update activity level
  const factory OnboardingEvent.updateActivityLevel({
    required String activityLevel,
  }) = OnboardingUpdateActivityLevel;

  /// Update goals (multi-select)
  const factory OnboardingEvent.updateGoals({
    required List<String> goals,
  }) = OnboardingUpdateGoals;

  /// Toggle a single goal
  const factory OnboardingEvent.toggleGoal({
    required String goal,
  }) = OnboardingToggleGoal;

  /// Update wake time
  const factory OnboardingEvent.updateWakeTime({
    required TimeOfDay wakeTime,
  }) = OnboardingUpdateWakeTime;

  /// Update longevity ambition
  const factory OnboardingEvent.updateAmbition({
    required String ambition,
  }) = OnboardingUpdateAmbition;

  /// Update health permissions status
  const factory OnboardingEvent.updateHealthPermissions({
    required bool granted,
  }) = OnboardingUpdateHealthPermissions;

  /// Request health platform permissions (HealthKit / Health Connect)
  const factory OnboardingEvent.requestHealthPermissions() =
      OnboardingRequestHealthPermissions;

  /// Accept disclaimer
  const factory OnboardingEvent.acceptDisclaimer({
    required bool accepted,
  }) = OnboardingAcceptDisclaimer;

  /// Submit final onboarding data
  const factory OnboardingEvent.submit() = OnboardingSubmit;

  /// Reset onboarding to start over
  const factory OnboardingEvent.reset() = OnboardingReset;
}
