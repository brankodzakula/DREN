import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Birth date selection step
class BirthDateStep extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final String? error;

  const BirthDateStep({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate valid date range (18-120 years old)
    final now = DateTime.now();
    final minimumDate = DateTime(now.year - 120, now.month, now.day);
    final maximumDate = DateTime(now.year - 18, now.month, now.day);
    final initialDate = selectedDate ?? DateTime(now.year - 30, 1, 1);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'When were you born?',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'Your age helps us calculate your metabolic rate and recovery needs',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Date picker with fixed height
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.dark,
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    color: DrenColors.textPrimary,
                    fontSize: 22,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate.isBefore(minimumDate)
                    ? minimumDate
                    : (initialDate.isAfter(maximumDate)
                        ? maximumDate
                        : initialDate),
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                onDateTimeChanged: onDateChanged,
              ),
            ),
          ),

          // Error message
          if (error != null) ...[
            const SizedBox(height: DrenSpacing.md),
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
                      error!,
                      style: DrenTypography.caption1.copyWith(
                        color: DrenColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Age display
          if (selectedDate != null) ...[
            const SizedBox(height: DrenSpacing.lg),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DrenSpacing.lg,
                  vertical: DrenSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: DrenColors.surfaceSecondary,
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
                ),
                child: Text(
                  '${_calculateAge(selectedDate!)} years old',
                  style: DrenTypography.headline.copyWith(
                    color: DrenColors.primary,
                  ),
                ),
              ),
            ),
          ],

          const SizedBox(height: DrenSpacing.xl),
        ],
      ),
    );
  }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
