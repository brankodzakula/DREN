import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/food_item.dart';

/// Bottom sheet for viewing food details and selecting portion
class FoodDetailSheet extends StatefulWidget {
  final FoodItem food;
  final String mealType;
  final void Function(FoodItem food, double servings) onLog;

  const FoodDetailSheet({
    super.key,
    required this.food,
    required this.mealType,
    required this.onLog,
  });

  @override
  State<FoodDetailSheet> createState() => _FoodDetailSheetState();
}

class _FoodDetailSheetState extends State<FoodDetailSheet> {
  double _servings = 1.0;
  late TextEditingController _servingsController;

  @override
  void initState() {
    super.initState();
    _servingsController = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _servingsController.dispose();
    super.dispose();
  }

  FoodItem get _scaledFood => widget.food.scaled(_servings * widget.food.servingSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DrenSpacing.radiusXl),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DrenSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
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

              // Food name and brand
              Text(
                widget.food.name,
                style: DrenTypography.title3.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              if (widget.food.brand != null) ...[
                const SizedBox(height: DrenSpacing.xxs),
                Text(
                  widget.food.brand!,
                  style: DrenTypography.body.copyWith(
                    color: DrenColors.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: DrenSpacing.md),

              // Serving size selector
              _buildServingSelector(),
              const SizedBox(height: DrenSpacing.md),

              // Nutrition summary
              _buildNutritionSummary(),
              const SizedBox(height: DrenSpacing.md),

              // Detailed macros
              _buildDetailedMacros(),
              const SizedBox(height: DrenSpacing.lg),

              // Meal type indicator
              Row(
                children: [
                  Icon(
                    _getMealTypeIcon(),
                    color: DrenColors.textSecondary,
                    size: 16,
                  ),
                  const SizedBox(width: DrenSpacing.xs),
                  Text(
                    'Adding to ${_getMealTypeLabel()}',
                    style: DrenTypography.caption1.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DrenSpacing.md),

              // Log button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => widget.onLog(_scaledFood, _servings),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DrenColors.primary,
                    foregroundColor: DrenColors.background,
                    padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
                  ),
                  child: Text(
                    'Log ${_scaledFood.calories} kcal',
                    style: DrenTypography.buttonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServingSelector() {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Serving Size',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),
          Row(
            children: [
              // Decrease button
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                color: DrenColors.primary,
                onPressed: _servings > 0.25
                    ? () {
                        setState(() {
                          _servings = (_servings - 0.25).clamp(0.25, 10.0);
                          _servingsController.text = _formatServings(_servings);
                        });
                      }
                    : null,
              ),

              // Servings input
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _servingsController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      style: DrenTypography.title2.copyWith(
                        color: DrenColors.textPrimary,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        final parsed = double.tryParse(value);
                        if (parsed != null && parsed > 0 && parsed <= 10) {
                          setState(() => _servings = parsed);
                        }
                      },
                    ),
                    Text(
                      'servings (${widget.food.servingInfo} each)',
                      style: DrenTypography.caption2.copyWith(
                        color: DrenColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Increase button
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                color: DrenColors.primary,
                onPressed: _servings < 10
                    ? () {
                        setState(() {
                          _servings = (_servings + 0.25).clamp(0.25, 10.0);
                          _servingsController.text = _formatServings(_servings);
                        });
                      }
                    : null,
              ),
            ],
          ),

          // Quick portion buttons
          const SizedBox(height: DrenSpacing.sm),
          Wrap(
            spacing: DrenSpacing.xs,
            runSpacing: DrenSpacing.xs,
            children: [
              _PortionChip(
                label: '0.5',
                isSelected: _servings == 0.5,
                onTap: () => _setServings(0.5),
              ),
              _PortionChip(
                label: '1',
                isSelected: _servings == 1.0,
                onTap: () => _setServings(1.0),
              ),
              _PortionChip(
                label: '1.5',
                isSelected: _servings == 1.5,
                onTap: () => _setServings(1.5),
              ),
              _PortionChip(
                label: '2',
                isSelected: _servings == 2.0,
                onTap: () => _setServings(2.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionSummary() {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NutritionStat(
            label: 'Calories',
            value: '${_scaledFood.calories}',
            unit: 'kcal',
            color: DrenColors.primary,
          ),
          _NutritionStat(
            label: 'Protein',
            value: '${_scaledFood.protein.round()}',
            unit: 'g',
            color: DrenColors.proteinColor,
          ),
          _NutritionStat(
            label: 'Carbs',
            value: '${_scaledFood.carbs.round()}',
            unit: 'g',
            color: DrenColors.carbsColor,
          ),
          _NutritionStat(
            label: 'Fat',
            value: '${_scaledFood.fat.round()}',
            unit: 'g',
            color: DrenColors.fatColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedMacros() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutrition Details',
          style: DrenTypography.headline.copyWith(
            color: DrenColors.textPrimary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: DrenSpacing.sm),
        _MacroRow(label: 'Protein', value: _scaledFood.protein, unit: 'g'),
        _MacroRow(label: 'Carbohydrates', value: _scaledFood.carbs, unit: 'g'),
        if (_scaledFood.fiber != null)
          _MacroRow(
            label: '  Fiber',
            value: _scaledFood.fiber!,
            unit: 'g',
            isSubItem: true,
          ),
        if (_scaledFood.sugar != null)
          _MacroRow(
            label: '  Sugar',
            value: _scaledFood.sugar!,
            unit: 'g',
            isSubItem: true,
          ),
        _MacroRow(label: 'Fat', value: _scaledFood.fat, unit: 'g'),
        if (_scaledFood.sodium != null)
          _MacroRow(label: 'Sodium', value: _scaledFood.sodium!, unit: 'mg'),
      ],
    );
  }

  void _setServings(double value) {
    setState(() {
      _servings = value;
      _servingsController.text = _formatServings(value);
    });
  }

  String _formatServings(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  IconData _getMealTypeIcon() {
    switch (widget.mealType) {
      case 'breakfast':
        return Icons.wb_sunny_outlined;
      case 'lunch':
        return Icons.wb_cloudy_outlined;
      case 'dinner':
        return Icons.nightlight_outlined;
      case 'snack':
        return Icons.cookie_outlined;
      default:
        return Icons.restaurant_outlined;
    }
  }

  String _getMealTypeLabel() {
    switch (widget.mealType) {
      case 'breakfast':
        return 'Breakfast';
      case 'lunch':
        return 'Lunch';
      case 'dinner':
        return 'Dinner';
      case 'snack':
        return 'Snack';
      default:
        return widget.mealType;
    }
  }
}

/// Portion selection chip
class _PortionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PortionChip({
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
          color: isSelected ? DrenColors.primary : DrenColors.surfaceTertiary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: DrenTypography.caption1.copyWith(
            color: isSelected ? DrenColors.background : DrenColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// Nutrition stat display
class _NutritionStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _NutritionStat({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: DrenTypography.title3.copyWith(
            color: color,
          ),
        ),
        Text(
          unit,
          style: DrenTypography.caption2.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: DrenTypography.caption2.copyWith(
            color: DrenColors.textTertiary,
          ),
        ),
      ],
    );
  }
}

/// Macro row display
class _MacroRow extends StatelessWidget {
  final String label;
  final double value;
  final String unit;
  final bool isSubItem;

  const _MacroRow({
    required this.label,
    required this.value,
    required this.unit,
    this.isSubItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: (isSubItem ? DrenTypography.caption1 : DrenTypography.body).copyWith(
              color: isSubItem ? DrenColors.textTertiary : DrenColors.textSecondary,
            ),
          ),
          Text(
            '${value.toStringAsFixed(1)}$unit',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
