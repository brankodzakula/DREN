import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../bloc/diet_bloc.dart';
import '../bloc/diet_event.dart';
import '../bloc/diet_state.dart';
import '../widgets/eating_window_badge.dart';
import '../widgets/meal_card.dart';
import '../widgets/nutrition_dashboard.dart';
import '../widgets/quick_log_section.dart';

/// Main Diet tab page showing nutrition tracking
class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DietBloc>()..add(const DietEvent.loadMeals()),
      child: const _DietPageContent(),
    );
  }
}

class _DietPageContent extends StatelessWidget {
  const _DietPageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: SafeArea(
        child: BlocBuilder<DietBloc, DietState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<DietBloc>().add(const DietEvent.refresh());
                await Future.delayed(const Duration(milliseconds: 500));
              },
              color: DrenColors.primary,
              backgroundColor: DrenColors.surfacePrimary,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Header
                  SliverToBoxAdapter(
                    child: _buildHeader(context, state),
                  ),
                  // Content based on state
                  _buildContent(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, DietState state) {
    DateTime date = DateTime.now();
    if (state is DietLoaded) {
      date = state.date;
    } else if (state is DietSearching) {
      date = state.previousState.date;
    } else if (state is DietSearchResults) {
      date = state.previousState.date;
    }

    final isToday = _isToday(date);
    final dayFormat = DateFormat('EEEE, MMMM d');

    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Diet',
                style: DrenTypography.largeTitle.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              // Date selector
              GestureDetector(
                onTap: () => _showDatePicker(context, date),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DrenSpacing.sm,
                    vertical: DrenSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: DrenColors.surfacePrimary,
                    borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: DrenColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: DrenSpacing.xs),
                      Text(
                        isToday ? 'Today' : DateFormat('MMM d').format(date),
                        style: DrenTypography.subheadline.copyWith(
                          color: DrenColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DrenSpacing.xxs),
          Text(
            dayFormat.format(date),
            style: DrenTypography.subheadline.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, DietState state) {
    return state.when(
      initial: () => const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(color: DrenColors.primary),
        ),
      ),
      loading: () => const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(color: DrenColors.primary),
        ),
      ),
      loaded: (date, meals, nutritionSummary, targets, quickLogRecipes, recentFoods) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Nutrition Dashboard
              NutritionDashboard(
                caloriesConsumed: nutritionSummary.totalCalories,
                caloriesTarget: targets.targetCalories,
                proteinConsumed: nutritionSummary.totalProtein,
                proteinTarget: targets.targetProtein.toDouble(),
                carbsConsumed: nutritionSummary.totalCarbs,
                carbsTarget: targets.targetCarbs.toDouble(),
                fatConsumed: nutritionSummary.totalFat,
                fatTarget: targets.targetFat.toDouble(),
              ),
              const SizedBox(height: DrenSpacing.md),

              // Eating Window Badge
              if (targets.eatingWindowStart != null && targets.eatingWindowEnd != null)
                EatingWindowBadge(
                  startTime: targets.eatingWindowStart!,
                  endTime: targets.eatingWindowEnd!,
                ),
              if (targets.eatingWindowStart != null)
                const SizedBox(height: DrenSpacing.md),

              // Quick Log Section
              if (quickLogRecipes.isNotEmpty) ...[
                QuickLogSection(
                  recipes: quickLogRecipes,
                  recentFoods: recentFoods,
                  onRecipeTap: (recipe) {
                    // TODO: Navigate to recipe detail or quick log
                  },
                  onFoodTap: (food) {
                    context.read<DietBloc>().add(DietEvent.quickLogFood(
                      food: food,
                      mealType: _getCurrentMealType(),
                    ));
                  },
                ),
                const SizedBox(height: DrenSpacing.md),
              ],

              // Today's Meals Section
              Text(
                "Today's Meals",
                style: DrenTypography.headline.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.sm),

              if (meals.isEmpty)
                _buildEmptyMealsState()
              else
                ...meals.map((meal) => Padding(
                  padding: const EdgeInsets.only(bottom: DrenSpacing.sm),
                  child: MealCard(
                    meal: meal,
                    onTap: () {
                      // TODO: Navigate to meal detail
                    },
                    onDelete: () {
                      context.read<DietBloc>().add(
                        DietEvent.deleteMeal(mealId: meal.id),
                      );
                    },
                  ),
                )),

              const SizedBox(height: DrenSpacing.md),

              // Action Buttons
              _buildActionButtons(context),
              const SizedBox(height: DrenSpacing.xl),
            ]),
          ),
        );
      },
      searching: (previousState, query) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(height: DrenSpacing.xxl),
            const Center(
              child: CircularProgressIndicator(color: DrenColors.primary),
            ),
            const SizedBox(height: DrenSpacing.md),
            Center(
              child: Text(
                'Searching for "$query"...',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
            ),
          ]),
        ),
      ),
      searchResults: (previousState, query, results) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            // Search header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Results for "$query"',
                  style: DrenTypography.headline.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<DietBloc>().add(const DietEvent.clearSearch());
                  },
                  child: Text(
                    'Cancel',
                    style: DrenTypography.body.copyWith(
                      color: DrenColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DrenSpacing.sm),
            if (results.isEmpty)
              _buildNoResultsState(query)
            else
              ...results.map((food) => _buildSearchResultItem(context, food)),
          ]),
        ),
      ),
      error: (message, previousState) => SliverFillRemaining(
        child: _buildErrorState(context, message),
      ),
    );
  }

  Widget _buildEmptyMealsState() {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        children: [
          Icon(
            Icons.restaurant_outlined,
            color: DrenColors.textTertiary,
            size: 48,
          ),
          const SizedBox(height: DrenSpacing.sm),
          Text(
            'No meals logged yet',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            'Tap the buttons below to log your first meal',
            style: DrenTypography.footnote.copyWith(
              color: DrenColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNoResultsState(String query) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            color: DrenColors.textTertiary,
            size: 48,
          ),
          const SizedBox(height: DrenSpacing.sm),
          Text(
            'No results found',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            'Try a different search term or scan a barcode',
            style: DrenTypography.footnote.copyWith(
              color: DrenColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResultItem(BuildContext context, dynamic food) {
    return Container(
      margin: const EdgeInsets.only(bottom: DrenSpacing.sm),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.md,
          vertical: DrenSpacing.xs,
        ),
        title: Text(
          food.displayName,
          style: DrenTypography.body.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        subtitle: Text(
          '${food.calories} kcal · ${food.servingInfo}',
          style: DrenTypography.footnote.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_circle, color: DrenColors.primary),
          onPressed: () {
            context.read<DietBloc>().add(DietEvent.quickLogFood(
              food: food,
              mealType: _getCurrentMealType(),
            ));
          },
        ),
        onTap: () {
          // TODO: Show food detail / portion selector
        },
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.search,
            label: 'Search',
            onTap: () => context.push(Routes.foodSearch),
          ),
        ),
        const SizedBox(width: DrenSpacing.sm),
        Expanded(
          child: _ActionButton(
            icon: Icons.qr_code_scanner,
            label: 'Scan',
            onTap: () => context.push(Routes.barcodeScanner),
          ),
        ),
        const SizedBox(width: DrenSpacing.sm),
        Expanded(
          child: _ActionButton(
            icon: Icons.menu_book,
            label: 'Recipes',
            onTap: () {
              // TODO: Navigate to recipes (Phase 4 future)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon: Recipe browser')),
              );
            },
          ),
        ),
      ],
    );
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
                context.read<DietBloc>().add(const DietEvent.loadMeals());
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context, DateTime currentDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: DrenColors.primary,
              onPrimary: DrenColors.background,
              surface: DrenColors.surfacePrimary,
              onSurface: DrenColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && context.mounted) {
      context.read<DietBloc>().add(DietEvent.changeDate(date: picked));
    }
  }

  void _showSearchDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DrenSpacing.radiusXl),
        ),
      ),
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
          ),
          child: Container(
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
                  'Search Food',
                  style: DrenTypography.title3.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
                const SizedBox(height: DrenSpacing.md),
                TextField(
                  autofocus: true,
                  style: DrenTypography.body.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search for food...',
                    prefixIcon: Icon(Icons.search, color: DrenColors.textSecondary),
                  ),
                  onSubmitted: (query) {
                    Navigator.pop(bottomSheetContext);
                    if (query.isNotEmpty) {
                      context.read<DietBloc>().add(
                        DietEvent.searchFood(query: query),
                      );
                    }
                  },
                ),
                const SizedBox(height: DrenSpacing.lg),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  String _getCurrentMealType() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'breakfast';
    if (hour < 15) return 'lunch';
    if (hour < 21) return 'dinner';
    return 'snack';
  }
}

/// Action button widget for bottom actions
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        ),
        child: Column(
          children: [
            Icon(icon, color: DrenColors.primary, size: 24),
            const SizedBox(height: DrenSpacing.xs),
            Text(
              label,
              style: DrenTypography.caption1.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
