import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_progress.freezed.dart';
part 'daily_progress.g.dart';

/// Represents progress for a single day
@freezed
class DailyProgress with _$DailyProgress {
  const factory DailyProgress({
    required String id,
    required DateTime date,
    required int caloriesConsumed,
    required int caloriesBurned,
    required int exerciseMinutes,
    required int sleepMinutes,
    required double proteinGrams,
    required double carbsGrams,
    required double fatGrams,
    required int stepsCount,
    double? weightKg,
  }) = _DailyProgress;

  factory DailyProgress.fromJson(Map<String, dynamic> json) =>
      _$DailyProgressFromJson(json);

  /// Create an empty progress for a date
  factory DailyProgress.empty(DateTime date) => DailyProgress(
        id: 'progress_${date.toIso8601String().split('T').first}',
        date: date,
        caloriesConsumed: 0,
        caloriesBurned: 0,
        exerciseMinutes: 0,
        sleepMinutes: 0,
        proteinGrams: 0,
        carbsGrams: 0,
        fatGrams: 0,
        stepsCount: 0,
      );
}

/// Extension for progress calculations
extension DailyProgressExtension on DailyProgress {
  /// Net calories (consumed - burned from exercise)
  int get netCalories => caloriesConsumed - caloriesBurned;

  /// Total macros in grams
  double get totalMacros => proteinGrams + carbsGrams + fatGrams;

  /// Calculated calories from macros (for verification)
  int get calculatedCalories =>
      (proteinGrams * 4 + carbsGrams * 4 + fatGrams * 9).round();
}
