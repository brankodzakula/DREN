import 'package:bloc_test/bloc_test.dart';
import 'package:dren/core/services/health_sync_service.dart';
import 'package:dren/features/sleep/domain/entities/meditation.dart';
import 'package:dren/features/sleep/domain/entities/sleep_habit_log.dart';
import 'package:dren/features/sleep/domain/entities/sleep_schedule.dart';
import 'package:dren/features/sleep/domain/entities/sleep_session.dart';
import 'package:dren/features/sleep/domain/usecases/get_last_night_sleep.dart';
import 'package:dren/features/sleep/domain/usecases/get_meditations.dart';
import 'package:dren/features/sleep/domain/usecases/get_sleep_history.dart';
import 'package:dren/features/sleep/domain/usecases/get_sleep_schedule.dart';
import 'package:dren/features/sleep/domain/usecases/log_sleep_habits.dart';
import 'package:dren/features/sleep/presentation/bloc/sleep_bloc.dart';
import 'package:dren/features/sleep/presentation/bloc/sleep_event.dart';
import 'package:dren/features/sleep/presentation/bloc/sleep_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sleep_bloc_test.mocks.dart';

@GenerateMocks([
  GetLastNightSleep,
  GetSleepSchedule,
  LogSleepHabits,
  GetMeditations,
  GetSleepHistory,
  HealthSyncService,
])
void main() {
  late SleepBloc bloc;
  late MockGetLastNightSleep mockGetLastNightSleep;
  late MockGetSleepSchedule mockGetSleepSchedule;
  late MockLogSleepHabits mockLogSleepHabits;
  late MockGetMeditations mockGetMeditations;
  late MockGetSleepHistory mockGetSleepHistory;
  late MockHealthSyncService mockHealthSyncService;

  // Test data
  final testSleepSession = SleepSession(
    id: 'session-1',
    oderId: 'order-1',
    bedTime: DateTime(2024, 1, 1, 22, 0),
    wakeTime: DateTime(2024, 1, 2, 6, 0),
    totalMinutes: 480,
    deepSleepMinutes: 120,
    lightSleepMinutes: 240,
    remSleepMinutes: 90,
    awakeMinutes: 30,
    efficiency: 0.94,
    latencyMinutes: 10,
    sleepScore: 85,
    source: 'app',
  );

  const testSchedule = SleepSchedule(
    targetBedtime: TimeOfDay(hour: 22, minute: 0),
    targetWakeTime: TimeOfDay(hour: 6, minute: 0),
    targetSleepMinutes: 480,
    windDownStart: TimeOfDay(hour: 21, minute: 0),
    lastCaffeineCutoff: TimeOfDay(hour: 14, minute: 0),
    lastMealCutoff: TimeOfDay(hour: 18, minute: 0),
  );

  final testHabitLog = SleepHabitLog(
    id: 'habit-1',
    oderId: 'order-1',
    date: DateTime.now(),
    noCaffeineAfterCutoff: true,
    lastMealOnTime: true,
    screenFreeBeforeBed: false,
    roomTempOptimal: true,
    meditationCompleted: false,
  );

  const testMeditations = [
    Meditation(
      id: 'med-1',
      title: 'Evening Unwind',
      description: 'A gentle meditation',
      category: 'wind_down',
      durationMinutes: 10,
      audioUrl: 'assets/audio/test.mp3',
      thumbnailUrl: 'assets/images/test.jpg',
      isDownloaded: true,
    ),
    Meditation(
      id: 'med-2',
      title: 'Ocean Waves',
      description: 'Calming ocean sounds',
      category: 'soundscape',
      durationMinutes: 60,
      audioUrl: 'assets/audio/ocean.mp3',
      thumbnailUrl: 'assets/images/ocean.jpg',
      isDownloaded: true,
    ),
  ];

  setUp(() {
    mockGetLastNightSleep = MockGetLastNightSleep();
    mockGetSleepSchedule = MockGetSleepSchedule();
    mockLogSleepHabits = MockLogSleepHabits();
    mockGetMeditations = MockGetMeditations();
    mockGetSleepHistory = MockGetSleepHistory();
    mockHealthSyncService = MockHealthSyncService();

    bloc = SleepBloc(
      mockGetLastNightSleep,
      mockGetSleepSchedule,
      mockLogSleepHabits,
      mockGetMeditations,
      mockGetSleepHistory,
      mockHealthSyncService,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is SleepInitial', () {
    expect(bloc.state, const SleepState.initial());
  });

  group('LoadSleep', () {
    blocTest<SleepBloc, SleepState>(
      'emits [loading, loaded] when LoadSleep succeeds',
      build: () {
        when(mockGetLastNightSleep()).thenAnswer((_) async => testSleepSession);
        when(mockGetSleepSchedule()).thenAnswer((_) async => testSchedule);
        when(mockLogSleepHabits.getForDate(any))
            .thenAnswer((_) async => testHabitLog);
        when(mockGetMeditations()).thenAnswer((_) async => testMeditations);
        when(mockGetSleepHistory.getAverageScore(7))
            .thenAnswer((_) async => 82.5);
        return bloc;
      },
      act: (bloc) => bloc.add(const SleepEvent.loadSleep()),
      expect: () => [
        const SleepLoading(),
        isA<SleepLoaded>()
            .having((s) => s.lastNight, 'lastNight', testSleepSession)
            .having((s) => s.schedule, 'schedule', testSchedule)
            .having((s) => s.meditations, 'meditations', testMeditations)
            .having((s) => s.averageSleepScore, 'averageSleepScore', 82.5),
      ],
      verify: (_) {
        verify(mockGetLastNightSleep()).called(1);
        verify(mockGetSleepSchedule()).called(1);
        verify(mockGetMeditations()).called(1);
      },
    );

    blocTest<SleepBloc, SleepState>(
      'emits [loading, loaded] with null lastNight when no sleep data',
      build: () {
        when(mockGetLastNightSleep()).thenAnswer((_) async => null);
        when(mockGetSleepSchedule()).thenAnswer((_) async => testSchedule);
        when(mockLogSleepHabits.getForDate(any)).thenAnswer((_) async => null);
        when(mockGetMeditations()).thenAnswer((_) async => testMeditations);
        when(mockGetSleepHistory.getAverageScore(7))
            .thenAnswer((_) async => 0.0);
        return bloc;
      },
      act: (bloc) => bloc.add(const SleepEvent.loadSleep()),
      expect: () => [
        const SleepLoading(),
        isA<SleepLoaded>()
            .having((s) => s.lastNight, 'lastNight', null)
            .having((s) => s.todayHabits, 'todayHabits', null),
      ],
    );

    blocTest<SleepBloc, SleepState>(
      'emits [loading, error] when LoadSleep fails',
      build: () {
        when(mockGetLastNightSleep())
            .thenThrow(Exception('Failed to load sleep'));
        return bloc;
      },
      act: (bloc) => bloc.add(const SleepEvent.loadSleep()),
      expect: () => [
        const SleepLoading(),
        isA<SleepError>().having(
          (s) => s.message,
          'message',
          contains('Failed to load sleep'),
        ),
      ],
    );
  });

  group('ToggleHabit', () {
    blocTest<SleepBloc, SleepState>(
      'updates habit log when ToggleHabit is added',
      build: () {
        when(mockGetLastNightSleep()).thenAnswer((_) async => testSleepSession);
        when(mockGetSleepSchedule()).thenAnswer((_) async => testSchedule);
        when(mockLogSleepHabits.getForDate(any))
            .thenAnswer((_) async => testHabitLog);
        when(mockGetMeditations()).thenAnswer((_) async => testMeditations);
        when(mockGetSleepHistory.getAverageScore(7))
            .thenAnswer((_) async => 82.5);
        when(mockLogSleepHabits.toggleHabit(
          date: anyNamed('date'),
          habitName: anyNamed('habitName'),
          value: anyNamed('value'),
        )).thenAnswer((_) async => testHabitLog.copyWith(screenFreeBeforeBed: true));
        return bloc;
      },
      seed: () => SleepState.loaded(
        lastNight: testSleepSession,
        schedule: testSchedule,
        todayHabits: testHabitLog,
        meditations: testMeditations,
        averageSleepScore: 82.5,
      ),
      act: (bloc) => bloc.add(const SleepEvent.toggleHabit(
        habitName: 'screenFreeBeforeBed',
        value: true,
      )),
      expect: () => [
        isA<SleepLoaded>().having(
          (s) => s.todayHabits?.screenFreeBeforeBed,
          'screenFreeBeforeBed',
          true,
        ),
      ],
    );

    blocTest<SleepBloc, SleepState>(
      'does nothing when not in loaded state',
      build: () => bloc,
      act: (bloc) => bloc.add(const SleepEvent.toggleHabit(
        habitName: 'screenFreeBeforeBed',
        value: true,
      )),
      expect: () => [],
    );
  });

  group('StartMeditation', () {
    blocTest<SleepBloc, SleepState>(
      'sets playingMeditation when StartMeditation is added',
      build: () => bloc,
      seed: () => SleepState.loaded(
        schedule: testSchedule,
        meditations: testMeditations,
      ),
      act: (bloc) => bloc.add(const SleepEvent.startMeditation(
        meditationId: 'med-1',
      )),
      expect: () => [
        isA<SleepLoaded>().having(
          (s) => s.playingMeditation?.id,
          'playingMeditation',
          'med-1',
        ),
      ],
    );

    blocTest<SleepBloc, SleepState>(
      'does nothing when meditation not found',
      build: () => bloc,
      seed: () => SleepState.loaded(
        schedule: testSchedule,
        meditations: testMeditations,
      ),
      act: (bloc) => bloc.add(const SleepEvent.startMeditation(
        meditationId: 'non-existent',
      )),
      expect: () => [],
    );
  });

  group('StopMeditation', () {
    blocTest<SleepBloc, SleepState>(
      'clears playingMeditation when StopMeditation is added',
      build: () => bloc,
      seed: () => SleepState.loaded(
        schedule: testSchedule,
        meditations: testMeditations,
        playingMeditation: testMeditations[0],
      ),
      act: (bloc) => bloc.add(const SleepEvent.stopMeditation()),
      expect: () => [
        isA<SleepLoaded>().having(
          (s) => s.playingMeditation,
          'playingMeditation',
          null,
        ),
      ],
    );
  });

  group('FilterByCategory', () {
    blocTest<SleepBloc, SleepState>(
      'sets selectedCategory when FilterByCategory is added',
      build: () => bloc,
      seed: () => SleepState.loaded(
        schedule: testSchedule,
        meditations: testMeditations,
      ),
      act: (bloc) => bloc.add(const SleepEvent.filterByCategory(
        category: 'soundscape',
      )),
      expect: () => [
        isA<SleepLoaded>().having(
          (s) => s.selectedCategory,
          'selectedCategory',
          'soundscape',
        ),
      ],
    );

    blocTest<SleepBloc, SleepState>(
      'clears selectedCategory when null is passed',
      build: () => bloc,
      seed: () => SleepState.loaded(
        schedule: testSchedule,
        meditations: testMeditations,
        selectedCategory: 'wind_down',
      ),
      act: (bloc) => bloc.add(const SleepEvent.filterByCategory(
        category: null,
      )),
      expect: () => [
        isA<SleepLoaded>().having(
          (s) => s.selectedCategory,
          'selectedCategory',
          null,
        ),
      ],
    );
  });

  group('CompleteMeditation', () {
    blocTest<SleepBloc, SleepState>(
      'clears playingMeditation and marks habit when CompleteMeditation is added',
      build: () {
        when(mockLogSleepHabits.toggleHabit(
          date: anyNamed('date'),
          habitName: anyNamed('habitName'),
          value: anyNamed('value'),
        )).thenAnswer((_) async => testHabitLog.copyWith(meditationCompleted: true));
        return bloc;
      },
      seed: () => SleepState.loaded(
        schedule: testSchedule,
        meditations: testMeditations,
        playingMeditation: testMeditations[0],
        todayHabits: testHabitLog,
      ),
      act: (bloc) => bloc.add(const SleepEvent.completeMeditation(
        meditationId: 'med-1',
      )),
      expect: () => [
        isA<SleepLoaded>()
            .having((s) => s.playingMeditation, 'playingMeditation', null)
            .having(
              (s) => s.todayHabits?.meditationCompleted,
              'meditationCompleted',
              true,
            ),
      ],
    );
  });
}
