import 'package:freezed_annotation/freezed_annotation.dart';

part 'ring_summary.freezed.dart';
part 'ring_summary.g.dart';

/// Represents the four protocol rings (Calories In, Calories Out, Exercise, Sleep)
@freezed
class RingSummary with _$RingSummary {
  const factory RingSummary({
    /// Calories In ring (green) - calories consumed vs target
    required RingData caloriesIn,

    /// Calories Out ring (red) - calories burned vs target
    required RingData caloriesOut,

    /// Exercise ring (blue) - minutes exercised vs target
    required RingData exercise,

    /// Sleep ring (purple) - hours slept vs target
    required RingData sleep,
  }) = _RingSummary;

  factory RingSummary.fromJson(Map<String, dynamic> json) =>
      _$RingSummaryFromJson(json);

  /// Create rings from progress and protocol data
  factory RingSummary.fromProgressAndTargets({
    required int caloriesConsumed,
    required int targetCalories,
    required int caloriesBurned,
    required int targetCaloriesBurn,
    required int exerciseMinutes,
    required int targetExerciseMinutes,
    required int sleepMinutes,
    required int targetSleepMinutes,
  }) {
    return RingSummary(
      caloriesIn: RingData(
        current: caloriesConsumed,
        target: targetCalories,
        label: 'Calories In',
        unit: 'kcal',
      ),
      caloriesOut: RingData(
        current: caloriesBurned,
        target: targetCaloriesBurn,
        label: 'Calories Out',
        unit: 'kcal',
      ),
      exercise: RingData(
        current: exerciseMinutes,
        target: targetExerciseMinutes,
        label: 'Exercise',
        unit: 'min',
      ),
      sleep: RingData(
        current: sleepMinutes,
        target: targetSleepMinutes,
        label: 'Sleep',
        unit: 'min',
      ),
    );
  }

  /// Create empty rings with default targets
  factory RingSummary.empty() => const RingSummary(
        caloriesIn: RingData(
          current: 0,
          target: 2000,
          label: 'Calories In',
          unit: 'kcal',
        ),
        caloriesOut: RingData(
          current: 0,
          target: 300,
          label: 'Calories Out',
          unit: 'kcal',
        ),
        exercise: RingData(
          current: 0,
          target: 45,
          label: 'Exercise',
          unit: 'min',
        ),
        sleep: RingData(
          current: 0,
          target: 480,
          label: 'Sleep',
          unit: 'min',
        ),
      );
}

/// Data for a single ring
@freezed
class RingData with _$RingData {
  const RingData._();

  const factory RingData({
    required int current,
    required int target,
    required String label,
    required String unit,
  }) = _RingData;

  factory RingData.fromJson(Map<String, dynamic> json) =>
      _$RingDataFromJson(json);

  /// Progress as a percentage (0.0 to 1.0+)
  double get progress => target > 0 ? current / target : 0.0;

  /// Progress clamped to 0.0 - 1.0
  double get clampedProgress => progress.clamp(0.0, 1.0);

  /// Progress as a percentage string (e.g., "75%")
  String get progressPercent => '${(progress * 100).round()}%';

  /// Remaining value to reach target
  int get remaining => (target - current).clamp(0, target);

  /// Whether target is met
  bool get isComplete => current >= target;

  /// Whether over target
  bool get isOver => current > target;

  /// Formatted current value (e.g., "1,200")
  String get formattedCurrent => _formatNumber(current);

  /// Formatted target value (e.g., "2,000")
  String get formattedTarget => _formatNumber(target);

  /// Formatted display (e.g., "1,200 / 2,000 kcal")
  String get formattedDisplay => '$formattedCurrent / $formattedTarget $unit';

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}

/// Extension for overall ring summary calculations
extension RingSummarySummaryExtension on RingSummary {
  /// Overall completion percentage across all rings
  double get overallProgress {
    return (caloriesIn.clampedProgress +
            caloriesOut.clampedProgress +
            exercise.clampedProgress +
            sleep.clampedProgress) /
        4;
  }

  /// Number of rings completed
  int get completedRings {
    int count = 0;
    if (caloriesIn.isComplete) count++;
    if (caloriesOut.isComplete) count++;
    if (exercise.isComplete) count++;
    if (sleep.isComplete) count++;
    return count;
  }

  /// Whether all rings are complete
  bool get allComplete => completedRings == 4;
}
