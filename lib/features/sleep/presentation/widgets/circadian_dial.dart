import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/sleep_schedule.dart';

/// 24-hour circadian dial visualization showing sleep schedule
class CircadianDial extends StatelessWidget {
  final SleepSchedule schedule;
  final int? minutesToBedtime;
  final bool isWindDownActive;

  const CircadianDial({
    super.key,
    required this.schedule,
    this.minutesToBedtime,
    this.isWindDownActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        children: [
          Text(
            'Tonight\'s Schedule',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.lg),

          // Dial
          SizedBox(
            height: 200,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: _CircadianDialPainter(
                windDownTime: schedule.windDownStart,
                bedtime: schedule.targetBedtime,
                wakeTime: schedule.targetWakeTime,
              ),
            ),
          ),
          const SizedBox(height: DrenSpacing.lg),

          // Schedule items
          _ScheduleRow(
            icon: Icons.nightlight_outlined,
            label: 'Wind-Down',
            time: _formatTimeOfDay(schedule.windDownStart),
            color: DrenColors.warning,
            isActive: isWindDownActive,
          ),
          const SizedBox(height: DrenSpacing.sm),
          _ScheduleRow(
            icon: Icons.bedtime_outlined,
            label: 'Target Bed',
            time: _formatTimeOfDay(schedule.targetBedtime),
            color: DrenColors.sleepRing,
            countdown: minutesToBedtime != null
                ? _formatCountdown(minutesToBedtime!)
                : null,
          ),
          const SizedBox(height: DrenSpacing.sm),
          _ScheduleRow(
            icon: Icons.wb_sunny_outlined,
            label: 'Target Wake',
            time: _formatTimeOfDay(schedule.targetWakeTime),
            color: DrenColors.warning,
          ),
        ],
      ),
    );
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String _formatCountdown(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) {
      return 'in ${hours}h ${mins}m';
    }
    return 'in ${mins}m';
  }
}

class _ScheduleRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final Color color;
  final String? countdown;
  final bool isActive;

  const _ScheduleRow({
    required this.icon,
    required this.label,
    required this.time,
    required this.color,
    this.countdown,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DrenSpacing.md,
        vertical: DrenSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isActive ? color.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
        border: isActive
            ? Border.all(color: color.withValues(alpha: 0.3))
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: DrenSpacing.sm),
          Text(
            '$label:',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          const Spacer(),
          Text(
            time,
            style: DrenTypography.headline.copyWith(
              color: isActive ? color : DrenColors.textPrimary,
            ),
          ),
          if (countdown != null) ...[
            const SizedBox(width: DrenSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DrenSpacing.sm,
                vertical: DrenSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
              ),
              child: Text(
                countdown!,
                style: DrenTypography.caption1.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CircadianDialPainter extends CustomPainter {
  final TimeOfDay windDownTime;
  final TimeOfDay bedtime;
  final TimeOfDay wakeTime;

  _CircadianDialPainter({
    required this.windDownTime,
    required this.bedtime,
    required this.wakeTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;

    // Draw outer ring
    final outerRingPaint = Paint()
      ..color = DrenColors.surfaceSecondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    canvas.drawCircle(center, radius, outerRingPaint);

    // Draw sleep arc (bedtime to wake time)
    final sleepArcPaint = Paint()
      ..color = DrenColors.sleepRing
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    final bedtimeAngle = _timeToAngle(bedtime);
    final wakeAngle = _timeToAngle(wakeTime);

    // Calculate sweep angle (handling crossing midnight)
    double sweepAngle = wakeAngle - bedtimeAngle;
    if (sweepAngle < 0) sweepAngle += 2 * math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      bedtimeAngle - math.pi / 2,
      sweepAngle,
      false,
      sleepArcPaint,
    );

    // Draw wind-down indicator
    final windDownAngle = _timeToAngle(windDownTime);
    final windDownPaint = Paint()
      ..color = DrenColors.warning
      ..style = PaintingStyle.fill;
    final windDownPos = Offset(
      center.dx + radius * math.cos(windDownAngle - math.pi / 2),
      center.dy + radius * math.sin(windDownAngle - math.pi / 2),
    );
    canvas.drawCircle(windDownPos, 8, windDownPaint);

    // Draw current time indicator
    final now = TimeOfDay.now();
    final nowAngle = _timeToAngle(now);
    final nowPaint = Paint()
      ..color = DrenColors.primary
      ..style = PaintingStyle.fill;
    final nowPos = Offset(
      center.dx + radius * math.cos(nowAngle - math.pi / 2),
      center.dy + radius * math.sin(nowAngle - math.pi / 2),
    );
    canvas.drawCircle(nowPos, 10, nowPaint);

    // Draw center dot
    final centerPaint = Paint()
      ..color = DrenColors.textTertiary
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 4, centerPaint);

    // Draw hour markers
    final markerPaint = Paint()
      ..color = DrenColors.textTertiary
      ..style = PaintingStyle.fill;
    for (int i = 0; i < 24; i++) {
      final angle = (i / 24) * 2 * math.pi - math.pi / 2;
      final innerRadius = i % 6 == 0 ? radius - 30 : radius - 25;
      final outerRadius = radius - 20;

      final start = Offset(
        center.dx + innerRadius * math.cos(angle),
        center.dy + innerRadius * math.sin(angle),
      );
      final end = Offset(
        center.dx + outerRadius * math.cos(angle),
        center.dy + outerRadius * math.sin(angle),
      );

      canvas.drawLine(start, end, markerPaint..strokeWidth = i % 6 == 0 ? 2 : 1);
    }
  }

  double _timeToAngle(TimeOfDay time) {
    final totalMinutes = time.hour * 60 + time.minute;
    return (totalMinutes / (24 * 60)) * 2 * math.pi;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
