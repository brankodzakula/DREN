import 'package:bloc_test/bloc_test.dart';
import 'package:dren/core/services/health_sync_service.dart';
import 'package:dren/features/protocol_engine/domain/entities/daily_protocol.dart';
import 'package:dren/features/today/domain/entities/daily_progress.dart';
import 'package:dren/features/today/domain/entities/ring_summary.dart';
import 'package:dren/features/today/domain/repositories/today_repository.dart';
import 'package:dren/features/today/domain/usecases/get_daily_progress.dart';
import 'package:dren/features/today/domain/usecases/get_today_protocol.dart';
import 'package:dren/features/today/presentation/bloc/today_bloc.dart';
import 'package:dren/features/today/presentation/bloc/today_event.dart';
import 'package:dren/features/today/presentation/bloc/today_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockGetDailyProgress extends Mock implements GetDailyProgress {}

class MockGetTodayProtocol extends Mock implements GetTodayProtocol {}

class MockTodayRepository extends Mock implements TodayRepository {}

class MockHealthSyncService extends Mock implements HealthSyncService {}

void main() {
  late TodayBloc bloc;
  late MockGetDailyProgress mockGetDailyProgress;
  late MockGetTodayProtocol mockGetTodayProtocol;
  late MockTodayRepository mockRepository;
  late MockHealthSyncService mockHealthSyncService;

  // Test data
  final testDate = DateTime(2024, 1, 15);
  final testProgress = DailyProgress(
    id: 'test_progress',
    date: testDate,
    caloriesConsumed: 1500,
    caloriesBurned: 200,
    exerciseMinutes: 30,
    sleepMinutes: 420,
    proteinGrams: 100,
    carbsGrams: 150,
    fatGrams: 50,
    stepsCount: 8000,
  );

  final testRings = RingSummary.fromProgressAndTargets(
    caloriesConsumed: 1500,
    targetCalories: 2000,
    caloriesBurned: 200,
    targetCaloriesBurn: 300,
    exerciseMinutes: 30,
    targetExerciseMinutes: 45,
    sleepMinutes: 420,
    targetSleepMinutes: 480,
  );

  final testProtocol = DailyProtocol(
    date: testDate,
    targetCalories: 2000,
    proteinGrams: 150,
    carbsGrams: 200,
    fatGrams: 70,
    exerciseMinutes: 45,
    workoutType: 'Strength',
    estimatedCaloriesBurn: 300,
    targetBedtime: const TimeOfDay(hour: 22, minute: 0),
    targetWakeTime: const TimeOfDay(hour: 6, minute: 0),
    windDownStart: const TimeOfDay(hour: 21, minute: 0),
    ambitionLevel: 'moderate',
    fitnessLevel: 'intermediate',
  );

  setUp(() {
    mockGetDailyProgress = MockGetDailyProgress();
    mockGetTodayProtocol = MockGetTodayProtocol();
    mockRepository = MockTodayRepository();
    mockHealthSyncService = MockHealthSyncService();

    bloc = TodayBloc(
      mockGetDailyProgress,
      mockGetTodayProtocol,
      mockRepository,
      mockHealthSyncService,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('TodayBloc', () {
    test('initial state is TodayInitial', () {
      expect(bloc.state, const TodayState.initial());
    });

    group('LoadToday', () {
      blocTest<TodayBloc, TodayState>(
        'emits [loading, loaded] when data is loaded successfully',
        build: () {
          when(() => mockGetDailyProgress()).thenAnswer(
            (_) async => testProgress,
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          when(() => mockGetTodayProtocol()).thenAnswer(
            (_) async => testProtocol,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.loadToday()),
        expect: () => [
          const TodayState.loading(),
          isA<TodayLoaded>()
              .having((s) => s.progress, 'progress', testProgress)
              .having((s) => s.rings.caloriesIn.current, 'caloriesIn', 1500)
              .having((s) => s.protocol, 'protocol', testProtocol),
        ],
        verify: (_) {
          verify(() => mockGetDailyProgress()).called(1);
          verify(() => mockGetDailyProgress.getRingSummary()).called(1);
          verify(() => mockGetTodayProtocol()).called(1);
        },
      );

      blocTest<TodayBloc, TodayState>(
        'emits [loading, loaded] with null protocol when no user profile',
        build: () {
          when(() => mockGetDailyProgress()).thenAnswer(
            (_) async => testProgress,
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          when(() => mockGetTodayProtocol()).thenAnswer(
            (_) async => null,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.loadToday()),
        expect: () => [
          const TodayState.loading(),
          isA<TodayLoaded>()
              .having((s) => s.progress, 'progress', testProgress)
              .having((s) => s.protocol, 'protocol', isNull),
        ],
      );

      blocTest<TodayBloc, TodayState>(
        'emits [loading, error] when loading fails',
        build: () {
          when(() => mockGetDailyProgress()).thenThrow(
            Exception('Database error'),
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          when(() => mockGetTodayProtocol()).thenAnswer(
            (_) async => testProtocol,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.loadToday()),
        expect: () => [
          const TodayState.loading(),
          isA<TodayError>().having(
            (s) => s.message,
            'message',
            contains('Failed to load'),
          ),
        ],
      );
    });

    group('RefreshToday', () {
      blocTest<TodayBloc, TodayState>(
        'emits [loaded] on successful refresh',
        build: () {
          when(() => mockGetDailyProgress()).thenAnswer(
            (_) async => testProgress,
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          when(() => mockGetTodayProtocol()).thenAnswer(
            (_) async => testProtocol,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.refresh()),
        expect: () => [
          isA<TodayLoaded>(),
        ],
      );

      blocTest<TodayBloc, TodayState>(
        'emits [error] with previous data on refresh failure',
        seed: () => TodayState.loaded(
          progress: testProgress,
          rings: testRings,
          protocol: testProtocol,
          lastUpdated: DateTime.now(),
        ),
        build: () {
          when(() => mockGetDailyProgress()).thenThrow(
            Exception('Network error'),
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          when(() => mockGetTodayProtocol()).thenAnswer(
            (_) async => testProtocol,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.refresh()),
        expect: () => [
          isA<TodayError>()
              .having((s) => s.previousProgress, 'previousProgress', testProgress)
              .having((s) => s.previousRings, 'previousRings', testRings),
        ],
      );
    });

    group('UpdateCaloriesConsumed', () {
      blocTest<TodayBloc, TodayState>(
        'updates calories and reloads state',
        seed: () => TodayState.loaded(
          progress: testProgress,
          rings: testRings,
          protocol: testProtocol,
          lastUpdated: DateTime.now(),
        ),
        build: () {
          when(() => mockRepository.updateCaloriesConsumed(any(), any()))
              .thenAnswer((_) async {});
          when(() => mockGetDailyProgress()).thenAnswer(
            (_) async => testProgress.copyWith(caloriesConsumed: 1800),
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.updateCaloriesConsumed(1800)),
        expect: () => [
          isA<TodayLoaded>().having(
            (s) => s.progress.caloriesConsumed,
            'caloriesConsumed',
            1800,
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.updateCaloriesConsumed(any(), 1800))
              .called(1);
        },
      );
    });

    group('UpdateExerciseMinutes', () {
      blocTest<TodayBloc, TodayState>(
        'updates exercise minutes and reloads state',
        seed: () => TodayState.loaded(
          progress: testProgress,
          rings: testRings,
          protocol: testProtocol,
          lastUpdated: DateTime.now(),
        ),
        build: () {
          when(() => mockRepository.updateExerciseMinutes(any(), any()))
              .thenAnswer((_) async {});
          when(() => mockGetDailyProgress()).thenAnswer(
            (_) async => testProgress.copyWith(exerciseMinutes: 60),
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.updateExerciseMinutes(60)),
        expect: () => [
          isA<TodayLoaded>().having(
            (s) => s.progress.exerciseMinutes,
            'exerciseMinutes',
            60,
          ),
        ],
      );
    });

    group('UpdateSleepMinutes', () {
      blocTest<TodayBloc, TodayState>(
        'updates sleep minutes and reloads state',
        seed: () => TodayState.loaded(
          progress: testProgress,
          rings: testRings,
          protocol: testProtocol,
          lastUpdated: DateTime.now(),
        ),
        build: () {
          when(() => mockRepository.updateSleepMinutes(any(), any()))
              .thenAnswer((_) async {});
          when(() => mockGetDailyProgress()).thenAnswer(
            (_) async => testProgress.copyWith(sleepMinutes: 480),
          );
          when(() => mockGetDailyProgress.getRingSummary()).thenAnswer(
            (_) async => testRings,
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const TodayEvent.updateSleepMinutes(480)),
        expect: () => [
          isA<TodayLoaded>().having(
            (s) => s.progress.sleepMinutes,
            'sleepMinutes',
            480,
          ),
        ],
      );
    });

    group('TodayState extensions', () {
      test('hasData returns true for loaded state', () {
        final state = TodayState.loaded(
          progress: testProgress,
          rings: testRings,
          protocol: testProtocol,
          lastUpdated: DateTime.now(),
        );
        expect(state.hasData, isTrue);
      });

      test('hasData returns true for error state with previous data', () {
        final state = TodayState.error(
          message: 'Error',
          previousProgress: testProgress,
          previousRings: testRings,
        );
        expect(state.hasData, isTrue);
      });

      test('hasData returns false for initial state', () {
        const state = TodayState.initial();
        expect(state.hasData, isFalse);
      });

      test('hasData returns false for error state without previous data', () {
        const state = TodayState.error(message: 'Error');
        expect(state.hasData, isFalse);
      });

      test('isLoading returns true for loading state', () {
        const state = TodayState.loading();
        expect(state.isLoading, isTrue);
      });

      test('isError returns true for error state', () {
        const state = TodayState.error(message: 'Error');
        expect(state.isError, isTrue);
      });

      test('errorMessage returns message for error state', () {
        const state = TodayState.error(message: 'Test error');
        expect(state.errorMessage, 'Test error');
      });
    });

    group('RingSummary', () {
      test('calculates progress correctly', () {
        final rings = RingSummary.fromProgressAndTargets(
          caloriesConsumed: 1000,
          targetCalories: 2000,
          caloriesBurned: 150,
          targetCaloriesBurn: 300,
          exerciseMinutes: 30,
          targetExerciseMinutes: 60,
          sleepMinutes: 360,
          targetSleepMinutes: 480,
        );

        expect(rings.caloriesIn.progress, 0.5);
        expect(rings.caloriesOut.progress, 0.5);
        expect(rings.exercise.progress, 0.5);
        expect(rings.sleep.progress, 0.75);
      });

      test('overallProgress averages all rings', () {
        final rings = RingSummary.fromProgressAndTargets(
          caloriesConsumed: 2000,
          targetCalories: 2000,
          caloriesBurned: 300,
          targetCaloriesBurn: 300,
          exerciseMinutes: 60,
          targetExerciseMinutes: 60,
          sleepMinutes: 480,
          targetSleepMinutes: 480,
        );

        expect(rings.overallProgress, 1.0);
        expect(rings.completedRings, 4);
        expect(rings.allComplete, isTrue);
      });

      test('RingData formats display correctly', () {
        const ring = RingData(
          current: 1500,
          target: 2000,
          label: 'Calories In',
          unit: 'kcal',
        );

        expect(ring.progress, 0.75);
        expect(ring.progressPercent, '75%');
        expect(ring.remaining, 500);
        expect(ring.isComplete, isFalse);
        expect(ring.isOver, isFalse);
      });

      test('RingData handles over target', () {
        const ring = RingData(
          current: 2500,
          target: 2000,
          label: 'Calories In',
          unit: 'kcal',
        );

        expect(ring.progress, 1.25);
        expect(ring.clampedProgress, 1.0);
        expect(ring.isComplete, isTrue);
        expect(ring.isOver, isTrue);
      });
    });

    group('DailyProgress', () {
      test('empty creates zero progress', () {
        final empty = DailyProgress.empty(testDate);

        expect(empty.caloriesConsumed, 0);
        expect(empty.caloriesBurned, 0);
        expect(empty.exerciseMinutes, 0);
        expect(empty.sleepMinutes, 0);
      });

      test('netCalories calculates correctly', () {
        expect(testProgress.netCalories, 1300); // 1500 - 200
      });

      test('calculatedCalories matches macro totals', () {
        // 100*4 + 150*4 + 50*9 = 400 + 600 + 450 = 1450
        expect(testProgress.calculatedCalories, 1450);
      });
    });
  });
}

// Extension to add copyWith to DailyProgress for testing
extension DailyProgressCopyWith on DailyProgress {
  DailyProgress copyWith({
    String? id,
    DateTime? date,
    int? caloriesConsumed,
    int? caloriesBurned,
    int? exerciseMinutes,
    int? sleepMinutes,
    double? proteinGrams,
    double? carbsGrams,
    double? fatGrams,
    int? stepsCount,
    double? weightKg,
  }) {
    return DailyProgress(
      id: id ?? this.id,
      date: date ?? this.date,
      caloriesConsumed: caloriesConsumed ?? this.caloriesConsumed,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
      sleepMinutes: sleepMinutes ?? this.sleepMinutes,
      proteinGrams: proteinGrams ?? this.proteinGrams,
      carbsGrams: carbsGrams ?? this.carbsGrams,
      fatGrams: fatGrams ?? this.fatGrams,
      stepsCount: stepsCount ?? this.stepsCount,
      weightKg: weightKg ?? this.weightKg,
    );
  }
}
