import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/onboarding_data.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/usecases/check_onboarding_complete.dart';
import '../../domain/usecases/save_user_profile.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

/// BLoC for managing onboarding flow
@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _repository;
  final SaveUserProfile _saveUserProfile;
  final CheckOnboardingComplete _checkOnboardingComplete;

  OnboardingBloc(
    this._repository,
    this._saveUserProfile,
    this._checkOnboardingComplete,
  ) : super(const OnboardingState.initial()) {
    on<OnboardingStarted>(_onStarted);
    on<OnboardingNextStep>(_onNextStep);
    on<OnboardingPreviousStep>(_onPreviousStep);
    on<OnboardingSkipStep>(_onSkipStep);
    on<OnboardingGoToStep>(_onGoToStep);
    on<OnboardingUpdateBirthDate>(_onUpdateBirthDate);
    on<OnboardingUpdateSex>(_onUpdateSex);
    on<OnboardingUpdateHeight>(_onUpdateHeight);
    on<OnboardingUpdateWeight>(_onUpdateWeight);
    on<OnboardingUpdateTargetWeight>(_onUpdateTargetWeight);
    on<OnboardingUpdateActivityLevel>(_onUpdateActivityLevel);
    on<OnboardingUpdateGoals>(_onUpdateGoals);
    on<OnboardingToggleGoal>(_onToggleGoal);
    on<OnboardingUpdateWakeTime>(_onUpdateWakeTime);
    on<OnboardingUpdateAmbition>(_onUpdateAmbition);
    on<OnboardingUpdateHealthPermissions>(_onUpdateHealthPermissions);
    on<OnboardingAcceptDisclaimer>(_onAcceptDisclaimer);
    on<OnboardingSubmit>(_onSubmit);
    on<OnboardingReset>(_onReset);
  }

  /// Handle onboarding start/resume
  Future<void> _onStarted(
    OnboardingStarted event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const OnboardingState.loading());

    try {
      // Check if onboarding is already complete
      final status = await _checkOnboardingComplete();
      if (status == OnboardingStatus.complete) {
        final userId = await _repository.getCurrentUserId();
        emit(OnboardingState.complete(userId: userId ?? ''));
        return;
      }

      // Load existing progress or start fresh
      final existingData = await _repository.loadOnboardingData();
      final data = existingData ?? const OnboardingData();

      // Determine which step to show based on existing data
      final step = _determineCurrentStep(data);

      emit(OnboardingState.collecting(
        currentStep: step,
        data: data,
        isStepValid: _isStepValid(step, data),
      ));
    } catch (e) {
      emit(OnboardingState.error(
        message: 'Failed to initialize onboarding: ${e.toString()}',
      ));
    }
  }

  /// Handle next step navigation
  Future<void> _onNextStep(
    OnboardingNextStep event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! OnboardingCollecting) return;

    final currentStep = currentState.currentStep;
    final data = currentState.data;

    // Validate current step
    if (!_isStepValid(currentStep, data) && !currentStep.isSkippable) {
      emit(currentState.copyWith(
        stepError: _getValidationError(currentStep, data),
      ));
      return;
    }

    // Save progress
    await _saveProgress(data);

    // Move to next step or complete
    final nextStep = currentStep.next;
    if (nextStep == null) {
      // Last step - trigger submit
      add(const OnboardingEvent.submit());
      return;
    }

    emit(OnboardingState.collecting(
      currentStep: nextStep,
      data: data,
      isStepValid: _isStepValid(nextStep, data),
    ));
  }

  /// Handle previous step navigation
  Future<void> _onPreviousStep(
    OnboardingPreviousStep event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! OnboardingCollecting) return;

    final previousStep = currentState.currentStep.previous;
    if (previousStep == null) return;

    emit(OnboardingState.collecting(
      currentStep: previousStep,
      data: currentState.data,
      isStepValid: _isStepValid(previousStep, currentState.data),
    ));
  }

  /// Handle skip step
  Future<void> _onSkipStep(
    OnboardingSkipStep event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! OnboardingCollecting) return;

    if (!currentState.currentStep.isSkippable) return;

    add(const OnboardingEvent.nextStep());
  }

  /// Handle go to specific step
  Future<void> _onGoToStep(
    OnboardingGoToStep event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! OnboardingCollecting) return;

    final targetStep = OnboardingStep.fromIndex(event.stepIndex);

    emit(OnboardingState.collecting(
      currentStep: targetStep,
      data: currentState.data,
      isStepValid: _isStepValid(targetStep, currentState.data),
    ));
  }

  /// Handle birth date update
  Future<void> _onUpdateBirthDate(
    OnboardingUpdateBirthDate event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(emit, (data) => data.copyWith(dateOfBirth: event.birthDate));
  }

  /// Handle sex update
  Future<void> _onUpdateSex(
    OnboardingUpdateSex event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(emit, (data) => data.copyWith(sex: event.sex));
  }

  /// Handle height update
  Future<void> _onUpdateHeight(
    OnboardingUpdateHeight event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(emit, (data) => data.copyWith(heightCm: event.heightCm));
  }

  /// Handle weight update
  Future<void> _onUpdateWeight(
    OnboardingUpdateWeight event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(emit, (data) => data.copyWith(weightKg: event.weightKg));
  }

  /// Handle target weight update
  Future<void> _onUpdateTargetWeight(
    OnboardingUpdateTargetWeight event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(
        emit, (data) => data.copyWith(targetWeightKg: event.targetWeightKg));
  }

  /// Handle activity level update
  Future<void> _onUpdateActivityLevel(
    OnboardingUpdateActivityLevel event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(
        emit, (data) => data.copyWith(activityLevel: event.activityLevel));
  }

  /// Handle goals update
  Future<void> _onUpdateGoals(
    OnboardingUpdateGoals event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(emit, (data) => data.copyWith(goals: event.goals));
  }

  /// Handle toggle single goal
  Future<void> _onToggleGoal(
    OnboardingToggleGoal event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! OnboardingCollecting) return;

    final currentGoals = List<String>.from(currentState.data.goals);
    if (currentGoals.contains(event.goal)) {
      currentGoals.remove(event.goal);
    } else {
      currentGoals.add(event.goal);
    }

    _updateData(emit, (data) => data.copyWith(goals: currentGoals));
  }

  /// Handle wake time update
  Future<void> _onUpdateWakeTime(
    OnboardingUpdateWakeTime event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(emit, (data) => data.copyWith(wakeTime: event.wakeTime));
  }

  /// Handle ambition update
  Future<void> _onUpdateAmbition(
    OnboardingUpdateAmbition event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(
        emit, (data) => data.copyWith(longevityAmbition: event.ambition));
  }

  /// Handle health permissions update
  Future<void> _onUpdateHealthPermissions(
    OnboardingUpdateHealthPermissions event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(
        emit, (data) => data.copyWith(healthPermissionsGranted: event.granted));
  }

  /// Handle disclaimer acceptance
  Future<void> _onAcceptDisclaimer(
    OnboardingAcceptDisclaimer event,
    Emitter<OnboardingState> emit,
  ) async {
    _updateData(
        emit, (data) => data.copyWith(disclaimerAccepted: event.accepted));
  }

  /// Handle final submission
  Future<void> _onSubmit(
    OnboardingSubmit event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentState = state;
    final data = currentState.currentData;

    if (data == null) {
      emit(const OnboardingState.error(message: 'No data to submit'));
      return;
    }

    emit(OnboardingState.saving(data: data));

    try {
      final userId = await _saveUserProfile(data);
      emit(OnboardingState.complete(userId: userId));
    } on OnboardingIncompleteException catch (e) {
      emit(OnboardingState.error(
        message: e.message,
        data: data,
        lastStep: OnboardingStep.disclaimer,
      ));
    } catch (e) {
      emit(OnboardingState.error(
        message: 'Failed to save profile: ${e.toString()}',
        data: data,
        lastStep: OnboardingStep.disclaimer,
      ));
    }
  }

  /// Handle reset
  Future<void> _onReset(
    OnboardingReset event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      await _repository.clearOnboardingData();
      emit(const OnboardingState.initial());
      add(const OnboardingEvent.started());
    } catch (e) {
      emit(OnboardingState.error(
        message: 'Failed to reset onboarding: ${e.toString()}',
      ));
    }
  }

  /// Helper to update data in collecting state
  void _updateData(
    Emitter<OnboardingState> emit,
    OnboardingData Function(OnboardingData) updater,
  ) {
    final currentState = state;
    if (currentState is! OnboardingCollecting) return;

    final newData = updater(currentState.data);

    emit(currentState.copyWith(
      data: newData,
      isStepValid: _isStepValid(currentState.currentStep, newData),
      stepError: null,
    ));
  }

  /// Save progress to repository
  Future<void> _saveProgress(OnboardingData data) async {
    try {
      await _repository.saveOnboardingProgress(data);
    } catch (_) {
      // Silently fail - progress saving is not critical
    }
  }

  /// Determine which step to show based on existing data
  OnboardingStep _determineCurrentStep(OnboardingData data) {
    if (data.dateOfBirth == null) return OnboardingStep.welcome;
    if (data.sex == null) return OnboardingStep.sex;
    if (data.heightCm == null || data.weightKg == null) {
      return OnboardingStep.measurements;
    }
    if (data.activityLevel == null) return OnboardingStep.activityLevel;
    if (data.wakeTime == null) return OnboardingStep.wakeTime;
    if (data.longevityAmbition == null) return OnboardingStep.ambition;
    if (!data.disclaimerAccepted) return OnboardingStep.disclaimer;
    return OnboardingStep.welcome;
  }

  /// Check if current step has valid data
  bool _isStepValid(OnboardingStep step, OnboardingData data) {
    switch (step) {
      case OnboardingStep.welcome:
        return true;
      case OnboardingStep.birthDate:
        return data.dateOfBirth != null && _isValidAge(data.dateOfBirth!);
      case OnboardingStep.sex:
        return data.sex != null;
      case OnboardingStep.measurements:
        return data.heightCm != null &&
            data.weightKg != null &&
            data.heightCm! > 0 &&
            data.weightKg! > 0;
      case OnboardingStep.targetWeight:
        return true; // Optional step
      case OnboardingStep.activityLevel:
        return data.activityLevel != null;
      case OnboardingStep.goals:
        return true; // Optional step
      case OnboardingStep.wakeTime:
        return data.wakeTime != null;
      case OnboardingStep.ambition:
        return data.longevityAmbition != null;
      case OnboardingStep.healthPermissions:
        return true; // Optional step
      case OnboardingStep.disclaimer:
        return data.disclaimerAccepted;
    }
  }

  /// Get validation error for current step
  String? _getValidationError(OnboardingStep step, OnboardingData data) {
    switch (step) {
      case OnboardingStep.birthDate:
        if (data.dateOfBirth == null) return 'Please enter your birth date';
        if (!_isValidAge(data.dateOfBirth!)) {
          return 'You must be at least 18 years old';
        }
        return null;
      case OnboardingStep.sex:
        if (data.sex == null) return 'Please select your biological sex';
        return null;
      case OnboardingStep.measurements:
        if (data.heightCm == null) return 'Please enter your height';
        if (data.weightKg == null) return 'Please enter your weight';
        return null;
      case OnboardingStep.activityLevel:
        if (data.activityLevel == null) {
          return 'Please select your activity level';
        }
        return null;
      case OnboardingStep.wakeTime:
        if (data.wakeTime == null) return 'Please set your wake time';
        return null;
      case OnboardingStep.ambition:
        if (data.longevityAmbition == null) {
          return 'Please select your ambition level';
        }
        return null;
      case OnboardingStep.disclaimer:
        if (!data.disclaimerAccepted) {
          return 'Please accept the health disclaimer';
        }
        return null;
      default:
        return null;
    }
  }

  /// Check if birth date indicates user is at least 18
  bool _isValidAge(DateTime birthDate) {
    final now = DateTime.now();
    final age = now.year - birthDate.year;
    final monthDiff = now.month - birthDate.month;
    final dayDiff = now.day - birthDate.day;

    if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
      return age - 1 >= 18;
    }
    return age >= 18;
  }
}
