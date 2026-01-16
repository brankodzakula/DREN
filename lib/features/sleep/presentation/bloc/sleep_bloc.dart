import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/health_sync_service.dart';
import '../../domain/entities/meditation.dart';
import '../../domain/entities/sleep_habit_log.dart';
import '../../domain/entities/sleep_schedule.dart';
import '../../domain/entities/sleep_session.dart';
import '../../domain/usecases/get_last_night_sleep.dart';
import '../../domain/usecases/get_meditations.dart';
import '../../domain/usecases/get_sleep_history.dart';
import '../../domain/usecases/get_sleep_schedule.dart';
import '../../domain/usecases/log_sleep_habits.dart';
import 'sleep_event.dart';
import 'sleep_state.dart';

@injectable
class SleepBloc extends Bloc<SleepEvent, SleepState> {
  final GetLastNightSleep _getLastNightSleep;
  final GetSleepSchedule _getSleepSchedule;
  final LogSleepHabits _logSleepHabits;
  final GetMeditations _getMeditations;
  final GetSleepHistory _getSleepHistory;
  final HealthSyncService _healthSyncService;

  Timer? _bedtimeTimer;

  SleepBloc(
    this._getLastNightSleep,
    this._getSleepSchedule,
    this._logSleepHabits,
    this._getMeditations,
    this._getSleepHistory,
    this._healthSyncService,
  ) : super(const SleepState.initial()) {
    on<LoadSleep>(_onLoadSleep);
    on<RefreshSleep>(_onRefresh);
    on<ToggleHabit>(_onToggleHabit);
    on<StartMeditation>(_onStartMeditation);
    on<StopMeditation>(_onStopMeditation);
    on<FilterByCategory>(_onFilterByCategory);
    on<CompleteMeditation>(_onCompleteMeditation);
    on<UpdateBedtimeCountdown>(_onUpdateBedtimeCountdown);
    on<SyncHealthSleep>(_onSyncHealthSleep);
  }

  @override
  Future<void> close() {
    _bedtimeTimer?.cancel();
    return super.close();
  }

  Future<void> _onLoadSleep(LoadSleep event, Emitter<SleepState> emit) async {
    emit(const SleepState.loading());

    try {
      // Load all data in parallel
      final results = await Future.wait([
        _getLastNightSleep(),
        _getSleepSchedule(),
        _logSleepHabits.getForDate(DateTime.now()),
        _getMeditations(),
        _getSleepHistory.getAverageScore(7),
      ]);

      final lastNight = results[0] as SleepSession?;
      final schedule = results[1] as SleepSchedule;
      final todayHabits = results[2] as SleepHabitLog?;
      final meditations = results[3] as List<Meditation>;
      final avgScore = results[4] as double;

      // Calculate time to bedtime
      final minutesToBedtime = _calculateMinutesToBedtime(schedule.targetBedtime);
      final isWindDownActive = _isWindDownActive(schedule.windDownStart);

      emit(SleepState.loaded(
        lastNight: lastNight,
        schedule: schedule,
        todayHabits: todayHabits,
        meditations: meditations,
        averageSleepScore: avgScore,
        minutesToBedtime: minutesToBedtime,
        isWindDownActive: isWindDownActive,
      ));

      // Start bedtime countdown timer
      _startBedtimeTimer();
    } catch (e) {
      emit(SleepState.error(message: e.toString()));
    }
  }

  Future<void> _onRefresh(RefreshSleep event, Emitter<SleepState> emit) async {
    // Keep current state while refreshing
    final currentState = state;

    try {
      final results = await Future.wait([
        _getLastNightSleep(),
        _getSleepSchedule(),
        _logSleepHabits.getForDate(DateTime.now()),
        _getMeditations(),
        _getSleepHistory.getAverageScore(7),
      ]);

      final lastNight = results[0] as SleepSession?;
      final schedule = results[1] as SleepSchedule;
      final todayHabits = results[2] as SleepHabitLog?;
      final meditations = results[3] as List<Meditation>;
      final avgScore = results[4] as double;

      final minutesToBedtime = _calculateMinutesToBedtime(schedule.targetBedtime);
      final isWindDownActive = _isWindDownActive(schedule.windDownStart);

      // Preserve playing meditation and category filter
      final playingMeditation = currentState.maybeMap(
        loaded: (s) => s.playingMeditation,
        orElse: () => null,
      );
      final selectedCategory = currentState.maybeMap(
        loaded: (s) => s.selectedCategory,
        orElse: () => null,
      );

      emit(SleepState.loaded(
        lastNight: lastNight,
        schedule: schedule,
        todayHabits: todayHabits,
        meditations: meditations,
        averageSleepScore: avgScore,
        minutesToBedtime: minutesToBedtime,
        isWindDownActive: isWindDownActive,
        playingMeditation: playingMeditation,
        selectedCategory: selectedCategory,
      ));
    } catch (e) {
      // On error, keep current state if loaded
      if (currentState is! SleepLoaded) {
        emit(SleepState.error(message: e.toString()));
      }
    }
  }

  Future<void> _onToggleHabit(ToggleHabit event, Emitter<SleepState> emit) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    try {
      final updatedHabits = await _logSleepHabits.toggleHabit(
        date: DateTime.now(),
        habitName: event.habitName,
        value: event.value,
      );

      emit(currentState.copyWith(todayHabits: updatedHabits));
    } catch (e) {
      // Silently fail - keep current state
    }
  }

  Future<void> _onStartMeditation(
    StartMeditation event,
    Emitter<SleepState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    try {
      final meditation = currentState.meditations.firstWhere(
        (m) => m.id == event.meditationId,
      );

      emit(currentState.copyWith(playingMeditation: meditation));
    } catch (e) {
      // Meditation not found
    }
  }

  Future<void> _onStopMeditation(
    StopMeditation event,
    Emitter<SleepState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    emit(currentState.copyWith(playingMeditation: null));
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<SleepState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    emit(currentState.copyWith(selectedCategory: event.category));
  }

  Future<void> _onCompleteMeditation(
    CompleteMeditation event,
    Emitter<SleepState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    // Mark meditation habit as completed if it was a wind-down meditation
    try {
      final updatedHabits = await _logSleepHabits.toggleHabit(
        date: DateTime.now(),
        habitName: 'meditationCompleted',
        value: true,
      );

      emit(currentState.copyWith(
        playingMeditation: null,
        todayHabits: updatedHabits,
      ));
    } catch (e) {
      emit(currentState.copyWith(playingMeditation: null));
    }
  }

  Future<void> _onUpdateBedtimeCountdown(
    UpdateBedtimeCountdown event,
    Emitter<SleepState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    final minutesToBedtime = _calculateMinutesToBedtime(
      currentState.schedule.targetBedtime,
    );
    final isWindDownActive = _isWindDownActive(
      currentState.schedule.windDownStart,
    );

    emit(currentState.copyWith(
      minutesToBedtime: minutesToBedtime,
      isWindDownActive: isWindDownActive,
    ));
  }

  void _startBedtimeTimer() {
    _bedtimeTimer?.cancel();
    _bedtimeTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => add(const SleepEvent.updateBedtimeCountdown()),
    );
  }

  int? _calculateMinutesToBedtime(TimeOfDay targetBedtime) {
    final now = DateTime.now();
    var bedtime = DateTime(
      now.year,
      now.month,
      now.day,
      targetBedtime.hour,
      targetBedtime.minute,
    );

    // If bedtime has passed, it's for tomorrow
    if (bedtime.isBefore(now)) {
      bedtime = bedtime.add(const Duration(days: 1));
    }

    final difference = bedtime.difference(now).inMinutes;
    return difference > 0 ? difference : null;
  }

  bool _isWindDownActive(TimeOfDay windDownStart) {
    final now = TimeOfDay.now();
    final nowMinutes = now.hour * 60 + now.minute;
    final windDownMinutes = windDownStart.hour * 60 + windDownStart.minute;

    // Handle wind-down that crosses midnight
    if (windDownMinutes > 12 * 60) {
      // Wind-down starts in evening (e.g., 21:00)
      return nowMinutes >= windDownMinutes || nowMinutes < 6 * 60;
    } else {
      // Wind-down starts after midnight (unlikely but handle it)
      return nowMinutes >= windDownMinutes;
    }
  }

  /// Sync sleep data from health platform (HealthKit/Health Connect)
  Future<void> _onSyncHealthSleep(
    SyncHealthSleep event,
    Emitter<SleepState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SleepLoaded) return;

    try {
      // Fetch sleep data from health platform
      final result = await _healthSyncService.syncSleep();

      if (result.isSuccess && result.data != null) {
        // Convert health sleep data to app sleep session
        final healthSleepSession = _healthSyncService.convertToSleepSession(
          result.data!,
          'health_sync',
        );

        if (healthSleepSession != null) {
          // Update state with health-synced sleep data
          // Only update if we don't have local sleep data or health data is more complete
          final shouldUpdate = currentState.lastNight == null ||
              (currentState.lastNight?.source == 'health_platform' &&
                  healthSleepSession.totalMinutes >
                      (currentState.lastNight?.totalMinutes ?? 0));

          if (shouldUpdate) {
            emit(currentState.copyWith(lastNight: healthSleepSession));
          }
        }
      }
    } catch (e) {
      // Silently fail - don't disrupt the UI for health sync errors
    }
  }
}
