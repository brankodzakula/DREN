import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/entities.dart';
import '../bloc/exercise_bloc.dart';
import '../bloc/exercise_event.dart';
import '../bloc/exercise_state.dart';

/// Active workout screen with timer, exercise tracking, and completion flow
class ActiveWorkoutPage extends StatefulWidget {
  const ActiveWorkoutPage({super.key});

  @override
  State<ActiveWorkoutPage> createState() => _ActiveWorkoutPageState();
}

class _ActiveWorkoutPageState extends State<ActiveWorkoutPage> {
  Timer? _elapsedTimer;
  Timer? _restTimer;
  int _elapsedSeconds = 0;
  int _restSecondsRemaining = 0;
  bool _isPaused = false;
  bool _isResting = false;
  bool _showCompletion = false;
  WorkoutSession? _completedSession;

  @override
  void initState() {
    super.initState();
    _startElapsedTimer();
  }

  @override
  void dispose() {
    _elapsedTimer?.cancel();
    _restTimer?.cancel();
    super.dispose();
  }

  void _startElapsedTimer() {
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused && !_showCompletion) {
        setState(() => _elapsedSeconds++);
      }
    });
  }

  void _startRestTimer(int seconds) {
    setState(() {
      _isResting = true;
      _restSecondsRemaining = seconds;
    });

    _restTimer?.cancel();
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_restSecondsRemaining > 0) {
        setState(() => _restSecondsRemaining--);
      } else {
        timer.cancel();
        setState(() => _isResting = false);
        // Haptic feedback when rest is complete
        HapticFeedback.mediumImpact();
      }
    });
  }

  void _togglePause() {
    setState(() => _isPaused = !_isPaused);
    if (_isPaused) {
      _restTimer?.cancel();
    } else if (_isResting && _restSecondsRemaining > 0) {
      _startRestTimer(_restSecondsRemaining);
    }
  }

  void _skipRest() {
    _restTimer?.cancel();
    setState(() {
      _isResting = false;
      _restSecondsRemaining = 0;
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseBloc, ExerciseState>(
      listener: (context, state) {
        // Listen for workout completion
        if (state is ExerciseLoaded && !state.isWorkoutInProgress && _elapsedSeconds > 0) {
          // Workout was completed
          if (state.history.isNotEmpty) {
            setState(() {
              _showCompletion = true;
              _completedSession = state.history.first;
            });
          }
        }
      },
      builder: (context, state) {
        if (_showCompletion && _completedSession != null) {
          return _buildCompletionScreen(context, _completedSession!);
        }

        if (state is ExerciseLoaded && state.isWorkoutInProgress) {
          return _buildWorkoutScreen(context, state);
        }

        return _buildNoWorkoutScreen(context);
      },
    );
  }

  Widget _buildWorkoutScreen(BuildContext context, ExerciseLoaded state) {
    final workout = state.activeWorkout!;
    final currentExercise = workout.exercises[state.currentExerciseIndex];
    final isLastExercise = state.currentExerciseIndex == workout.exercises.length - 1;
    final isLastSet = state.currentSet == currentExercise.sets;
    final progress = (state.currentExerciseIndex + (state.currentSet / currentExercise.sets)) /
        workout.exercises.length;

    return Scaffold(
      backgroundColor: DrenColors.background,
      appBar: AppBar(
        backgroundColor: DrenColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: DrenColors.textPrimary),
          onPressed: () => _showExitConfirmation(context),
        ),
        title: Text(
          workout.name,
          style: DrenTypography.headline.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _isPaused ? Icons.play_arrow : Icons.pause,
              color: DrenColors.textPrimary,
            ),
            onPressed: _togglePause,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            LinearProgressIndicator(
              value: progress,
              backgroundColor: DrenColors.surfaceSecondary,
              valueColor: const AlwaysStoppedAnimation<Color>(DrenColors.primary),
              minHeight: 4,
            ),

            Expanded(
              child: _isResting
                  ? _buildRestScreen(context, currentExercise)
                  : _buildExerciseScreen(
                      context,
                      state,
                      currentExercise,
                      isLastExercise,
                      isLastSet,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseScreen(
    BuildContext context,
    ExerciseLoaded state,
    Exercise currentExercise,
    bool isLastExercise,
    bool isLastSet,
  ) {
    final workout = state.activeWorkout!;

    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      child: Column(
        children: [
          // Timer
          Text(
            _formatTime(_elapsedSeconds),
            style: DrenTypography.metricLarge.copyWith(
              color: _isPaused ? DrenColors.textTertiary : DrenColors.textPrimary,
              fontSize: 48,
            ),
          ),
          Text(
            _isPaused ? 'PAUSED' : 'Total Time',
            style: DrenTypography.caption1.copyWith(
              color: _isPaused ? DrenColors.warning : DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Exercise indicator dots
          _buildExerciseIndicators(workout.exercises, state.currentExerciseIndex),

          const Spacer(),

          // Current Exercise
          Container(
            padding: const EdgeInsets.all(DrenSpacing.lg),
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
              border: Border.all(
                color: DrenColors.primary.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Text(
                  currentExercise.name.toUpperCase(),
                  style: DrenTypography.title1.copyWith(
                    color: DrenColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: DrenSpacing.md),

                // Set indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(currentExercise.sets, (index) {
                    final isCompleted = index < state.currentSet - 1;
                    final isCurrent = index == state.currentSet - 1;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCompleted
                            ? DrenColors.success
                            : isCurrent
                                ? DrenColors.primary
                                : DrenColors.surfaceSecondary,
                        border: isCurrent
                            ? Border.all(color: DrenColors.primary, width: 2)
                            : null,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: DrenSpacing.sm),

                Text(
                  'Set ${state.currentSet} of ${currentExercise.sets}',
                  style: DrenTypography.headline.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
                const SizedBox(height: DrenSpacing.xs),

                // Reps or duration
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      currentExercise.reps > 0
                          ? Icons.repeat
                          : Icons.timer_outlined,
                      color: DrenColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: DrenSpacing.xs),
                    Text(
                      currentExercise.reps > 0
                          ? '${currentExercise.reps} reps'
                          : '${currentExercise.durationSeconds} seconds',
                      style: DrenTypography.title3.copyWith(
                        color: DrenColors.textSecondary,
                      ),
                    ),
                  ],
                ),

                // Instructions
                if (currentExercise.instructions != null) ...[
                  const SizedBox(height: DrenSpacing.md),
                  Text(
                    currentExercise.instructions!,
                    style: DrenTypography.footnote.copyWith(
                      color: DrenColors.textTertiary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),

          const Spacer(),

          // Complete Set Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isPaused
                  ? null
                  : () {
                      HapticFeedback.mediumImpact();

                      // Check if this is the last set and last exercise
                      if (isLastSet && isLastExercise) {
                        // Complete workout
                        context.read<ExerciseBloc>().add(const ExerciseEvent.completeWorkout());
                      } else if (isLastSet) {
                        // Move to next exercise
                        context.read<ExerciseBloc>().add(const ExerciseEvent.completeSet());
                      } else {
                        // Start rest timer, then complete set
                        context.read<ExerciseBloc>().add(const ExerciseEvent.completeSet());
                        _startRestTimer(currentExercise.restSeconds);
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: DrenColors.primary,
                foregroundColor: DrenColors.background,
                padding: const EdgeInsets.symmetric(vertical: DrenSpacing.lg),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                ),
              ),
              child: Text(
                isLastSet && isLastExercise
                    ? 'Finish Workout'
                    : isLastSet
                        ? 'Complete & Next Exercise'
                        : 'Complete Set',
                style: DrenTypography.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: DrenColors.background,
                ),
              ),
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          // Skip Button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: _isPaused
                  ? null
                  : () {
                      context.read<ExerciseBloc>().add(const ExerciseEvent.skipExercise());
                    },
              child: Text(
                'Skip Exercise',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textTertiary,
                ),
              ),
            ),
          ),
          const SizedBox(height: DrenSpacing.md),

          // Up Next
          if (!isLastExercise)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DrenSpacing.md,
                vertical: DrenSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: DrenColors.surfacePrimary,
                borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: DrenColors.textTertiary,
                  ),
                  const SizedBox(width: DrenSpacing.xs),
                  Text(
                    'Up next: ${workout.exercises[state.currentExerciseIndex + 1].name}',
                    style: DrenTypography.footnote.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRestScreen(BuildContext context, Exercise currentExercise) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.timer,
            size: 48,
            color: DrenColors.primary,
          ),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'REST',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xl),

          // Rest countdown
          Text(
            _formatTime(_restSecondsRemaining),
            style: DrenTypography.metricLarge.copyWith(
              color: DrenColors.primary,
              fontSize: 72,
            ),
          ),
          const SizedBox(height: DrenSpacing.md),

          // Progress ring
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: _restSecondsRemaining / currentExercise.restSeconds,
              strokeWidth: 8,
              backgroundColor: DrenColors.surfaceSecondary,
              valueColor: const AlwaysStoppedAnimation<Color>(DrenColors.primary),
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Skip rest button
          TextButton.icon(
            onPressed: _skipRest,
            icon: const Icon(Icons.skip_next, color: DrenColors.textSecondary),
            label: Text(
              'Skip Rest',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
          ),

          const SizedBox(height: DrenSpacing.lg),

          Text(
            'Get ready for the next set!',
            style: DrenTypography.footnote.copyWith(
              color: DrenColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseIndicators(List<Exercise> exercises, int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(exercises.length, (index) {
        final isCompleted = index < currentIndex;
        final isCurrent = index == currentIndex;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isCurrent ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isCompleted
                ? DrenColors.success
                : isCurrent
                    ? DrenColors.primary
                    : DrenColors.surfaceSecondary,
          ),
        );
      }),
    );
  }

  Widget _buildCompletionScreen(BuildContext context, WorkoutSession session) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DrenSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Celebration icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: DrenColors.success.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.celebration,
                  size: 64,
                  color: DrenColors.success,
                ),
              ),
              const SizedBox(height: DrenSpacing.xl),

              Text(
                'Workout Complete!',
                style: DrenTypography.largeTitle.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.sm),
              Text(
                'Great job! Keep up the momentum.',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),

              const SizedBox(height: DrenSpacing.xl),

              // Stats
              Container(
                padding: const EdgeInsets.all(DrenSpacing.lg),
                decoration: BoxDecoration(
                  color: DrenColors.surfacePrimary,
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
                ),
                child: Column(
                  children: [
                    _buildStatRow(
                      Icons.timer_outlined,
                      'Duration',
                      _formatTime(_elapsedSeconds),
                    ),
                    const Divider(color: DrenColors.surfaceSecondary),
                    _buildStatRow(
                      Icons.local_fire_department_outlined,
                      'Calories Burned',
                      '~${session.caloriesBurned} kcal',
                    ),
                    const Divider(color: DrenColors.surfaceSecondary),
                    _buildStatRow(
                      Icons.fitness_center,
                      'Category',
                      _capitalizeFirst(session.category),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Done button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DrenColors.primary,
                    foregroundColor: DrenColors.background,
                    padding: const EdgeInsets.symmetric(vertical: DrenSpacing.lg),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: DrenTypography.body.copyWith(
                      fontWeight: FontWeight.w600,
                      color: DrenColors.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DrenSpacing.sm),
      child: Row(
        children: [
          Icon(icon, color: DrenColors.textSecondary, size: 24),
          const SizedBox(width: DrenSpacing.md),
          Text(
            label,
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoWorkoutScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      appBar: AppBar(
        backgroundColor: DrenColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DrenColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center,
              size: 64,
              color: DrenColors.textTertiary,
            ),
            const SizedBox(height: DrenSpacing.md),
            Text(
              'No workout in progress',
              style: DrenTypography.headline.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
            const SizedBox(height: DrenSpacing.xs),
            Text(
              'Start a workout from the Exercise tab',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
            const SizedBox(height: DrenSpacing.lg),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: DrenColors.surfacePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
        ),
        title: Text(
          'End Workout?',
          style: DrenTypography.title2.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        content: Text(
          'You\'ve been working out for ${_formatTime(_elapsedSeconds)}. Your progress will not be saved.',
          style: DrenTypography.body.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Continue Workout',
              style: DrenTypography.body.copyWith(
                color: DrenColors.primary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ExerciseBloc>().add(const ExerciseEvent.cancelWorkout());
              context.pop();
            },
            child: Text(
              'End Workout',
              style: DrenTypography.body.copyWith(
                color: DrenColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
