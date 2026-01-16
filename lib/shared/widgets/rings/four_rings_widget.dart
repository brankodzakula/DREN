import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/spacing.dart';

/// Data model for ring progress
class RingData {
  final double current;
  final double target;
  final String label;
  final String unit;

  const RingData({
    required this.current,
    required this.target,
    required this.label,
    required this.unit,
  });

  double get progress => target > 0 ? (current / target).clamp(0.0, 1.5) : 0.0;
  String get displayValue => '${current.toInt()}/${target.toInt()}';
}

/// Four concentric rings showing daily protocol progress
/// Ring 1 (Outer): Calories In - Green
/// Ring 2: Calories Out - Red/Pink
/// Ring 3: Exercise - Blue
/// Ring 4 (Inner): Sleep - Purple
class FourRingsWidget extends StatefulWidget {
  final RingData caloriesIn;
  final RingData caloriesOut;
  final RingData exercise;
  final RingData sleep;
  final double size;
  final bool animate;
  final Duration animationDuration;

  const FourRingsWidget({
    super.key,
    required this.caloriesIn,
    required this.caloriesOut,
    required this.exercise,
    required this.sleep,
    this.size = 200,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 1200),
  });

  @override
  State<FourRingsWidget> createState() => _FourRingsWidgetState();
}

class _FourRingsWidgetState extends State<FourRingsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(FourRingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _FourRingsPainter(
            caloriesInProgress: widget.caloriesIn.progress * _animation.value,
            caloriesOutProgress: widget.caloriesOut.progress * _animation.value,
            exerciseProgress: widget.exercise.progress * _animation.value,
            sleepProgress: widget.sleep.progress * _animation.value,
            caloriesInOverTarget: widget.caloriesIn.progress > 1.05,
          ),
        );
      },
    );
  }
}

class _FourRingsPainter extends CustomPainter {
  final double caloriesInProgress;
  final double caloriesOutProgress;
  final double exerciseProgress;
  final double sleepProgress;
  final bool caloriesInOverTarget;

  _FourRingsPainter({
    required this.caloriesInProgress,
    required this.caloriesOutProgress,
    required this.exerciseProgress,
    required this.sleepProgress,
    this.caloriesInOverTarget = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = size.width * 0.10; // 10% of widget size
    final gap = strokeWidth * 0.15; // 15% gap between rings
    const startAngle = -math.pi / 2; // Start at 12 o'clock

    // Ring configurations (outer to inner)
    final rings = [
      _RingConfig(
        progress: caloriesInProgress,
        color: caloriesInOverTarget ? DrenColors.warning : DrenColors.caloriesInRing,
        radius: (size.width / 2) - (strokeWidth / 2),
      ),
      _RingConfig(
        progress: caloriesOutProgress,
        color: DrenColors.caloriesOutRing,
        radius: (size.width / 2) - strokeWidth - gap - (strokeWidth / 2),
      ),
      _RingConfig(
        progress: exerciseProgress,
        color: DrenColors.exerciseRing,
        radius: (size.width / 2) - (strokeWidth + gap) * 2 - (strokeWidth / 2),
      ),
      _RingConfig(
        progress: sleepProgress,
        color: DrenColors.sleepRing,
        radius: (size.width / 2) - (strokeWidth + gap) * 3 - (strokeWidth / 2),
      ),
    ];

    for (final ring in rings) {
      // Draw background ring
      final backgroundPaint = Paint()
        ..color = ring.color.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawCircle(center, ring.radius, backgroundPaint);

      // Draw progress ring
      if (ring.progress > 0) {
        final progressPaint = Paint()
          ..color = ring.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

        final sweepAngle = 2 * math.pi * ring.progress.clamp(0.0, 1.0);

        canvas.drawArc(
          Rect.fromCircle(center: center, radius: ring.radius),
          startAngle,
          sweepAngle,
          false,
          progressPaint,
        );

        // If over 100%, draw the overflow portion with a different effect
        if (ring.progress > 1.0) {
          final overflowPaint = Paint()
            ..color = ring.color
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth * 0.8
            ..strokeCap = StrokeCap.round;

          final overflowSweep = 2 * math.pi * (ring.progress - 1.0).clamp(0.0, 0.5);
          canvas.drawArc(
            Rect.fromCircle(center: center, radius: ring.radius),
            startAngle,
            overflowSweep,
            false,
            overflowPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _FourRingsPainter oldDelegate) {
    return oldDelegate.caloriesInProgress != caloriesInProgress ||
        oldDelegate.caloriesOutProgress != caloriesOutProgress ||
        oldDelegate.exerciseProgress != exerciseProgress ||
        oldDelegate.sleepProgress != sleepProgress ||
        oldDelegate.caloriesInOverTarget != caloriesInOverTarget;
  }
}

class _RingConfig {
  final double progress;
  final Color color;
  final double radius;

  _RingConfig({
    required this.progress,
    required this.color,
    required this.radius,
  });
}

/// Widget showing the four rings with labels on the side
class FourRingsWithLabels extends StatelessWidget {
  final RingData caloriesIn;
  final RingData caloriesOut;
  final RingData exercise;
  final RingData sleep;
  final double ringSize;

  const FourRingsWithLabels({
    super.key,
    required this.caloriesIn,
    required this.caloriesOut,
    required this.exercise,
    required this.sleep,
    this.ringSize = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FourRingsWidget(
          caloriesIn: caloriesIn,
          caloriesOut: caloriesOut,
          exercise: exercise,
          sleep: sleep,
          size: ringSize,
        ),
        const SizedBox(width: DrenSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _RingLabel(
                color: caloriesIn.progress > 1.05
                    ? DrenColors.warning
                    : DrenColors.caloriesInRing,
                label: caloriesIn.label,
                value: caloriesIn.displayValue,
                unit: caloriesIn.unit,
              ),
              const SizedBox(height: DrenSpacing.sm),
              _RingLabel(
                color: DrenColors.caloriesOutRing,
                label: caloriesOut.label,
                value: caloriesOut.displayValue,
                unit: caloriesOut.unit,
              ),
              const SizedBox(height: DrenSpacing.sm),
              _RingLabel(
                color: DrenColors.exerciseRing,
                label: exercise.label,
                value: exercise.displayValue,
                unit: exercise.unit,
              ),
              const SizedBox(height: DrenSpacing.sm),
              _RingLabel(
                color: DrenColors.sleepRing,
                label: sleep.label,
                value: sleep.displayValue,
                unit: sleep.unit,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RingLabel extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  final String unit;

  const _RingLabel({
    required this.color,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: DrenSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: DrenTypography.caption1,
              ),
              Text(
                '$value $unit',
                style: DrenTypography.subheadline.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
