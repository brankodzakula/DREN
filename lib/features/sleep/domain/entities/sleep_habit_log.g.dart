// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_habit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepHabitLogImpl _$$SleepHabitLogImplFromJson(Map<String, dynamic> json) =>
    _$SleepHabitLogImpl(
      id: json['id'] as String,
      oderId: json['oderId'] as String,
      date: DateTime.parse(json['date'] as String),
      noCaffeineAfterCutoff: json['noCaffeineAfterCutoff'] as bool,
      lastMealOnTime: json['lastMealOnTime'] as bool,
      screenFreeBeforeBed: json['screenFreeBeforeBed'] as bool,
      roomTempOptimal: json['roomTempOptimal'] as bool,
      meditationCompleted: json['meditationCompleted'] as bool,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$SleepHabitLogImplToJson(_$SleepHabitLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oderId': instance.oderId,
      'date': instance.date.toIso8601String(),
      'noCaffeineAfterCutoff': instance.noCaffeineAfterCutoff,
      'lastMealOnTime': instance.lastMealOnTime,
      'screenFreeBeforeBed': instance.screenFreeBeforeBed,
      'roomTempOptimal': instance.roomTempOptimal,
      'meditationCompleted': instance.meditationCompleted,
      'notes': instance.notes,
    };
