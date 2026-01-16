import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../bloc/today_bloc.dart';
import '../bloc/today_event.dart';
import '../bloc/today_state.dart';
import '../widgets/protocol_rings_card.dart';
import '../widgets/protocol_summary_card.dart';
import '../widgets/supplements_checklist.dart';

/// Main Today tab page showing daily protocol progress
class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TodayBloc>()..add(const TodayEvent.loadToday()),
      child: const _TodayPageContent(),
    );
  }
}

class _TodayPageContent extends StatelessWidget {
  const _TodayPageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: SafeArea(
        child: BlocBuilder<TodayBloc, TodayState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                // Sync health data first, then refresh
                context.read<TodayBloc>().add(const TodayEvent.syncHealthData());
                await Future.delayed(const Duration(milliseconds: 300));
                context.read<TodayBloc>().add(const TodayEvent.refresh());
                // Wait for state to change
                await Future.delayed(const Duration(milliseconds: 500));
              },
              color: DrenColors.primary,
              backgroundColor: DrenColors.surfacePrimary,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Header
                  SliverToBoxAdapter(
                    child: _buildHeader(context),
                  ),
                  // Content based on state
                  state.when(
                    initial: () => const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: DrenColors.primary,
                        ),
                      ),
                    ),
                    loading: () => const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: DrenColors.primary,
                        ),
                      ),
                    ),
                    loaded: (progress, rings, protocol, lastUpdated) =>
                        SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DrenSpacing.md,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          // Protocol Rings Card
                          ProtocolRingsCard(rings: rings),
                          const SizedBox(height: DrenSpacing.md),

                          // Today's Protocol Section Header
                          Text(
                            "Today's Protocol",
                            style: DrenTypography.headline.copyWith(
                              color: DrenColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: DrenSpacing.sm),

                          // Meals Summary Card
                          MealsSummaryCard(
                            caloriesRemaining: protocol != null
                                ? protocol.targetCalories -
                                    progress.caloriesConsumed
                                : 0,
                            proteinRemaining: protocol != null
                                ? protocol.proteinGrams -
                                    progress.proteinGrams.toInt()
                                : 0,
                            mealsLogged: _calculateMealsLogged(
                                progress.caloriesConsumed),
                          ),
                          const SizedBox(height: DrenSpacing.sm),

                          // Workout Summary Card
                          WorkoutSummaryCard(
                            workoutType: protocol?.workoutType ?? 'Rest Day',
                            durationMinutes: protocol?.exerciseMinutes ?? 0,
                            estimatedCalories:
                                protocol?.estimatedCaloriesBurn ?? 0,
                            isCompleted: progress.exerciseMinutes > 0,
                            minutesCompleted: progress.exerciseMinutes,
                          ),
                          const SizedBox(height: DrenSpacing.sm),

                          // Sleep Summary Card
                          SleepSummaryCard(
                            targetBedtime: protocol?.targetBedtime,
                            windDownStart: protocol?.windDownStart,
                            sleepMinutesLastNight: progress.sleepMinutes,
                          ),
                          const SizedBox(height: DrenSpacing.md),

                          // Supplements Section
                          Text(
                            'Supplements Today',
                            style: DrenTypography.headline.copyWith(
                              color: DrenColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: DrenSpacing.sm),

                          const SupplementsChecklist(),
                          const SizedBox(height: DrenSpacing.xl),
                        ]),
                      ),
                    ),
                    error: (message, previousProgress, previousRings) =>
                        SliverFillRemaining(
                      child: _buildErrorState(
                        context,
                        message,
                        previousProgress,
                        previousRings,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final now = DateTime.now();
    final dayFormat = DateFormat('EEEE, MMMM d');

    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: DrenTypography.largeTitle.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.xxs),
              Text(
                dayFormat.format(now),
                style: DrenTypography.subheadline.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
            ],
          ),
          // Settings button
          GestureDetector(
            onTap: () => context.push(Routes.settings),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: DrenColors.surfaceSecondary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: DrenColors.primary,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.person,
                color: DrenColors.textSecondary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    String message,
    dynamic previousProgress,
    dynamic previousRings,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DrenSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: DrenColors.error,
              size: 48,
            ),
            const SizedBox(height: DrenSpacing.md),
            Text(
              'Something went wrong',
              style: DrenTypography.headline.copyWith(
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
            const SizedBox(height: DrenSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<TodayBloc>().add(const TodayEvent.loadToday());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DrenColors.primary,
                foregroundColor: DrenColors.background,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  int _calculateMealsLogged(int caloriesConsumed) {
    // Rough estimate: if calories > 0, at least 1 meal logged
    if (caloriesConsumed == 0) return 0;
    if (caloriesConsumed < 500) return 1;
    if (caloriesConsumed < 1000) return 2;
    return 3;
  }
}
