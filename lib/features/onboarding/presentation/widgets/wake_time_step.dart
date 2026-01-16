import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Wake time selection step with time picker
class WakeTimeStep extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const WakeTimeStep({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  TimeOfDay _calculateBedtime(TimeOfDay wakeTime) {
    // 8 hours of sleep recommended
    var hour = wakeTime.hour - 8;
    if (hour < 0) hour += 24;
    return TimeOfDay(hour: hour, minute: wakeTime.minute);
  }

  TimeOfDay _calculateWindDown(TimeOfDay wakeTime) {
    // 9 hours before wake (1 hour wind-down before 8 hours sleep)
    var hour = wakeTime.hour - 9;
    if (hour < 0) hour += 24;
    return TimeOfDay(hour: hour, minute: wakeTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    final currentTime = selectedTime ?? const TimeOfDay(hour: 6, minute: 0);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'When do you wake up?',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'We\'ll build your sleep schedule around this time to optimize your circadian rhythm.',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Current selection display
          Container(
            padding: const EdgeInsets.all(DrenSpacing.lg),
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wb_sunny_outlined,
                  color: DrenColors.warning,
                  size: 32,
                ),
                const SizedBox(width: DrenSpacing.md),
                Text(
                  _formatTime(currentTime),
                  style: DrenTypography.largeTitle.copyWith(
                    color: DrenColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: DrenSpacing.lg),

          // Cupertino time picker with fixed height
          SizedBox(
            height: 200,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.dark,
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    fontSize: 22,
                    color: DrenColors.textPrimary,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime(
                  2024,
                  1,
                  1,
                  currentTime.hour,
                  currentTime.minute,
                ),
                use24hFormat: false,
                minuteInterval: 5,
                onDateTimeChanged: (DateTime dateTime) {
                  onTimeChanged(TimeOfDay(
                    hour: dateTime.hour,
                    minute: dateTime.minute,
                  ));
                },
              ),
            ),
          ),

          const SizedBox(height: DrenSpacing.lg),

          // Schedule preview
          Container(
            padding: const EdgeInsets.all(DrenSpacing.md),
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: Column(
              children: [
                Text(
                  'Your Sleep Schedule',
                  style: DrenTypography.headline.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
                const SizedBox(height: DrenSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _ScheduleItem(
                      icon: Icons.nightlight_outlined,
                      label: 'Wind Down',
                      time: _formatTime(_calculateWindDown(currentTime)),
                      color: DrenColors.sleepRing,
                    ),
                    _ScheduleItem(
                      icon: Icons.bedtime_outlined,
                      label: 'Bedtime',
                      time: _formatTime(_calculateBedtime(currentTime)),
                      color: DrenColors.sleepRing,
                    ),
                    _ScheduleItem(
                      icon: Icons.wb_sunny_outlined,
                      label: 'Wake',
                      time: _formatTime(currentTime),
                      color: DrenColors.warning,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),
        ],
      ),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final Color color;

  const _ScheduleItem({
    required this.icon,
    required this.label,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: DrenSpacing.xs),
        Text(
          label,
          style: DrenTypography.caption1.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        const SizedBox(height: DrenSpacing.xxs),
        Text(
          time,
          style: DrenTypography.subheadline.copyWith(
            color: DrenColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
