import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/health_sync_service.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import 'exercise_event.dart';
import 'exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetTodayWorkout _getTodayWorkout;
  final GetExerciseLibrary _getExerciseLibrary;
  final LogWorkoutSession _logWorkoutSession;
  final HealthSyncService _healthSyncService;

  ExerciseBloc(
    this._getTodayWorkout,
    this._getExerciseLibrary,
    this._logWorkoutSession,
    this._healthSyncService,
  ) : super(const ExerciseState.initial()) {
    on<LoadExercises>(_onLoadExercises);
    on<RefreshExercises>(_onRefresh);
    on<StartWorkout>(_onStartWorkout);
    on<CompleteSet>(_onCompleteSet);
    on<SkipExercise>(_onSkipExercise);
    on<NextExercise>(_onNextExercise);
    on<CompleteWorkout>(_onCompleteWorkout);
    on<CancelWorkout>(_onCancelWorkout);
    on<SwapExercise>(_onSwapExercise);
    on<FilterByCategory>(_onFilterByCategory);
    on<FilterByDifficulty>(_onFilterByDifficulty);
    on<SyncHealthWorkouts>(_onSyncHealthWorkouts);
  }

  Future<void> _onLoadExercises(
    LoadExercises event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(const ExerciseState.loading());

    try {
      final todayWorkout = await _getTodayWorkout();
      final workouts = await _getExerciseLibrary();
      final exercises = await _getExerciseLibrary.getAllExercises();
      final history = await _logWorkoutSession.getHistory();

      // Extract unique categories
      final categories = workouts.map((w) => w.category).toSet().toList()
        ..sort();

      emit(ExerciseState.loaded(
        todayWorkout: todayWorkout,
        categories: categories,
        workouts: workouts,
        exercises: exercises,
        history: history,
      ));
    } catch (e) {
      emit(ExerciseState.error(message: e.toString()));
    }
  }

  Future<void> _onRefresh(
    RefreshExercises event,
    Emitter<ExerciseState> emit,
  ) async {
    // Keep current state while refreshing
    final currentState = state;

    try {
      final todayWorkout = await _getTodayWorkout();
      final workouts = await _getExerciseLibrary();
      final exercises = await _getExerciseLibrary.getAllExercises();
      final history = await _logWorkoutSession.getHistory();

      final categories = workouts.map((w) => w.category).toSet().toList()
        ..sort();

      // Preserve active workout state if exists
      if (currentState is ExerciseLoaded && currentState.isWorkoutInProgress) {
        emit(currentState.copyWith(
          todayWorkout: todayWorkout,
          categories: categories,
          workouts: workouts,
          exercises: exercises,
          history: history,
        ));
      } else {
        emit(ExerciseState.loaded(
          todayWorkout: todayWorkout,
          categories: categories,
          workouts: workouts,
          exercises: exercises,
          history: history,
        ));
      }
    } catch (e) {
      emit(ExerciseState.error(message: e.toString()));
    }
  }

  void _onStartWorkout(
    StartWorkout event,
    Emitter<ExerciseState> emit,
  ) {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;

    emit(currentState.copyWith(
      activeWorkout: event.workout,
      currentExerciseIndex: 0,
      currentSet: 1,
      isWorkoutInProgress: true,
      workoutStartTime: DateTime.now(),
    ));
  }

  void _onCompleteSet(
    CompleteSet event,
    Emitter<ExerciseState> emit,
  ) {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;
    if (!currentState.isWorkoutInProgress) return;

    final activeWorkout = currentState.activeWorkout;
    if (activeWorkout == null) return;

    final currentExercise =
        activeWorkout.exercises[currentState.currentExerciseIndex];
    final totalSets = currentExercise.sets;

    if (currentState.currentSet < totalSets) {
      // More sets to complete
      emit(currentState.copyWith(
        currentSet: currentState.currentSet + 1,
      ));
    } else {
      // All sets complete, move to next exercise
      add(const ExerciseEvent.nextExercise());
    }
  }

  void _onSkipExercise(
    SkipExercise event,
    Emitter<ExerciseState> emit,
  ) {
    add(const ExerciseEvent.nextExercise());
  }

  void _onNextExercise(
    NextExercise event,
    Emitter<ExerciseState> emit,
  ) {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;
    if (!currentState.isWorkoutInProgress) return;

    final activeWorkout = currentState.activeWorkout;
    if (activeWorkout == null) return;

    final nextIndex = currentState.currentExerciseIndex + 1;

    if (nextIndex < activeWorkout.exercises.length) {
      // More exercises to do
      emit(currentState.copyWith(
        currentExerciseIndex: nextIndex,
        currentSet: 1,
      ));
    } else {
      // Workout complete
      add(const ExerciseEvent.completeWorkout());
    }
  }

  Future<void> _onCompleteWorkout(
    CompleteWorkout event,
    Emitter<ExerciseState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;
    if (!currentState.isWorkoutInProgress) return;

    final activeWorkout = currentState.activeWorkout;
    final startTime = currentState.workoutStartTime;
    if (activeWorkout == null || startTime == null) return;

    final endTime = DateTime.now();
    final durationMinutes = endTime.difference(startTime).inMinutes;

    // Create and log the workout session
    final session = WorkoutSession(
      id: const Uuid().v4(),
      oderId: const Uuid().v4(),
      workoutId: activeWorkout.id,
      startTime: startTime,
      endTime: endTime,
      durationMinutes: durationMinutes > 0 ? durationMinutes : 1,
      caloriesBurned: _calculateCaloriesBurned(activeWorkout, durationMinutes),
      category: activeWorkout.category,
      source: 'app',
    );

    try {
      await _logWorkoutSession(session);

      // Refresh history
      final history = await _logWorkoutSession.getHistory();

      emit(currentState.copyWith(
        activeWorkout: null,
        currentExerciseIndex: 0,
        currentSet: 1,
        isWorkoutInProgress: false,
        workoutStartTime: null,
        history: history,
      ));
    } catch (e) {
      emit(ExerciseState.error(message: e.toString()));
    }
  }

  void _onCancelWorkout(
    CancelWorkout event,
    Emitter<ExerciseState> emit,
  ) {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;

    emit(currentState.copyWith(
      activeWorkout: null,
      currentExerciseIndex: 0,
      currentSet: 1,
      isWorkoutInProgress: false,
      workoutStartTime: null,
    ));
  }

  void _onSwapExercise(
    SwapExercise event,
    Emitter<ExerciseState> emit,
  ) {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;
    if (!currentState.isWorkoutInProgress) return;

    final activeWorkout = currentState.activeWorkout;
    if (activeWorkout == null) return;

    // Create a new exercise list with the swapped exercise
    final updatedExercises = List<Exercise>.from(activeWorkout.exercises);
    if (event.exerciseIndex >= 0 &&
        event.exerciseIndex < updatedExercises.length) {
      updatedExercises[event.exerciseIndex] = event.newExercise;
    }

    // Create updated workout with new exercises
    final updatedWorkout = Workout(
      id: activeWorkout.id,
      name: activeWorkout.name,
      category: activeWorkout.category,
      durationMinutes: activeWorkout.durationMinutes,
      difficulty: activeWorkout.difficulty,
      equipmentRequired: activeWorkout.equipmentRequired,
      estimatedCalories: activeWorkout.estimatedCalories,
      exercises: updatedExercises,
      videoUrl: activeWorkout.videoUrl,
      thumbnailUrl: activeWorkout.thumbnailUrl,
    );

    emit(currentState.copyWith(
      activeWorkout: updatedWorkout,
      // Reset to set 1 if swapping current exercise
      currentSet:
          event.exerciseIndex == currentState.currentExerciseIndex ? 1 : currentState.currentSet,
    ));
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<ExerciseState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;

    try {
      List<Workout> filteredWorkouts;
      if (event.category == null) {
        filteredWorkouts = await _getExerciseLibrary();
      } else {
        filteredWorkouts =
            await _getExerciseLibrary.byCategory(event.category!);
      }

      emit(currentState.copyWith(workouts: filteredWorkouts));
    } catch (e) {
      emit(ExerciseState.error(message: e.toString()));
    }
  }

  Future<void> _onFilterByDifficulty(
    FilterByDifficulty event,
    Emitter<ExerciseState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;

    try {
      List<Workout> filteredWorkouts;
      if (event.difficulty == null) {
        filteredWorkouts = await _getExerciseLibrary();
      } else {
        filteredWorkouts =
            await _getExerciseLibrary.byDifficulty(event.difficulty!);
      }

      emit(currentState.copyWith(workouts: filteredWorkouts));
    } catch (e) {
      emit(ExerciseState.error(message: e.toString()));
    }
  }

  int _calculateCaloriesBurned(Workout workout, int actualMinutes) {
    // Scale estimated calories based on actual duration vs expected
    final expectedMinutes = workout.durationMinutes;
    if (expectedMinutes <= 0) return workout.estimatedCalories;

    final ratio = actualMinutes / expectedMinutes;
    return (workout.estimatedCalories * ratio).round();
  }

  /// Sync workouts from health platform (HealthKit/Health Connect)
  Future<void> _onSyncHealthWorkouts(
    SyncHealthWorkouts event,
    Emitter<ExerciseState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ExerciseLoaded) return;

    try {
      // Fetch external workouts from health platform
      final result = await _healthSyncService.syncWorkouts();

      if (result.isSuccess && result.data != null) {
        // Filter out duplicates based on local workout history
        final filteredWorkouts = _healthSyncService.filterDuplicates(
          result.data!,
          currentState.history,
        );

        emit(currentState.copyWith(externalWorkouts: filteredWorkouts));
      }
    } catch (e) {
      // Silently fail - don't disrupt the UI for health sync errors
    }
  }
}
