import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Target weight selection step
class TargetWeightStep extends StatefulWidget {
  final double? currentWeightKg;
  final double? targetWeightKg;
  final ValueChanged<double?> onTargetWeightChanged;

  const TargetWeightStep({
    super.key,
    required this.currentWeightKg,
    required this.targetWeightKg,
    required this.onTargetWeightChanged,
  });

  @override
  State<TargetWeightStep> createState() => _TargetWeightStepState();
}

class _TargetWeightStepState extends State<TargetWeightStep> {
  late TextEditingController _controller;
  bool _maintainWeight = false;

  @override
  void initState() {
    super.initState();
    _maintainWeight = widget.targetWeightKg == null;
    _controller = TextEditingController(
      text: widget.targetWeightKg?.toStringAsFixed(1) ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onMaintainWeightChanged(bool? value) {
    setState(() {
      _maintainWeight = value ?? false;
      if (_maintainWeight) {
        _controller.clear();
        widget.onTargetWeightChanged(null);
      }
    });
  }

  void _onTargetWeightChanged(String value) {
    if (_maintainWeight) return;
    final weight = double.tryParse(value);
    widget.onTargetWeightChanged(weight);
  }

  @override
  Widget build(BuildContext context) {
    final currentWeight = widget.currentWeightKg;
    final targetWeight = widget.targetWeightKg;

    // Calculate difference
    double? weightDiff;
    String diffLabel = '';
    Color diffColor = DrenColors.textSecondary;

    if (currentWeight != null && targetWeight != null) {
      weightDiff = targetWeight - currentWeight;
      if (weightDiff > 0) {
        diffLabel = '+${weightDiff.toStringAsFixed(1)} kg (Gain)';
        diffColor = DrenColors.exerciseRing;
      } else if (weightDiff < 0) {
        diffLabel = '${weightDiff.toStringAsFixed(1)} kg (Loss)';
        diffColor = DrenColors.caloriesInRing;
      } else {
        diffLabel = 'Same as current';
        diffColor = DrenColors.textSecondary;
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: DrenSpacing.xl),

            // Title
            Text(
              'What\'s your target weight?',
              style: DrenTypography.title1.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),

            const SizedBox(height: DrenSpacing.sm),

            // Description
            Text(
              'This helps us tailor your caloric targets. You can change this anytime.',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),

            const SizedBox(height: DrenSpacing.xxxl),

            // Current weight display
            if (currentWeight != null)
              Container(
                padding: const EdgeInsets.all(DrenSpacing.md),
                decoration: BoxDecoration(
                  color: DrenColors.surfacePrimary,
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monitor_weight_outlined,
                      color: DrenColors.textSecondary,
                    ),
                    const SizedBox(width: DrenSpacing.sm),
                    Text(
                      'Current weight:',
                      style: DrenTypography.body.copyWith(
                        color: DrenColors.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${currentWeight.toStringAsFixed(1)} kg',
                      style: DrenTypography.headline.copyWith(
                        color: DrenColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: DrenSpacing.lg),

            // Maintain weight checkbox
            GestureDetector(
              onTap: () => _onMaintainWeightChanged(!_maintainWeight),
              child: Container(
                padding: const EdgeInsets.all(DrenSpacing.md),
                decoration: BoxDecoration(
                  color: _maintainWeight
                      ? DrenColors.primary.withValues(alpha: 0.1)
                      : DrenColors.surfacePrimary,
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                  border: Border.all(
                    color: _maintainWeight ? DrenColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: _maintainWeight,
                      onChanged: _onMaintainWeightChanged,
                      activeColor: DrenColors.primary,
                      checkColor: DrenColors.background,
                      side: const BorderSide(
                        color: DrenColors.textSecondary,
                        width: 2,
                      ),
                    ),
                    const SizedBox(width: DrenSpacing.xs),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maintain current weight',
                            style: DrenTypography.headline.copyWith(
                              color: _maintainWeight
                                  ? DrenColors.primary
                                  : DrenColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Focus on body composition, not scale weight',
                            style: DrenTypography.caption1.copyWith(
                              color: DrenColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: DrenSpacing.lg),

            // Target weight input
            AnimatedOpacity(
              opacity: _maintainWeight ? 0.5 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: AbsorbPointer(
                absorbing: _maintainWeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Target weight',
                      style: DrenTypography.headline.copyWith(
                        color: DrenColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: DrenSpacing.sm),
                    Container(
                      decoration: BoxDecoration(
                        color: DrenColors.surfacePrimary,
                        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                      ),
                      child: TextField(
                        controller: _controller,
                        enabled: !_maintainWeight,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
                        ],
                        style: DrenTypography.title2.copyWith(
                          color: DrenColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: currentWeight?.toStringAsFixed(0) ?? '70',
                          hintStyle: DrenTypography.title2.copyWith(
                            color: DrenColors.textTertiary,
                          ),
                          suffixText: 'kg',
                          suffixStyle: DrenTypography.body.copyWith(
                            color: DrenColors.textSecondary,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(DrenSpacing.md),
                        ),
                        onChanged: _onTargetWeightChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: DrenSpacing.lg),

            // Weight difference display
            if (!_maintainWeight && targetWeight != null && weightDiff != null)
              Container(
                padding: const EdgeInsets.all(DrenSpacing.md),
                decoration: BoxDecoration(
                  color: diffColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      weightDiff > 0
                          ? Icons.trending_up
                          : weightDiff < 0
                              ? Icons.trending_down
                              : Icons.trending_flat,
                      color: diffColor,
                    ),
                    const SizedBox(width: DrenSpacing.sm),
                    Text(
                      diffLabel,
                      style: DrenTypography.headline.copyWith(
                        color: diffColor,
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: DrenSpacing.xl),

            // Info note
            Container(
              padding: const EdgeInsets.all(DrenSpacing.md),
              decoration: BoxDecoration(
                color: DrenColors.surfacePrimary,
                borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: DrenColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: DrenSpacing.sm),
                  Expanded(
                    child: Text(
                      'A safe rate of change is 0.5-1 kg per week. We\'ll adjust your protocol accordingly.',
                      style: DrenTypography.caption1.copyWith(
                        color: DrenColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: DrenSpacing.xl),
          ],
        ),
      ),
    );
  }
}
