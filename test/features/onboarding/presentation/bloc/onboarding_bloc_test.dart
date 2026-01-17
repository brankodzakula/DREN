import 'package:bloc_test/bloc_test.dart';
import 'package:dren/core/services/health_service.dart';
import 'package:dren/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:dren/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:dren/features/onboarding/domain/usecases/check_onboarding_complete.dart';
import 'package:dren/features/onboarding/domain/usecases/save_user_profile.dart';
import 'package:dren/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dren/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dren/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

class MockSaveUserProfile extends Mock implements SaveUserProfile {}

class MockCheckOnboardingComplete extends Mock
    implements CheckOnboardingComplete {}

class MockHealthService extends Mock implements HealthService {}

class FakeOnboardingData extends Fake implements OnboardingData {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
    registerFallbackValue(FakeOnboardingData());
  });
  late OnboardingBloc bloc;
  late MockOnboardingRepository mockRepository;
  late MockSaveUserProfile mockSaveUserProfile;
  late MockCheckOnboardingComplete mockCheckOnboardingComplete;
  late MockHealthService mockHealthService;

  setUp(() {
    mockRepository = MockOnboardingRepository();
    mockSaveUserProfile = MockSaveUserProfile();
    mockCheckOnboardingComplete = MockCheckOnboardingComplete();
    mockHealthService = MockHealthService();

    bloc = OnboardingBloc(
      mockRepository,
      mockSaveUserProfile,
      mockCheckOnboardingComplete,
      mockHealthService,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('OnboardingBloc', () {
    test('initial state is OnboardingInitial', () {
      expect(bloc.state, const OnboardingState.initial());
    });

    group('OnboardingStarted', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'emits [loading, collecting] when onboarding not complete and no existing data',
        build: () {
          when(() => mockCheckOnboardingComplete())
              .thenAnswer((_) async => OnboardingStatus.notStarted);
          when(() => mockRepository.loadOnboardingData())
              .thenAnswer((_) async => null);
          return bloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.started()),
        expect: () => [
          const OnboardingState.loading(),
          isA<OnboardingCollecting>()
              .having(
                (s) => s.currentStep,
                'currentStep',
                OnboardingStep.welcome,
              )
              .having(
                (s) => s.data,
                'data',
                const OnboardingData(),
              ),
        ],
        verify: (_) {
          verify(() => mockCheckOnboardingComplete()).called(1);
          verify(() => mockRepository.loadOnboardingData()).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'emits [loading, complete] when onboarding already complete',
        build: () {
          when(() => mockCheckOnboardingComplete())
              .thenAnswer((_) async => OnboardingStatus.complete);
          when(() => mockRepository.getCurrentUserId())
              .thenAnswer((_) async => 'user-123');
          return bloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.started()),
        expect: () => [
          const OnboardingState.loading(),
          const OnboardingState.complete(userId: 'user-123'),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'resumes from existing progress when in progress',
        build: () {
          when(() => mockCheckOnboardingComplete())
              .thenAnswer((_) async => OnboardingStatus.inProgress);
          when(() => mockRepository.loadOnboardingData()).thenAnswer(
            (_) async => OnboardingData(
              dateOfBirth: DateTime(1990, 1, 1),
              sex: 'male',
            ),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.started()),
        expect: () => [
          const OnboardingState.loading(),
          isA<OnboardingCollecting>()
              .having(
                (s) => s.currentStep,
                'currentStep',
                OnboardingStep.measurements,
              )
              .having(
                (s) => s.data.dateOfBirth,
                'dateOfBirth',
                DateTime(1990, 1, 1),
              )
              .having(
                (s) => s.data.sex,
                'sex',
                'male',
              ),
        ],
      );
    });

    group('OnboardingNextStep', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'moves to next step when current step is valid',
        build: () {
          when(() => mockRepository.saveOnboardingProgress(any()))
              .thenAnswer((_) async {});
          return bloc;
        },
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.welcome,
          data: OnboardingData(),
          isStepValid: true,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.nextStep()),
        expect: () => [
          isA<OnboardingCollecting>().having(
            (s) => s.currentStep,
            'currentStep',
            OnboardingStep.birthDate,
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'shows error when required step is invalid',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.birthDate,
          data: OnboardingData(), // No birth date set
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.nextStep()),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.stepError,
                'stepError',
                'Please enter your birth date',
              )
              .having(
                (s) => s.currentStep,
                'currentStep',
                OnboardingStep.birthDate,
              ),
        ],
      );
    });

    group('OnboardingPreviousStep', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'moves to previous step',
        build: () => bloc,
        seed: () => OnboardingState.collecting(
          currentStep: OnboardingStep.sex,
          data: OnboardingData(dateOfBirth: DateTime(1990, 1, 1)),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.previousStep()),
        expect: () => [
          isA<OnboardingCollecting>().having(
            (s) => s.currentStep,
            'currentStep',
            OnboardingStep.birthDate,
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'does nothing when on first step',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.welcome,
          data: OnboardingData(),
          isStepValid: true,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.previousStep()),
        expect: () => [], // No state change
      );
    });

    group('Field Updates', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'updates birth date',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.birthDate,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(
          OnboardingEvent.updateBirthDate(birthDate: DateTime(1990, 5, 15)),
        ),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.dateOfBirth,
                'dateOfBirth',
                DateTime(1990, 5, 15),
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates sex',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.sex,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(
          const OnboardingEvent.updateSex(sex: 'female'),
        ),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.sex,
                'sex',
                'female',
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates height and weight',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.measurements,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) {
          bloc.add(const OnboardingEvent.updateHeight(heightCm: 175.0));
          bloc.add(const OnboardingEvent.updateWeight(weightKg: 70.0));
        },
        expect: () => [
          isA<OnboardingCollecting>().having(
            (s) => s.data.heightCm,
            'heightCm',
            175.0,
          ),
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.weightKg,
                'weightKg',
                70.0,
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates activity level',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.activityLevel,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(
          const OnboardingEvent.updateActivityLevel(
              activityLevel: 'moderately_active'),
        ),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.activityLevel,
                'activityLevel',
                'moderately_active',
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'toggles goals',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.goals,
          data: OnboardingData(goals: ['longevity']),
          isStepValid: true,
        ),
        act: (bloc) {
          bloc.add(const OnboardingEvent.toggleGoal(goal: 'lose_weight'));
          bloc.add(const OnboardingEvent.toggleGoal(goal: 'longevity'));
        },
        expect: () => [
          isA<OnboardingCollecting>().having(
            (s) => s.data.goals,
            'goals',
            ['longevity', 'lose_weight'],
          ),
          isA<OnboardingCollecting>().having(
            (s) => s.data.goals,
            'goals',
            ['lose_weight'],
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates wake time',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.wakeTime,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(
          const OnboardingEvent.updateWakeTime(
            wakeTime: TimeOfDay(hour: 6, minute: 30),
          ),
        ),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.wakeTime,
                'wakeTime',
                const TimeOfDay(hour: 6, minute: 30),
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates ambition',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.ambition,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(
          const OnboardingEvent.updateAmbition(ambition: 'aggressive'),
        ),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.longevityAmbition,
                'longevityAmbition',
                'aggressive',
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'accepts disclaimer',
        build: () => bloc,
        seed: () => const OnboardingState.collecting(
          currentStep: OnboardingStep.disclaimer,
          data: OnboardingData(),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(
          const OnboardingEvent.acceptDisclaimer(accepted: true),
        ),
        expect: () => [
          isA<OnboardingCollecting>()
              .having(
                (s) => s.data.disclaimerAccepted,
                'disclaimerAccepted',
                true,
              )
              .having(
                (s) => s.isStepValid,
                'isStepValid',
                true,
              ),
        ],
      );
    });

    group('OnboardingSubmit', () {
      final completeData = OnboardingData(
        dateOfBirth: DateTime(1990, 1, 1),
        sex: 'male',
        heightCm: 175.0,
        weightKg: 70.0,
        activityLevel: 'moderately_active',
        wakeTime: const TimeOfDay(hour: 6, minute: 30),
        longevityAmbition: 'moderate',
        disclaimerAccepted: true,
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'saves profile and emits complete state on success',
        build: () {
          when(() => mockSaveUserProfile(any()))
              .thenAnswer((_) async => 'user-456');
          return bloc;
        },
        seed: () => OnboardingState.collecting(
          currentStep: OnboardingStep.disclaimer,
          data: completeData,
          isStepValid: true,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.submit()),
        expect: () => [
          OnboardingState.saving(data: completeData),
          const OnboardingState.complete(userId: 'user-456'),
        ],
        verify: (_) {
          verify(() => mockSaveUserProfile(completeData)).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'emits error state on save failure',
        build: () {
          when(() => mockSaveUserProfile(any()))
              .thenThrow(Exception('Database error'));
          return bloc;
        },
        seed: () => OnboardingState.collecting(
          currentStep: OnboardingStep.disclaimer,
          data: completeData,
          isStepValid: true,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.submit()),
        expect: () => [
          OnboardingState.saving(data: completeData),
          isA<OnboardingError>()
              .having(
                (s) => s.message,
                'message',
                contains('Failed to save profile'),
              )
              .having(
                (s) => s.data,
                'data',
                completeData,
              ),
        ],
      );
    });

    group('OnboardingReset', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'clears data and restarts onboarding',
        build: () {
          when(() => mockRepository.clearOnboardingData())
              .thenAnswer((_) async {});
          when(() => mockCheckOnboardingComplete())
              .thenAnswer((_) async => OnboardingStatus.notStarted);
          when(() => mockRepository.loadOnboardingData())
              .thenAnswer((_) async => null);
          return bloc;
        },
        seed: () => OnboardingState.collecting(
          currentStep: OnboardingStep.measurements,
          data: OnboardingData(
            dateOfBirth: DateTime(1990, 1, 1),
            sex: 'male',
          ),
          isStepValid: false,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.reset()),
        expect: () => [
          const OnboardingState.initial(),
          const OnboardingState.loading(),
          isA<OnboardingCollecting>().having(
            (s) => s.currentStep,
            'currentStep',
            OnboardingStep.welcome,
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.clearOnboardingData()).called(1);
        },
      );
    });
  });

  group('OnboardingStep', () {
    test('fromIndex returns correct step', () {
      expect(OnboardingStep.fromIndex(0), OnboardingStep.welcome);
      expect(OnboardingStep.fromIndex(5), OnboardingStep.activityLevel);
      expect(OnboardingStep.fromIndex(10), OnboardingStep.disclaimer);
    });

    test('isSkippable returns correct value', () {
      expect(OnboardingStep.welcome.isSkippable, false);
      expect(OnboardingStep.targetWeight.isSkippable, true);
      expect(OnboardingStep.goals.isSkippable, true);
      expect(OnboardingStep.healthPermissions.isSkippable, true);
      expect(OnboardingStep.disclaimer.isSkippable, false);
    });

    test('next and previous work correctly', () {
      expect(OnboardingStep.welcome.next, OnboardingStep.birthDate);
      expect(OnboardingStep.birthDate.previous, OnboardingStep.welcome);
      expect(OnboardingStep.disclaimer.next, null);
      expect(OnboardingStep.welcome.previous, null);
    });

    test('isFirstStep and isLastStep work correctly', () {
      expect(OnboardingStep.welcome.isFirstStep, true);
      expect(OnboardingStep.welcome.isLastStep, false);
      expect(OnboardingStep.disclaimer.isFirstStep, false);
      expect(OnboardingStep.disclaimer.isLastStep, true);
    });
  });

  group('OnboardingStateExtension', () {
    test('progress calculates correctly', () {
      const state = OnboardingState.collecting(
        currentStep: OnboardingStep.welcome,
        data: OnboardingData(),
        isStepValid: true,
      );
      expect(state.progress, closeTo(1 / 11, 0.01));

      const state2 = OnboardingState.collecting(
        currentStep: OnboardingStep.disclaimer,
        data: OnboardingData(),
        isStepValid: true,
      );
      expect(state2.progress, closeTo(11 / 11, 0.01));
    });

    test('currentData returns data when available', () {
      final data = OnboardingData(dateOfBirth: DateTime(1990, 1, 1));
      final state = OnboardingState.collecting(
        currentStep: OnboardingStep.sex,
        data: data,
        isStepValid: false,
      );
      expect(state.currentData, data);

      const initialState = OnboardingState.initial();
      expect(initialState.currentData, null);
    });
  });
}
