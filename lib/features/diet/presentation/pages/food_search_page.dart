import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/food_item.dart';
import '../bloc/diet_bloc.dart';
import '../bloc/diet_event.dart';
import '../bloc/diet_state.dart';
import '../widgets/food_detail_sheet.dart';
import '../widgets/search_result_tile.dart';

/// Dedicated food search page
class FoodSearchPage extends StatefulWidget {
  final String? initialMealType;

  const FoodSearchPage({
    super.key,
    this.initialMealType,
  });

  @override
  State<FoodSearchPage> createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  late String _selectedMealType;

  @override
  void initState() {
    super.initState();
    _selectedMealType = widget.initialMealType ?? _getCurrentMealType();
    // Auto-focus search field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DietBloc>()..add(const DietEvent.loadMeals()),
      child: Scaffold(
        backgroundColor: DrenColors.background,
        appBar: AppBar(
          backgroundColor: DrenColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: DrenColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Add Food',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          actions: [
            // Barcode scanner button
            IconButton(
              icon: const Icon(Icons.qr_code_scanner, color: DrenColors.primary),
              onPressed: () => _openBarcodeScanner(context),
            ),
          ],
        ),
        body: Column(
          children: [
            // Search bar
            _buildSearchBar(context),

            // Meal type selector
            _buildMealTypeSelector(),

            // Content
            Expanded(
              child: BlocBuilder<DietBloc, DietState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildInitialContent(context, state),
                    loading: () => const Center(
                      child: CircularProgressIndicator(color: DrenColors.primary),
                    ),
                    loaded: (date, meals, summary, targets, recipes, recentFoods) =>
                        _buildInitialContent(context, state, recentFoods: recentFoods),
                    searching: (previousState, query) => _buildSearchingState(query),
                    searchResults: (previousState, query, results) =>
                        _buildSearchResults(context, results),
                    error: (message, previousState) => _buildErrorState(message),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.md),
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        style: DrenTypography.body.copyWith(color: DrenColors.textPrimary),
        decoration: InputDecoration(
          hintText: 'Search for food...',
          hintStyle: DrenTypography.body.copyWith(color: DrenColors.textTertiary),
          prefixIcon: const Icon(Icons.search, color: DrenColors.textSecondary),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: DrenColors.textSecondary),
                  onPressed: () {
                    _searchController.clear();
                    context.read<DietBloc>().add(const DietEvent.clearSearch());
                    setState(() {});
                  },
                )
              : null,
          filled: true,
          fillColor: DrenColors.surfacePrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            borderSide: const BorderSide(color: DrenColors.primary, width: 2),
          ),
        ),
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          setState(() {});
          if (value.length >= 2) {
            context.read<DietBloc>().add(DietEvent.searchFood(query: value));
          } else if (value.isEmpty) {
            context.read<DietBloc>().add(const DietEvent.clearSearch());
          }
        },
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            context.read<DietBloc>().add(DietEvent.searchFood(query: value));
          }
        },
      ),
    );
  }

  Widget _buildMealTypeSelector() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _MealTypeChip(
            label: 'Breakfast',
            isSelected: _selectedMealType == 'breakfast',
            onTap: () => setState(() => _selectedMealType = 'breakfast'),
          ),
          const SizedBox(width: DrenSpacing.xs),
          _MealTypeChip(
            label: 'Lunch',
            isSelected: _selectedMealType == 'lunch',
            onTap: () => setState(() => _selectedMealType = 'lunch'),
          ),
          const SizedBox(width: DrenSpacing.xs),
          _MealTypeChip(
            label: 'Dinner',
            isSelected: _selectedMealType == 'dinner',
            onTap: () => setState(() => _selectedMealType = 'dinner'),
          ),
          const SizedBox(width: DrenSpacing.xs),
          _MealTypeChip(
            label: 'Snack',
            isSelected: _selectedMealType == 'snack',
            onTap: () => setState(() => _selectedMealType = 'snack'),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialContent(
    BuildContext context,
    DietState state, {
    List<FoodItem>? recentFoods,
  }) {
    return ListView(
      padding: const EdgeInsets.all(DrenSpacing.md),
      children: [
        // Quick actions
        _buildQuickActions(context),
        const SizedBox(height: DrenSpacing.lg),

        // Recent foods
        if (recentFoods != null && recentFoods.isNotEmpty) ...[
          Text(
            'Recent',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),
          ...recentFoods.take(5).map((food) => SearchResultTile(
                food: food,
                onTap: () => _showFoodDetail(context, food),
                onQuickAdd: () => _quickAddFood(context, food),
              )),
          const SizedBox(height: DrenSpacing.lg),
        ],

        // Favorites placeholder
        Text(
          'Favorites',
          style: DrenTypography.headline.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        const SizedBox(height: DrenSpacing.sm),
        _buildEmptyFavorites(),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionCard(
            icon: Icons.qr_code_scanner,
            label: 'Scan Barcode',
            onTap: () => _openBarcodeScanner(context),
          ),
        ),
        const SizedBox(width: DrenSpacing.sm),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.add_circle_outline,
            label: 'Create Food',
            onTap: () {
              // TODO: Navigate to create custom food
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon: Create custom food')),
              );
            },
          ),
        ),
        const SizedBox(width: DrenSpacing.sm),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.menu_book,
            label: 'Recipes',
            onTap: () {
              // TODO: Navigate to recipes
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon: Recipe browser')),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyFavorites() {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: Column(
        children: [
          Icon(
            Icons.favorite_border,
            color: DrenColors.textTertiary,
            size: 32,
          ),
          const SizedBox(height: DrenSpacing.sm),
          Text(
            'No favorites yet',
            style: DrenTypography.footnote.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          Text(
            'Tap the heart icon on foods to add them here',
            style: DrenTypography.caption2.copyWith(
              color: DrenColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchingState(String query) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: DrenColors.primary),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'Searching for "$query"...',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context, List<FoodItem> results) {
    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              color: DrenColors.textTertiary,
              size: 64,
            ),
            const SizedBox(height: DrenSpacing.md),
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
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(DrenSpacing.md),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final food = results[index];
        return SearchResultTile(
          food: food,
          onTap: () => _showFoodDetail(context, food),
          onQuickAdd: () => _quickAddFood(context, food),
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: DrenColors.error,
            size: 64,
          ),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'Something went wrong',
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
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _openBarcodeScanner(BuildContext context) {
    context.push('/diet/scan');
  }

  void _showFoodDetail(BuildContext context, FoodItem food) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => FoodDetailSheet(
        food: food,
        mealType: _selectedMealType,
        onLog: (loggedFood, servings) {
          context.read<DietBloc>().add(DietEvent.quickLogFood(
                food: loggedFood,
                mealType: _selectedMealType,
                servings: servings,
              ));
          Navigator.pop(sheetContext);
          // Show confirmation and optionally go back
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${food.name} added to ${_selectedMealType}'),
              backgroundColor: DrenColors.success,
            ),
          );
        },
      ),
    );
  }

  void _quickAddFood(BuildContext context, FoodItem food) {
    context.read<DietBloc>().add(DietEvent.quickLogFood(
          food: food,
          mealType: _selectedMealType,
        ));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${food.name} added to ${_selectedMealType}'),
        backgroundColor: DrenColors.success,
      ),
    );
  }

  String _getCurrentMealType() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'breakfast';
    if (hour < 15) return 'lunch';
    if (hour < 21) return 'dinner';
    return 'snack';
  }
}

/// Meal type selector chip
class _MealTypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MealTypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.md,
          vertical: DrenSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isSelected ? DrenColors.primary : DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: DrenTypography.subheadline.copyWith(
            color: isSelected ? DrenColors.background : DrenColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// Quick action card
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionCard({
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
            Icon(icon, color: DrenColors.primary, size: 28),
            const SizedBox(height: DrenSpacing.xs),
            Text(
              label,
              style: DrenTypography.caption1.copyWith(
                color: DrenColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
