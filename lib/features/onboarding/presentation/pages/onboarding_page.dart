import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/activity_level_step.dart';
import '../widgets/ambition_selection_step.dart';
import '../widgets/birth_date_step.dart';
import '../widgets/disclaimer_step.dart';
import '../widgets/goals_step.dart';
import '../widgets/health_permissions_step.dart';
import '../widgets/measurements_step.dart';
import '../widgets/sex_selection_step.dart';
import '../widgets/target_weight_step.dart';
import '../widgets/wake_time_step.dart';
import '../widgets/welcome_step.dart';

/// Main onboarding page with PageView for step navigation
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingBloc>()..add(const OnboardingEvent.started()),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        // Handle navigation to main app when complete
        if (state is OnboardingComplete) {
          context.go('/main');
        }

        // Animate to current step
        if (state is OnboardingCollecting) {
          final targetPage = state.currentStep.stepIndex;
          if (_pageController.hasClients &&
              _pageController.page?.round() != targetPage) {
            _pageController.animateToPage(
              targetPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => const _LoadingScreen(),
          collecting: (collectingState) => _OnboardingContent(
            pageController: _pageController,
            state: collectingState,
          ),
          saving: (_) => const _SavingScreen(),
          error: (errorState) => _ErrorScreen(
            message: errorState.message,
            onRetry: () {
              context.read<OnboardingBloc>().add(const OnboardingEvent.started());
            },
          ),
          orElse: () => const _LoadingScreen(),
        );
      },
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  final PageController pageController;
  final OnboardingCollecting state;

  const _OnboardingContent({
    required this.pageController,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final isWelcomeStep = state.currentStep == OnboardingStep.welcome;

    return Scaffold(
      backgroundColor: DrenColors.background,
      appBar: isWelcomeStep
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: state.currentStep.isFirstStep
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.arrow_back, color: DrenColors.textPrimary),
                      onPressed: () => bloc.add(const OnboardingEvent.previousStep()),
                    ),
              title: Text(
                'Step ${state.currentStep.stepIndex}/${totalOnboardingSteps - 1}',
                style: DrenTypography.subheadline.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
              centerTitle: true,
            ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator (not shown on welcome)
            if (!isWelcomeStep) _ProgressIndicator(progress: state.progress),

            // Page content
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  WelcomeStep(
                    onGetStarted: () => bloc.add(const OnboardingEvent.nextStep()),
                  ),
                  BirthDateStep(
                    selectedDate: state.data.dateOfBirth,
                    onDateChanged: (date) => bloc.add(
                      OnboardingEvent.updateBirthDate(birthDate: date),
                    ),
                    error: state.stepError,
                  ),
                  SexSelectionStep(
                    selectedSex: state.data.sex,
                    onSexSelected: (sex) => bloc.add(
                      OnboardingEvent.updateSex(sex: sex),
                    ),
                  ),
                  MeasurementsStep(
                    heightCm: state.data.heightCm,
                    weightKg: state.data.weightKg,
                    onHeightChanged: (height) => bloc.add(
                      OnboardingEvent.updateHeight(heightCm: height),
                    ),
                    onWeightChanged: (weight) => bloc.add(
                      OnboardingEvent.updateWeight(weightKg: weight),
                    ),
                    error: state.stepError,
                  ),
                  TargetWeightStep(
                    currentWeightKg: state.data.weightKg,
                    targetWeightKg: state.data.targetWeightKg,
                    onTargetWeightChanged: (weight) => bloc.add(
                      OnboardingEvent.updateTargetWeight(targetWeightKg: weight),
                    ),
                  ),
                  // Step 6: Activity Level
                  ActivityLevelStep(
                    selectedActivityLevel: state.data.activityLevel,
                    onActivityLevelSelected: (level) => bloc.add(
                      OnboardingEvent.updateActivityLevel(activityLevel: level),
                    ),
                  ),
                  // Step 7: Goals
                  GoalsStep(
                    selectedGoals: state.data.goals,
                    onGoalToggled: (goal) => bloc.add(
                      OnboardingEvent.toggleGoal(goal: goal),
                    ),
                  ),
                  // Step 8: Wake Time
                  WakeTimeStep(
                    selectedTime: state.data.wakeTime,
                    onTimeChanged: (time) => bloc.add(
                      OnboardingEvent.updateWakeTime(wakeTime: time),
                    ),
                  ),
                  // Step 9: Ambition Selection
                  AmbitionSelectionStep(
                    selectedAmbition: state.data.longevityAmbition,
                    onAmbitionSelected: (ambition) => bloc.add(
                      OnboardingEvent.updateAmbition(ambition: ambition),
                    ),
                  ),
                  // Step 10: Health Permissions
                  HealthPermissionsStep(
                    permissionsGranted: state.data.healthPermissionsGranted,
                    onRequestPermissions: () {
                      bloc.add(const OnboardingEvent.requestHealthPermissions());
                    },
                    onSkip: () => bloc.add(const OnboardingEvent.skipStep()),
                  ),
                  // Step 11: Disclaimer
                  DisclaimerStep(
                    isAccepted: state.data.disclaimerAccepted,
                    onAcceptedChanged: (accepted) => bloc.add(
                      OnboardingEvent.acceptDisclaimer(accepted: accepted),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom navigation (not shown on welcome)
            if (!isWelcomeStep)
              _BottomNavigation(
                isStepValid: state.isStepValid,
                isSkippable: state.currentStep.isSkippable,
                onContinue: () => bloc.add(const OnboardingEvent.nextStep()),
                onSkip: () => bloc.add(const OnboardingEvent.skipStep()),
              ),
          ],
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  final double progress;

  const _ProgressIndicator({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DrenSpacing.screenHorizontal,
        vertical: DrenSpacing.sm,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: DrenColors.surfaceSecondary,
          valueColor: const AlwaysStoppedAnimation<Color>(DrenColors.primary),
          minHeight: 4,
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final bool isStepValid;
  final bool isSkippable;
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  const _BottomNavigation({
    required this.isStepValid,
    required this.isSkippable,
    required this.onContinue,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            label: 'Continue',
            onPressed: onContinue,
            isEnabled: isStepValid,
          ),
          if (isSkippable) ...[
            const SizedBox(height: DrenSpacing.sm),
            TextButton(
              onPressed: onSkip,
              child: Text(
                'Skip',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DrenColors.background,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(DrenColors.primary),
        ),
      ),
    );
  }
}

class _SavingScreen extends StatelessWidget {
  const _SavingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(DrenColors.primary),
            ),
            const SizedBox(height: DrenSpacing.lg),
            Text(
              'Creating your protocol...',
              style: DrenTypography.headline.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorScreen({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: Padding(
        padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: DrenColors.error,
                size: 64,
              ),
              const SizedBox(height: DrenSpacing.lg),
              Text(
                'Something went wrong',
                style: DrenTypography.title2.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.sm),
              Text(
                message,
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DrenSpacing.xl),
              PrimaryButton(
                label: 'Try Again',
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

