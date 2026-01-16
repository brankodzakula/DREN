import 'package:bloc_test/bloc_test.dart';
import 'package:dren/core/services/health_sync_service.dart';
import 'package:dren/features/exercise/domain/entities/entities.dart';
import 'package:dren/features/exercise/domain/usecases/usecases.dart';
import 'package:dren/features/exercise/presentation/bloc/exercise_bloc.dart';
import 'package:dren/features/exercise/presentation/bloc/exercise_event.dart';
import 'package:dren/features/exercise/presentation/bloc/exercise_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTodayWorkout extends Mock implements GetTodayWorkout {}

class MockGetExerciseLibrary extends Mock implements GetExerciseLibrary {}

class MockLogWorkoutSession extends Mock implements LogWorkoutSession {}

class MockHealthSyncService extends Mock implements HealthSyncService {}

void main() {
  late ExerciseBloc bloc;
  late MockGetTodayWorkout mockGetTodayWorkout;
  late MockGetExerciseLibrary mockGetExerciseLibrary;
  late MockLogWorkoutSession mockLogWorkoutSession;
  late MockHealthSyncService mockHealthSyncService;

  // Sample test data
  final testExercise1 = Exercise(
    id: 'push_ups',
    name: 'Push-Ups',
    muscleGroup: 'chest',
    sets: 3,
    reps: 12,
    restSeconds: 60,
  );

  final testExercise2 = Exercise(
    id: 'squats',
    name: 'Bodyweight Squats',
    muscleGroup: 'legs',
    sets: 3,
    reps: 15,
    restSeconds: 60,
  );

  final testExercise3 = Exercise(
    id: 'plank',
    name: 'Plank',
    muscleGroup: 'core',
    sets: 3,
    reps: 0,
    durationSeconds: 30,
    restSeconds: 45,
  );

  final alternativeExercise = Exercise(
    id: 'knee_push_ups',
    name: 'Knee Push-Ups',
    muscleGroup: 'chest',
    sets: 3,
    reps: 15,
    restSeconds: 60,
  );

  final testWorkout = Workout(
    id: 'full_body_beginner',
    name: 'Full Body Basics',
    category: 'strength',
    durationMinutes: 20,
    difficulty: 'beginner',
    equipmentRequired: [],
    estimatedCalories: 150,
    exercises: [testExercise1, testExercise2, testExercise3],
  );

  final testWorkout2 = Workout(
    id: 'hiit_beginner',
    name: 'HIIT Starter',
    category: 'hiit',
    durationMinutes: 15,
    difficulty: 'beginner',
    equipmentRequired: [],
    estimatedCalories: 120,
    exercises: [testExercise2],
  );

  final testSession = WorkoutSession(
    id: 'session_1',
    oderId: 'order_1',
    workoutId: 'full_body_beginner',
    startTime: DateTime(2024, 1, 1, 10, 0),
    endTime: DateTime(2024, 1, 1, 10, 20),
    durationMinutes: 20,
    caloriesBurned: 150,
    category: 'strength',
    source: 'app',
  );

  setUp(() {
    mockGetTodayWorkout = MockGetTodayWorkout();
    mockGetExerciseLibrary = MockGetExerciseLibrary();
    mockLogWorkoutSession = MockLogWorkoutSession();
    mockHealthSyncService = MockHealthSyncService();

    bloc = ExerciseBloc(
      mockGetTodayWorkout,
      mockGetExerciseLibrary,
      mockLogWorkoutSession,
      mockHealthSyncService,
    );
  });

  tearDown(() {
    bloc.close();
  });

  setUpAll(() {
    registerFallbackValue(WorkoutSession(
      id: 'fallback',
      oderId: 'fallback',
      workoutId: null,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      durationMinutes: 0,
      caloriesBurned: 0,
      category: 'strength',
      source: 'app',
    ));
  });

  group('ExerciseBloc', () {
    test('initial state is ExerciseInitial', () {
      expect(bloc.state, const ExerciseState.initial());
    });

    group('LoadExercises', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'emits [loading, loaded] when LoadExercises is successful',
        build: () {
          when(() => mockGetTodayWorkout()).thenAnswer((_) async => testWorkout);
          when(() => mockGetExerciseLibrary())
              .thenAnswer((_) async => [testWorkout, testWorkout2]);
          when(() => mockGetExerciseLibrary.getAllExercises())
              .thenAnswer((_) async => [testExercise1, testExercise2, testExercise3]);
          when(() => mockLogWorkoutSession.getHistory())
              .thenAnswer((_) async => [testSession]);
          return bloc;
        },
        act: (bloc) => bloc.add(const ExerciseEvent.loadExercises()),
        expect: () => [
          const ExerciseState.loading(),
          isA<ExerciseLoaded>()
              .having((s) => s.todayWorkout, 'todayWorkout', testWorkout)
              .having((s) => s.workouts.length, 'workouts.length', 2)
              .having((s) => s.exercises.length, 'exercises.length', 3)
              .having((s) => s.history.length, 'history.length', 1)
              .having((s) => s.categories, 'categories', ['hiit', 'strength']),
        ],
        verify: (_) {
          verify(() => mockGetTodayWorkout()).called(1);
          verify(() => mockGetExerciseLibrary()).called(1);
          verify(() => mockGetExerciseLibrary.getAllExercises()).called(1);
          verify(() => mockLogWorkoutSession.getHistory()).called(1);
        },
      );

      blocTest<ExerciseBloc, ExerciseState>(
        'emits [loading, error] when LoadExercises fails',
        build: () {
          when(() => mockGetTodayWorkout())
              .thenThrow(Exception('Failed to load'));
          return bloc;
        },
        act: (bloc) => bloc.add(const ExerciseEvent.loadExercises()),
        expect: () => [
          const ExerciseState.loading(),
          isA<ExerciseError>(),
        ],
      );

      blocTest<ExerciseBloc, ExerciseState>(
        'handles null todayWorkout (rest day)',
        build: () {
          when(() => mockGetTodayWorkout()).thenAnswer((_) async => null);
          when(() => mockGetExerciseLibrary())
              .thenAnswer((_) async => [testWorkout]);
          when(() => mockGetExerciseLibrary.getAllExercises())
              .thenAnswer((_) async => [testExercise1]);
          when(() => mockLogWorkoutSession.getHistory())
              .thenAnswer((_) async => []);
          return bloc;
        },
        act: (bloc) => bloc.add(const ExerciseEvent.loadExercises()),
        expect: () => [
          const ExerciseState.loading(),
          isA<ExerciseLoaded>()
              .having((s) => s.todayWorkout, 'todayWorkout', null),
        ],
      );
    });

    group('StartWorkout', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'starts workout and sets initial state',
        build: () => bloc,
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3],
          history: [],
        ),
        act: (bloc) => bloc.add(ExerciseEvent.startWorkout(workout: testWorkout)),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.isWorkoutInProgress, 'isWorkoutInProgress', true)
              .having((s) => s.activeWorkout, 'activeWorkout', testWorkout)
              .having((s) => s.currentExerciseIndex, 'currentExerciseIndex', 0)
              .having((s) => s.currentSet, 'currentSet', 1)
              .having((s) => s.workoutStartTime, 'workoutStartTime', isNotNull),
        ],
      );
    });

    group('CompleteSet', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'increments set counter when not on last set',
        build: () => bloc,
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3],
          history: [],
          activeWorkout: testWorkout,
          currentExerciseIndex: 0,
          currentSet: 1,
          isWorkoutInProgress: true,
          workoutStartTime: DateTime.now(),
        ),
        act: (bloc) => bloc.add(const ExerciseEvent.completeSet()),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.currentSet, 'currentSet', 2),
        ],
      );

      blocTest<ExerciseBloc, ExerciseState>(
        'moves to next exercise when completing last set',
        build: () => bloc,
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3],
          history: [],
          activeWorkout: testWorkout,
          currentExerciseIndex: 0,
          currentSet: 3, // Last set
          isWorkoutInProgress: true,
          workoutStartTime: DateTime.now(),
        ),
        act: (bloc) => bloc.add(const ExerciseEvent.completeSet()),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.currentExerciseIndex, 'currentExerciseIndex', 1)
              .having((s) => s.currentSet, 'currentSet', 1),
        ],
      );
    });

    group('SwapExercise', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'swaps exercise at specified index',
        build: () => bloc,
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3, alternativeExercise],
          history: [],
          activeWorkout: testWorkout,
          currentExerciseIndex: 0,
          currentSet: 2,
          isWorkoutInProgress: true,
          workoutStartTime: DateTime.now(),
        ),
        act: (bloc) => bloc.add(ExerciseEvent.swapExercise(
          exerciseIndex: 0,
          newExercise: alternativeExercise,
        )),
        expect: () => [
          isA<ExerciseLoaded>()
              .having(
                (s) => s.activeWorkout?.exercises[0].id,
                'swapped exercise id',
                'knee_push_ups',
              )
              .having((s) => s.currentSet, 'currentSet', 1), // Reset set counter
        ],
      );

      blocTest<ExerciseBloc, ExerciseState>(
        'does not reset set counter when swapping different exercise',
        build: () => bloc,
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3, alternativeExercise],
          history: [],
          activeWorkout: testWorkout,
          currentExerciseIndex: 0,
          currentSet: 2,
          isWorkoutInProgress: true,
          workoutStartTime: DateTime.now(),
        ),
        act: (bloc) => bloc.add(ExerciseEvent.swapExercise(
          exerciseIndex: 1, // Swap a different exercise
          newExercise: alternativeExercise,
        )),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.currentSet, 'currentSet', 2), // Keep set counter
        ],
      );
    });

    group('CancelWorkout', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'cancels workout and resets state',
        build: () => bloc,
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3],
          history: [],
          activeWorkout: testWorkout,
          currentExerciseIndex: 1,
          currentSet: 2,
          isWorkoutInProgress: true,
          workoutStartTime: DateTime.now(),
        ),
        act: (bloc) => bloc.add(const ExerciseEvent.cancelWorkout()),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.isWorkoutInProgress, 'isWorkoutInProgress', false)
              .having((s) => s.activeWorkout, 'activeWorkout', null)
              .having((s) => s.currentExerciseIndex, 'currentExerciseIndex', 0)
              .having((s) => s.currentSet, 'currentSet', 1)
              .having((s) => s.workoutStartTime, 'workoutStartTime', null),
        ],
      );
    });

    group('CompleteWorkout', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'completes workout and logs session',
        build: () {
          when(() => mockLogWorkoutSession(any())).thenAnswer((_) async {});
          when(() => mockLogWorkoutSession.getHistory())
              .thenAnswer((_) async => [testSession]);
          return bloc;
        },
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['strength'],
          workouts: [testWorkout],
          exercises: [testExercise1, testExercise2, testExercise3],
          history: [],
          activeWorkout: testWorkout,
          currentExerciseIndex: 2,
          currentSet: 3,
          isWorkoutInProgress: true,
          workoutStartTime: DateTime.now().subtract(const Duration(minutes: 20)),
        ),
        act: (bloc) => bloc.add(const ExerciseEvent.completeWorkout()),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.isWorkoutInProgress, 'isWorkoutInProgress', false)
              .having((s) => s.activeWorkout, 'activeWorkout', null)
              .having((s) => s.history.length, 'history.length', 1),
        ],
        verify: (_) {
          verify(() => mockLogWorkoutSession(any())).called(1);
          verify(() => mockLogWorkoutSession.getHistory()).called(1);
        },
      );
    });

    group('FilterByCategory', () {
      blocTest<ExerciseBloc, ExerciseState>(
        'filters workouts by category',
        build: () {
          when(() => mockGetExerciseLibrary.byCategory('hiit'))
              .thenAnswer((_) async => [testWorkout2]);
          return bloc;
        },
        seed: () => ExerciseState.loaded(
          todayWorkout: testWorkout,
          categories: ['hiit', 'strength'],
          workouts: [testWorkout, testWorkout2],
          exercises: [testExercise1, testExercise2],
          history: [],
        ),
        act: (bloc) => bloc.add(const ExerciseEvent.filterByCategory(category: 'hiit')),
        expect: () => [
          isA<ExerciseLoaded>()
              .having((s) => s.workouts.length, 'workouts.length', 1)
              .having((s) => s.workouts.first.category, 'category', 'hiit'),
        ],
      );
    });
  });
}
