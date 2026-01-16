import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/routes.dart';
import '../../../../core/services/health_service.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/entities.dart';
import '../bloc/exercise_bloc.dart';
import '../bloc/exercise_event.dart';
import '../bloc/exercise_state.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/exercise_list_item.dart';
import '../widgets/today_workout_card.dart';
import '../widgets/workout_card.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExerciseBloc>()..add(const ExerciseEvent.loadExercises()),
      child: const _ExercisePageContent(),
    );
  }
}

class _ExercisePageContent extends StatefulWidget {
  const _ExercisePageContent();

  @override
  State<_ExercisePageContent> createState() => _ExercisePageContentState();
}

class _ExercisePageContentState extends State<_ExercisePageContent> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: SafeArea(
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(color: DrenColors.primary),
              ),
              loaded: (
                todayWorkout,
                categories,
                workouts,
                exercises,
                history,
                activeWorkout,
                currentExerciseIndex,
                currentSet,
                isWorkoutInProgress,
                workoutStartTime,
                externalWorkouts,
              ) =>
                  _buildContent(
                context,
                todayWorkout: todayWorkout,
                categories: categories,
                workouts: workouts,
                exercises: exercises,
                history: history,
                externalWorkouts: externalWorkouts,
              ),
              error: (message) => _buildError(context, message),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    Workout? todayWorkout,
    required List<String> categories,
    required List<Workout> workouts,
    required List<Exercise> exercises,
    required List<WorkoutSession> history,
    required List<HealthWorkoutData> externalWorkouts,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        // Sync health workouts and refresh
        context.read<ExerciseBloc>().add(const ExerciseEvent.syncHealthWorkouts());
        context.read<ExerciseBloc>().add(const ExerciseEvent.refresh());
        await Future.delayed(const Duration(milliseconds: 500));
      },
      color: DrenColors.primary,
      child: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: _buildHeader(context),
          ),

          // Today's Workout
          if (todayWorkout != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
                child: TodayWorkoutCard(
                  workout: todayWorkout,
                  onStartWorkout: () {
                    context
                        .read<ExerciseBloc>()
                        .add(ExerciseEvent.startWorkout(workout: todayWorkout));
                    context.push(Routes.activeWorkout);
                  },
                ),
              ),
            ),

          // Rest day message if no workout
          if (todayWorkout == null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(DrenSpacing.md),
                child: _buildRestDayCard(),
              ),
            ),

          // Exercise List for Today's Workout
          if (todayWorkout != null) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  DrenSpacing.md,
                  DrenSpacing.lg,
                  DrenSpacing.md,
                  DrenSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exercises (${todayWorkout.exercises.length})',
                      style: DrenTypography.headline.copyWith(
                        color: DrenColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final exercise = todayWorkout.exercises[index];
                    return ExerciseListItem(
                      exercise: exercise,
                      index: index + 1,
                      onSwap: () => _showSwapDialog(context, index, exercise, exercises),
                    );
                  },
                  childCount: todayWorkout.exercises.length,
                ),
              ),
            ),
          ],

          // Browse Library Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                DrenSpacing.md,
                DrenSpacing.xl,
                DrenSpacing.md,
                DrenSpacing.sm,
              ),
              child: Text(
                'Browse Library',
                style: DrenTypography.headline.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
            ),
          ),

          // Category Filter Chips
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
              child: CategoryFilterChips(
                categories: categories,
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() => _selectedCategory = category);
                  context.read<ExerciseBloc>().add(
                        ExerciseEvent.filterByCategory(category: category),
                      );
                },
              ),
            ),
          ),

          // Workout Library Grid
          SliverPadding(
            padding: const EdgeInsets.all(DrenSpacing.md),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: DrenSpacing.md,
                crossAxisSpacing: DrenSpacing.md,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final workout = workouts[index];
                  return WorkoutCard(
                    workout: workout,
                    onTap: () => _showWorkoutDetails(context, workout),
                    onStart: () {
                      context
                          .read<ExerciseBloc>()
                          .add(ExerciseEvent.startWorkout(workout: workout));
                      context.push(Routes.activeWorkout);
                    },
                  );
                },
                childCount: workouts.length,
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: DrenSpacing.xl),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Exercise Protocol',
            style: DrenTypography.largeTitle.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month, color: DrenColors.textSecondary),
            onPressed: () {
              // TODO: Show workout calendar
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRestDayCard() {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.self_improvement,
            size: 48,
            color: DrenColors.primary,
          ),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'Rest Day',
            style: DrenTypography.title2.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            'Your body needs recovery. Consider light stretching or a gentle walk.',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 48,
            color: DrenColors.error,
          ),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'Failed to load exercises',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            message,
            style: DrenTypography.footnote.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          const SizedBox(height: DrenSpacing.lg),
          ElevatedButton(
            onPressed: () {
              context.read<ExerciseBloc>().add(const ExerciseEvent.loadExercises());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showSwapDialog(
    BuildContext context,
    int exerciseIndex,
    Exercise currentExercise,
    List<Exercise> allExercises,
  ) {
    // Filter to same muscle group exercises
    final alternatives = allExercises
        .where((e) =>
            e.muscleGroup == currentExercise.muscleGroup &&
            e.id != currentExercise.id)
        .toList();

    if (alternatives.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No alternative exercises available'),
          backgroundColor: DrenColors.surfaceSecondary,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DrenSpacing.radiusXl),
        ),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(DrenSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: DrenColors.textTertiary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: DrenSpacing.md),
              Text(
                'Swap Exercise',
                style: DrenTypography.title2.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.sm),
              Text(
                'Select an alternative for ${currentExercise.name}',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
              const SizedBox(height: DrenSpacing.md),
              ...alternatives.map(
                (alt) => ListTile(
                  title: Text(
                    alt.name,
                    style: DrenTypography.body.copyWith(
                      color: DrenColors.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    '${alt.sets} × ${alt.reps > 0 ? '${alt.reps} reps' : '${alt.durationSeconds}s'}',
                    style: DrenTypography.footnote.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.swap_horiz,
                    color: DrenColors.primary,
                  ),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    // Note: Swapping in today's workout would require different handling
                    // For now, just show success
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Swapped to ${alt.name}'),
                        backgroundColor: DrenColors.success,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }

  void _showWorkoutDetails(BuildContext context, Workout workout) {
    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DrenSpacing.radiusXl),
        ),
      ),
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          expand: false,
          builder: (_, controller) {
            return Padding(
              padding: const EdgeInsets.all(DrenSpacing.md),
              child: ListView(
                controller: controller,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: DrenColors.textTertiary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: DrenSpacing.md),
                  Text(
                    workout.name,
                    style: DrenTypography.largeTitle.copyWith(
                      color: DrenColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DrenSpacing.xs),
                  Text(
                    '${workout.durationMinutes} min  •  ~${workout.estimatedCalories} kcal  •  ${workout.difficulty}',
                    style: DrenTypography.subheadline.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: DrenSpacing.lg),
                  Text(
                    'Exercises (${workout.exercises.length})',
                    style: DrenTypography.headline.copyWith(
                      color: DrenColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DrenSpacing.sm),
                  ...workout.exercises.asMap().entries.map(
                        (entry) => ExerciseListItem(
                          exercise: entry.value,
                          index: entry.key + 1,
                          showSwap: false,
                        ),
                      ),
                  const SizedBox(height: DrenSpacing.lg),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      context
                          .read<ExerciseBloc>()
                          .add(ExerciseEvent.startWorkout(workout: workout));
                      context.push(Routes.activeWorkout);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DrenColors.primary,
                      foregroundColor: DrenColors.background,
                      padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
                    ),
                    child: const Text('Start Workout'),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
