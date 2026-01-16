import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Height and weight measurement step
class MeasurementsStep extends StatefulWidget {
  final double? heightCm;
  final double? weightKg;
  final ValueChanged<double> onHeightChanged;
  final ValueChanged<double> onWeightChanged;
  final String? error;

  const MeasurementsStep({
    super.key,
    required this.heightCm,
    required this.weightKg,
    required this.onHeightChanged,
    required this.onWeightChanged,
    this.error,
  });

  @override
  State<MeasurementsStep> createState() => _MeasurementsStepState();
}

class _MeasurementsStepState extends State<MeasurementsStep> {
  bool _useMetric = true;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _feetController;
  late TextEditingController _inchesController;

  @override
  void initState() {
    super.initState();
    _heightController = TextEditingController(
      text: widget.heightCm?.toStringAsFixed(0) ?? '',
    );
    _weightController = TextEditingController(
      text: widget.weightKg?.toStringAsFixed(1) ?? '',
    );

    // Initialize imperial controllers
    if (widget.heightCm != null) {
      final totalInches = widget.heightCm! / 2.54;
      final feet = (totalInches / 12).floor();
      final inches = (totalInches % 12).round();
      _feetController = TextEditingController(text: feet.toString());
      _inchesController = TextEditingController(text: inches.toString());
    } else {
      _feetController = TextEditingController();
      _inchesController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _feetController.dispose();
    _inchesController.dispose();
    super.dispose();
  }

  void _onHeightMetricChanged(String value) {
    final height = double.tryParse(value);
    if (height != null && height > 0) {
      widget.onHeightChanged(height);
    }
  }

  void _onHeightImperialChanged() {
    final feet = int.tryParse(_feetController.text) ?? 0;
    final inches = int.tryParse(_inchesController.text) ?? 0;
    final totalInches = (feet * 12) + inches;
    final cm = totalInches * 2.54;
    if (cm > 0) {
      widget.onHeightChanged(cm);
    }
  }

  void _onWeightChanged(String value) {
    final weight = double.tryParse(value);
    if (weight != null && weight > 0) {
      if (_useMetric) {
        widget.onWeightChanged(weight);
      } else {
        // Convert lbs to kg
        widget.onWeightChanged(weight * 0.453592);
      }
    }
  }

  void _toggleUnit() {
    setState(() {
      _useMetric = !_useMetric;
      // Convert values when switching
      if (widget.heightCm != null) {
        if (_useMetric) {
          _heightController.text = widget.heightCm!.toStringAsFixed(0);
        } else {
          final totalInches = widget.heightCm! / 2.54;
          final feet = (totalInches / 12).floor();
          final inches = (totalInches % 12).round();
          _feetController.text = feet.toString();
          _inchesController.text = inches.toString();
        }
      }
      if (widget.weightKg != null) {
        if (_useMetric) {
          _weightController.text = widget.weightKg!.toStringAsFixed(1);
        } else {
          _weightController.text = (widget.weightKg! * 2.20462).toStringAsFixed(1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              'Your measurements',
              style: DrenTypography.title1.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),

            const SizedBox(height: DrenSpacing.sm),

            // Description
            Text(
              'We use this to calculate your daily caloric needs and track your progress',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),

            const SizedBox(height: DrenSpacing.lg),

            // Unit toggle
            Center(
              child: _UnitToggle(
                useMetric: _useMetric,
                onToggle: _toggleUnit,
              ),
            ),

            const SizedBox(height: DrenSpacing.xxxl),

            // Height input
            Text(
              'Height',
              style: DrenTypography.headline.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
            const SizedBox(height: DrenSpacing.sm),
            if (_useMetric)
              _MetricHeightInput(
                controller: _heightController,
                onChanged: _onHeightMetricChanged,
              )
            else
              _ImperialHeightInput(
                feetController: _feetController,
                inchesController: _inchesController,
                onChanged: _onHeightImperialChanged,
              ),

            const SizedBox(height: DrenSpacing.xl),

            // Weight input
            Text(
              'Weight',
              style: DrenTypography.headline.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
            const SizedBox(height: DrenSpacing.sm),
            _WeightInput(
              controller: _weightController,
              unit: _useMetric ? 'kg' : 'lbs',
              onChanged: _onWeightChanged,
            ),

            // Error message
            if (widget.error != null) ...[
              const SizedBox(height: DrenSpacing.lg),
              Container(
                padding: const EdgeInsets.all(DrenSpacing.sm),
                decoration: BoxDecoration(
                  color: DrenColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: DrenColors.error,
                      size: 20,
                    ),
                    const SizedBox(width: DrenSpacing.xs),
                    Expanded(
                      child: Text(
                        widget.error!,
                        style: DrenTypography.caption1.copyWith(
                          color: DrenColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: DrenSpacing.xl),

            // BMI display
            if (widget.heightCm != null && widget.weightKg != null)
              _BMIDisplay(
                heightCm: widget.heightCm!,
                weightKg: widget.weightKg!,
              ),

            const SizedBox(height: DrenSpacing.xl),
          ],
        ),
      ),
    );
  }
}

class _UnitToggle extends StatelessWidget {
  final bool useMetric;
  final VoidCallback onToggle;

  const _UnitToggle({
    required this.useMetric,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _UnitToggleButton(
            label: 'Metric',
            isSelected: useMetric,
            onTap: useMetric ? null : onToggle,
          ),
          _UnitToggleButton(
            label: 'Imperial',
            isSelected: !useMetric,
            onTap: useMetric ? onToggle : null,
          ),
        ],
      ),
    );
  }
}

class _UnitToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const _UnitToggleButton({
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.lg,
          vertical: DrenSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? DrenColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: DrenTypography.subheadline.copyWith(
            color: isSelected ? DrenColors.background : DrenColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _MetricHeightInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _MetricHeightInput({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ],
        style: DrenTypography.title2.copyWith(
          color: DrenColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: '175',
          hintStyle: DrenTypography.title2.copyWith(
            color: DrenColors.textTertiary,
          ),
          suffixText: 'cm',
          suffixStyle: DrenTypography.body.copyWith(
            color: DrenColors.textSecondary,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(DrenSpacing.md),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class _ImperialHeightInput extends StatelessWidget {
  final TextEditingController feetController;
  final TextEditingController inchesController;
  final VoidCallback onChanged;

  const _ImperialHeightInput({
    required this.feetController,
    required this.inchesController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: TextField(
              controller: feetController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              style: DrenTypography.title2.copyWith(
                color: DrenColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: '5',
                hintStyle: DrenTypography.title2.copyWith(
                  color: DrenColors.textTertiary,
                ),
                suffixText: 'ft',
                suffixStyle: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(DrenSpacing.md),
              ),
              onChanged: (_) => onChanged(),
            ),
          ),
        ),
        const SizedBox(width: DrenSpacing.md),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: TextField(
              controller: inchesController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              style: DrenTypography.title2.copyWith(
                color: DrenColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: '10',
                hintStyle: DrenTypography.title2.copyWith(
                  color: DrenColors.textTertiary,
                ),
                suffixText: 'in',
                suffixStyle: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(DrenSpacing.md),
              ),
              onChanged: (_) => onChanged(),
            ),
          ),
        ),
      ],
    );
  }
}

class _WeightInput extends StatelessWidget {
  final TextEditingController controller;
  final String unit;
  final ValueChanged<String> onChanged;

  const _WeightInput({
    required this.controller,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
        ],
        style: DrenTypography.title2.copyWith(
          color: DrenColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: unit == 'kg' ? '70.0' : '154.0',
          hintStyle: DrenTypography.title2.copyWith(
            color: DrenColors.textTertiary,
          ),
          suffixText: unit,
          suffixStyle: DrenTypography.body.copyWith(
            color: DrenColors.textSecondary,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(DrenSpacing.md),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class _BMIDisplay extends StatelessWidget {
  final double heightCm;
  final double weightKg;

  const _BMIDisplay({
    required this.heightCm,
    required this.weightKg,
  });

  @override
  Widget build(BuildContext context) {
    final heightM = heightCm / 100;
    final bmi = weightKg / (heightM * heightM);
    final category = _getBMICategory(bmi);

    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'BMI: ${bmi.toStringAsFixed(1)}',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(width: DrenSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DrenSpacing.sm,
              vertical: DrenSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: category.color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
            ),
            child: Text(
              category.label,
              style: DrenTypography.caption1.copyWith(
                color: category.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _BMICategory _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return const _BMICategory('Underweight', DrenColors.warning);
    } else if (bmi < 25) {
      return const _BMICategory('Normal', DrenColors.success);
    } else if (bmi < 30) {
      return const _BMICategory('Overweight', DrenColors.warning);
    } else {
      return const _BMICategory('Obese', DrenColors.error);
    }
  }
}

class _BMICategory {
  final String label;
  final Color color;

  const _BMICategory(this.label, this.color);
}
