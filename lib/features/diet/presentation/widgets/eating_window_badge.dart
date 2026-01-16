import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Badge showing eating window status (open/closed)
class EatingWindowBadge extends StatelessWidget {
  final String startTime;
  final String endTime;

  const EatingWindowBadge({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = _isWithinWindow();
    final formattedStart = _formatTime(startTime);
    final formattedEnd = _formatTime(endTime);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DrenSpacing.md,
        vertical: DrenSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isOpen
            ? DrenColors.success.withValues(alpha: 0.15)
            : DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        border: Border.all(
          color: isOpen ? DrenColors.success : DrenColors.surfaceTertiary,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Status indicator
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOpen ? DrenColors.success : DrenColors.textTertiary,
            ),
          ),
          const SizedBox(width: DrenSpacing.sm),

          // Time window
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eating Window',
                style: DrenTypography.caption1.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
              Text(
                '$formattedStart - $formattedEnd',
                style: DrenTypography.headline.copyWith(
                  color: DrenColors.textPrimary,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DrenSpacing.sm,
              vertical: DrenSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: isOpen ? DrenColors.success : DrenColors.textTertiary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
            ),
            child: Text(
              isOpen ? 'OPEN' : 'CLOSED',
              style: DrenTypography.caption2.copyWith(
                color: isOpen ? DrenColors.background : DrenColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isWithinWindow() {
    final now = DateTime.now();
    final currentMinutes = now.hour * 60 + now.minute;

    final startParts = startTime.split(':');
    final endParts = endTime.split(':');

    final startMinutes = int.parse(startParts[0]) * 60 + int.parse(startParts[1]);
    final endMinutes = int.parse(endParts[0]) * 60 + int.parse(endParts[1]);

    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }

  String _formatTime(String time24) {
    final parts = time24.split(':');
    final hour = int.parse(parts[0]);
    final minute = parts[1];

    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$displayHour:$minute $period';
  }
}
