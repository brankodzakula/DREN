import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/sleep_session.dart';

/// Widget displaying last night's sleep score and breakdown
class SleepScoreWidget extends StatelessWidget {
  final SleepSession? session;

  const SleepScoreWidget({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    if (session == null) {
      return _buildNoDataState();
    }

    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        children: [
          // Sleep score header
          Text(
            'Last Night\'s Sleep Score: ${session!.sleepScore}/100',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.lg),

          // Duration display
          Text(
            _formatDuration(session!.totalMinutes),
            style: DrenTypography.largeTitle.copyWith(
              color: DrenColors.sleepRing,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          // Sleep bar visualization
          _SleepBar(session: session!),
          const SizedBox(height: DrenSpacing.xs),

          // Time range
          Text(
            '${_formatTime(session!.bedTime)} → ${_formatTime(session!.wakeTime)}',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          const SizedBox(height: DrenSpacing.lg),

          // Sleep stages breakdown
          Text(
            'Sleep Stages',
            style: DrenTypography.subheadline.copyWith(
              color: DrenColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: DrenSpacing.md),
          _SleepStageBar(
            label: 'Deep',
            minutes: session!.deepSleepMinutes,
            totalMinutes: session!.totalMinutes,
            color: _SleepStageColors.deep,
          ),
          const SizedBox(height: DrenSpacing.sm),
          _SleepStageBar(
            label: 'Light',
            minutes: session!.lightSleepMinutes,
            totalMinutes: session!.totalMinutes,
            color: _SleepStageColors.light,
          ),
          const SizedBox(height: DrenSpacing.sm),
          _SleepStageBar(
            label: 'REM',
            minutes: session!.remSleepMinutes,
            totalMinutes: session!.totalMinutes,
            color: _SleepStageColors.rem,
          ),
          const SizedBox(height: DrenSpacing.sm),
          _SleepStageBar(
            label: 'Awake',
            minutes: session!.awakeMinutes,
            totalMinutes: session!.totalMinutes,
            color: _SleepStageColors.awake,
          ),
          const SizedBox(height: DrenSpacing.lg),

          // Efficiency and latency
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Efficiency: ${(session!.efficiency * 100).toInt()}%',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
              const SizedBox(width: DrenSpacing.md),
              Text(
                '|',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textTertiary,
                ),
              ),
              const SizedBox(width: DrenSpacing.md),
              Text(
                'Latency: ${session!.latencyMinutes} min',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataState() {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.bedtime_outlined,
            size: 48,
            color: DrenColors.textTertiary,
          ),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'No sleep data',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            'Sleep data will appear here after your first night',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '${hours}h ${mins}m';
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}

class _SleepStageColors {
  static const deep = Color(0xFF007AFF);
  static const light = Color(0xFF8E8E93);
  static const rem = Color(0xFFAF52DE);
  static const awake = Color(0xFFFF3B30);
}

class _SleepBar extends StatelessWidget {
  final SleepSession session;

  const _SleepBar({required this.session});

  @override
  Widget build(BuildContext context) {
    final total = session.totalMinutes.toDouble();

    return Container(
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
        child: Row(
          children: [
            // Deep sleep
            Expanded(
              flex: session.deepSleepMinutes,
              child: Container(color: _SleepStageColors.deep),
            ),
            // Light sleep
            Expanded(
              flex: session.lightSleepMinutes,
              child: Container(color: _SleepStageColors.light),
            ),
            // REM sleep
            Expanded(
              flex: session.remSleepMinutes,
              child: Container(color: _SleepStageColors.rem),
            ),
            // Awake
            if (session.awakeMinutes > 0)
              Expanded(
                flex: session.awakeMinutes,
                child: Container(color: _SleepStageColors.awake),
              ),
          ],
        ),
      ),
    );
  }
}

class _SleepStageBar extends StatelessWidget {
  final String label;
  final int minutes;
  final int totalMinutes;
  final Color color;

  const _SleepStageBar({
    required this.label,
    required this.minutes,
    required this.totalMinutes,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = totalMinutes > 0 ? (minutes / totalMinutes * 100).toInt() : 0;
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    final durationStr = hours > 0 ? '${hours}h ${mins}m' : '${mins}m';

    return Row(
      children: [
        // Progress bar
        Expanded(
          flex: 3,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: DrenColors.surfaceSecondary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: minutes / totalMinutes,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: DrenSpacing.md),
        // Label
        Expanded(
          flex: 4,
          child: Text(
            '$label: $durationStr ($percentage%)',
            style: DrenTypography.caption1.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
