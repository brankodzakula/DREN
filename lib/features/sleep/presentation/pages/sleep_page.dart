import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../bloc/sleep_bloc.dart';
import '../bloc/sleep_event.dart';
import '../bloc/sleep_state.dart';
import '../widgets/circadian_dial.dart';
import '../widgets/meditation_card.dart';
import '../widgets/sleep_score_widget.dart';
import '../widgets/wind_down_checklist.dart';

/// Main Sleep tab page showing sleep protocol and tracking
class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SleepBloc>()..add(const SleepEvent.loadSleep()),
      child: const _SleepPageContent(),
    );
  }
}

class _SleepPageContent extends StatelessWidget {
  const _SleepPageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: SafeArea(
        child: BlocBuilder<SleepBloc, SleepState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                // Sync health sleep data and refresh
                context.read<SleepBloc>().add(const SleepEvent.syncHealthSleep());
                context.read<SleepBloc>().add(const SleepEvent.refresh());
                await Future.delayed(const Duration(milliseconds: 500));
              },
              color: DrenColors.sleepRing,
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
                          color: DrenColors.sleepRing,
                        ),
                      ),
                    ),
                    loading: () => const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: DrenColors.sleepRing,
                        ),
                      ),
                    ),
                    loaded: (
                      lastNight,
                      schedule,
                      todayHabits,
                      meditations,
                      selectedCategory,
                      playingMeditation,
                      averageSleepScore,
                      minutesToBedtime,
                      isWindDownActive,
                    ) =>
                        SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DrenSpacing.md,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          // Last Night's Sleep Score
                          SleepScoreWidget(session: lastNight),
                          const SizedBox(height: DrenSpacing.md),

                          // Tonight's Schedule (Circadian Dial)
                          CircadianDial(
                            schedule: schedule,
                            minutesToBedtime: minutesToBedtime,
                            isWindDownActive: isWindDownActive,
                          ),
                          const SizedBox(height: DrenSpacing.md),

                          // Wind-Down Checklist
                          WindDownChecklist(
                            habits: todayHabits,
                            onToggle: (habitName, value) {
                              context.read<SleepBloc>().add(
                                    SleepEvent.toggleHabit(
                                      habitName: habitName,
                                      value: value,
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: DrenSpacing.md),

                          // Guided Meditations
                          MeditationCarousel(
                            meditations: meditations,
                            playingMeditation: playingMeditation,
                            selectedCategory: selectedCategory,
                            onCategoryChanged: (category) {
                              context.read<SleepBloc>().add(
                                    SleepEvent.filterByCategory(
                                      category: category,
                                    ),
                                  );
                            },
                            onPlay: (meditationId) {
                              context.read<SleepBloc>().add(
                                    SleepEvent.startMeditation(
                                      meditationId: meditationId,
                                    ),
                                  );
                            },
                            onStop: () {
                              context.read<SleepBloc>().add(
                                    const SleepEvent.stopMeditation(),
                                  );
                            },
                          ),
                          const SizedBox(height: DrenSpacing.xl),
                        ]),
                      ),
                    ),
                    error: (message) => SliverFillRemaining(
                      child: _buildErrorState(context, message),
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
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sleep Protocol',
                style: DrenTypography.largeTitle.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.xxs),
              BlocBuilder<SleepBloc, SleepState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (_, __, ___, ____, _____, ______, avgScore, minutesToBedtime, isWindDownActive) {
                      if (isWindDownActive) {
                        return Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: DrenColors.warning,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: DrenSpacing.xs),
                            Text(
                              'Wind-down active',
                              style: DrenTypography.subheadline.copyWith(
                                color: DrenColors.warning,
                              ),
                            ),
                          ],
                        );
                      } else if (minutesToBedtime != null) {
                        return Text(
                          _formatBedtimeCountdown(minutesToBedtime),
                          style: DrenTypography.subheadline.copyWith(
                            color: DrenColors.textSecondary,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
          // Stats icon
          IconButton(
            onPressed: () {
              // TODO: Navigate to sleep stats/history
            },
            icon: const Icon(
              Icons.bar_chart_rounded,
              color: DrenColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  String _formatBedtimeCountdown(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) {
      return 'Bedtime in ${hours}h ${mins}m';
    }
    return 'Bedtime in ${mins}m';
  }

  Widget _buildErrorState(BuildContext context, String message) {
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
                context.read<SleepBloc>().add(const SleepEvent.loadSleep());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DrenColors.sleepRing,
                foregroundColor: DrenColors.background,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
