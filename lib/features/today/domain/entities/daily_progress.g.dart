// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyProgressImpl _$$DailyProgressImplFromJson(Map<String, dynamic> json) =>
    _$DailyProgressImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      caloriesConsumed: (json['caloriesConsumed'] as num).toInt(),
      caloriesBurned: (json['caloriesBurned'] as num).toInt(),
      exerciseMinutes: (json['exerciseMinutes'] as num).toInt(),
      sleepMinutes: (json['sleepMinutes'] as num).toInt(),
      proteinGrams: (json['proteinGrams'] as num).toDouble(),
      carbsGrams: (json['carbsGrams'] as num).toDouble(),
      fatGrams: (json['fatGrams'] as num).toDouble(),
      stepsCount: (json['stepsCount'] as num).toInt(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DailyProgressImplToJson(_$DailyProgressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'caloriesConsumed': instance.caloriesConsumed,
      'caloriesBurned': instance.caloriesBurned,
      'exerciseMinutes': instance.exerciseMinutes,
      'sleepMinutes': instance.sleepMinutes,
      'proteinGrams': instance.proteinGrams,
      'carbsGrams': instance.carbsGrams,
      'fatGrams': instance.fatGrams,
      'stepsCount': instance.stepsCount,
      'weightKg': instance.weightKg,
    };
