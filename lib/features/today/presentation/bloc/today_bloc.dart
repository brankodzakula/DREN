import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/health_sync_service.dart';
import '../../domain/entities/daily_progress.dart';
import '../../domain/entities/ring_summary.dart';
import '../../domain/repositories/today_repository.dart';
import '../../domain/usecases/get_daily_progress.dart';
import '../../domain/usecases/get_today_protocol.dart';
import 'today_event.dart';
import 'today_state.dart';

/// BLoC for managing Today tab state
@injectable
class TodayBloc extends Bloc<TodayEvent, TodayState> {
  final GetDailyProgress _getDailyProgress;
  final GetTodayProtocol _getTodayProtocol;
  final TodayRepository _repository;
  final HealthSyncService _healthSyncService;

  TodayBloc(
    this._getDailyProgress,
    this._getTodayProtocol,
    this._repository,
    this._healthSyncService,
  ) : super(const TodayState.initial()) {
    on<LoadToday>(_onLoadToday);
    on<RefreshToday>(_onRefresh);
    on<UpdateCaloriesConsumed>(_onUpdateCaloriesConsumed);
    on<UpdateCaloriesBurned>(_onUpdateCaloriesBurned);
    on<UpdateExerciseMinutes>(_onUpdateExerciseMinutes);
    on<UpdateSleepMinutes>(_onUpdateSleepMinutes);
    on<UpdateMacros>(_onUpdateMacros);
    on<UpdateSteps>(_onUpdateSteps);
    on<UpdateWeight>(_onUpdateWeight);
    on<RegenerateProtocol>(_onRegenerateProtocol);
    on<SyncHealthData>(_onSyncHealthData);
  }

  /// Handle LoadToday event
  Future<void> _onLoadToday(
    LoadToday event,
    Emitter<TodayState> emit,
  ) async {
    emit(const TodayState.loading());

    try {
      final results = await Future.wait([
        _getDailyProgress(),
        _getDailyProgress.getRingSummary(),
        _getTodayProtocol(),
      ]);

      final progress = results[0] as DailyProgress;
      final rings = results[1] as RingSummary;
      final protocol = results[2];

      emit(TodayState.loaded(
        progress: progress,
        rings: rings,
        protocol: protocol as dynamic,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(TodayState.error(
        message: 'Failed to load today\'s data: ${e.toString()}',
      ));
    }
  }

  /// Handle RefreshToday event
  Future<void> _onRefresh(
    RefreshToday event,
    Emitter<TodayState> emit,
  ) async {
    // Keep previous data while refreshing
    final previousProgress = state.progress;
    final previousRings = state.rings;

    try {
      final results = await Future.wait([
        _getDailyProgress(),
        _getDailyProgress.getRingSummary(),
        _getTodayProtocol(),
      ]);

      final progress = results[0] as DailyProgress;
      final rings = results[1] as RingSummary;
      final protocol = results[2];

      emit(TodayState.loaded(
        progress: progress,
        rings: rings,
        protocol: protocol as dynamic,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(TodayState.error(
        message: 'Failed to refresh: ${e.toString()}',
        previousProgress: previousProgress,
        previousRings: previousRings,
      ));
    }
  }

  /// Handle UpdateCaloriesConsumed event
  Future<void> _onUpdateCaloriesConsumed(
    UpdateCaloriesConsumed event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateCaloriesConsumed(DateTime.now(), event.calories),
    );
  }

  /// Handle UpdateCaloriesBurned event
  Future<void> _onUpdateCaloriesBurned(
    UpdateCaloriesBurned event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateCaloriesBurned(DateTime.now(), event.calories),
    );
  }

  /// Handle UpdateExerciseMinutes event
  Future<void> _onUpdateExerciseMinutes(
    UpdateExerciseMinutes event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateExerciseMinutes(DateTime.now(), event.minutes),
    );
  }

  /// Handle UpdateSleepMinutes event
  Future<void> _onUpdateSleepMinutes(
    UpdateSleepMinutes event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateSleepMinutes(DateTime.now(), event.minutes),
    );
  }

  /// Handle UpdateMacros event
  Future<void> _onUpdateMacros(
    UpdateMacros event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateMacros(
        DateTime.now(),
        event.protein,
        event.carbs,
        event.fat,
      ),
    );
  }

  /// Handle UpdateSteps event
  Future<void> _onUpdateSteps(
    UpdateSteps event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateSteps(DateTime.now(), event.steps),
    );
  }

  /// Handle UpdateWeight event
  Future<void> _onUpdateWeight(
    UpdateWeight event,
    Emitter<TodayState> emit,
  ) async {
    await _updateAndReload(
      emit,
      () => _repository.updateWeight(DateTime.now(), event.weightKg),
    );
  }

  /// Handle RegenerateProtocol event
  Future<void> _onRegenerateProtocol(
    RegenerateProtocol event,
    Emitter<TodayState> emit,
  ) async {
    final previousProgress = state.progress;
    final previousRings = state.rings;

    try {
      final protocol = await _getTodayProtocol.regenerate();

      if (protocol != null && previousProgress != null) {
        // Recalculate rings with new protocol
        final rings = RingSummary.fromProgressAndTargets(
          caloriesConsumed: previousProgress.caloriesConsumed,
          targetCalories: protocol.targetCalories,
          caloriesBurned: previousProgress.caloriesBurned,
          targetCaloriesBurn: protocol.estimatedCaloriesBurn,
          exerciseMinutes: previousProgress.exerciseMinutes,
          targetExerciseMinutes: protocol.exerciseMinutes,
          sleepMinutes: previousProgress.sleepMinutes,
          targetSleepMinutes: 8 * 60, // 8 hours
        );

        emit(TodayState.loaded(
          progress: previousProgress,
          rings: rings,
          protocol: protocol,
          lastUpdated: DateTime.now(),
        ));
      }
    } catch (e) {
      emit(TodayState.error(
        message: 'Failed to regenerate protocol: ${e.toString()}',
        previousProgress: previousProgress,
        previousRings: previousRings,
      ));
    }
  }

  /// Helper to update data and reload state
  Future<void> _updateAndReload(
    Emitter<TodayState> emit,
    Future<void> Function() updateFn,
  ) async {
    final previousProgress = state.progress;
    final previousRings = state.rings;

    try {
      await updateFn();

      // Reload progress and rings
      final progress = await _getDailyProgress();
      final rings = await _getDailyProgress.getRingSummary();
      final protocol = state.protocol;

      emit(TodayState.loaded(
        progress: progress,
        rings: rings,
        protocol: protocol,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(TodayState.error(
        message: 'Failed to update: ${e.toString()}',
        previousProgress: previousProgress,
        previousRings: previousRings,
      ));
    }
  }

  /// Handle SyncHealthData event - sync from HealthKit/Health Connect
  Future<void> _onSyncHealthData(
    SyncHealthData event,
    Emitter<TodayState> emit,
  ) async {
    final previousProgress = state.progress;
    final previousRings = state.rings;

    try {
      // Sync activity data from health platform
      final activityResult = await _healthSyncService.syncTodayActivity();

      if (activityResult.isSuccess && activityResult.data != null) {
        final healthData = activityResult.data!;
        final now = DateTime.now();

        // Update steps if available
        if (healthData.steps > 0) {
          await _repository.updateSteps(now, healthData.steps);
        }

        // Update calories burned from health platform
        if (healthData.activeCalories > 0) {
          await _repository.updateCaloriesBurned(now, healthData.activeCalories);
        }
      }

      // Sync sleep data
      final sleepResult = await _healthSyncService.syncSleep();
      if (sleepResult.isSuccess && sleepResult.data != null) {
        final sleepData = sleepResult.data!;
        if (sleepData.totalSleepMinutes > 0) {
          await _repository.updateSleepMinutes(
            DateTime.now(),
            sleepData.totalSleepMinutes,
          );
        }
      }

      // Reload progress and rings with updated data
      final progress = await _getDailyProgress();
      final rings = await _getDailyProgress.getRingSummary();
      final protocol = state.protocol;

      emit(TodayState.loaded(
        progress: progress,
        rings: rings,
        protocol: protocol,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      // Don't emit error state for health sync failures
      // Just keep the current state
      if (previousProgress != null && previousRings != null) {
        emit(TodayState.loaded(
          progress: previousProgress,
          rings: previousRings,
          protocol: state.protocol,
          lastUpdated: DateTime.now(),
        ));
      }
    }
  }
}
