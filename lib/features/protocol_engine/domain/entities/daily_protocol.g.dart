// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyProtocolImpl _$$DailyProtocolImplFromJson(Map<String, dynamic> json) =>
    _$DailyProtocolImpl(
      date: DateTime.parse(json['date'] as String),
      targetCalories: (json['targetCalories'] as num).toInt(),
      proteinGrams: (json['proteinGrams'] as num).toInt(),
      carbsGrams: (json['carbsGrams'] as num).toInt(),
      fatGrams: (json['fatGrams'] as num).toInt(),
      exerciseMinutes: (json['exerciseMinutes'] as num).toInt(),
      workoutType: json['workoutType'] as String,
      estimatedCaloriesBurn: (json['estimatedCaloriesBurn'] as num).toInt(),
      targetBedtime: const TimeOfDayConverter()
          .fromJson(json['targetBedtime'] as Map<String, dynamic>),
      targetWakeTime: const TimeOfDayConverter()
          .fromJson(json['targetWakeTime'] as Map<String, dynamic>),
      windDownStart: const TimeOfDayConverter()
          .fromJson(json['windDownStart'] as Map<String, dynamic>),
      eatingWindowStart:
          _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay>(
              json['eatingWindowStart'], const TimeOfDayConverter().fromJson),
      eatingWindowEnd: _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay>(
          json['eatingWindowEnd'], const TimeOfDayConverter().fromJson),
      ambitionLevel: json['ambitionLevel'] as String,
      fitnessLevel: json['fitnessLevel'] as String,
    );

Map<String, dynamic> _$$DailyProtocolImplToJson(_$DailyProtocolImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'targetCalories': instance.targetCalories,
      'proteinGrams': instance.proteinGrams,
      'carbsGrams': instance.carbsGrams,
      'fatGrams': instance.fatGrams,
      'exerciseMinutes': instance.exerciseMinutes,
      'workoutType': instance.workoutType,
      'estimatedCaloriesBurn': instance.estimatedCaloriesBurn,
      'targetBedtime':
          const TimeOfDayConverter().toJson(instance.targetBedtime),
      'targetWakeTime':
          const TimeOfDayConverter().toJson(instance.targetWakeTime),
      'windDownStart':
          const TimeOfDayConverter().toJson(instance.windDownStart),
      'eatingWindowStart':
          _$JsonConverterToJson<Map<String, dynamic>, TimeOfDay>(
              instance.eatingWindowStart, const TimeOfDayConverter().toJson),
      'eatingWindowEnd': _$JsonConverterToJson<Map<String, dynamic>, TimeOfDay>(
          instance.eatingWindowEnd, const TimeOfDayConverter().toJson),
      'ambitionLevel': instance.ambitionLevel,
      'fitnessLevel': instance.fitnessLevel,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
