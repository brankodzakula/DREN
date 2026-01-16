// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepScheduleImpl _$$SleepScheduleImplFromJson(Map<String, dynamic> json) =>
    _$SleepScheduleImpl(
      targetBedtime: const TimeOfDayConverter()
          .fromJson(json['targetBedtime'] as Map<String, dynamic>),
      targetWakeTime: const TimeOfDayConverter()
          .fromJson(json['targetWakeTime'] as Map<String, dynamic>),
      targetSleepMinutes: (json['targetSleepMinutes'] as num).toInt(),
      windDownStart: const TimeOfDayConverter()
          .fromJson(json['windDownStart'] as Map<String, dynamic>),
      lastCaffeineCutoff: const TimeOfDayConverter()
          .fromJson(json['lastCaffeineCutoff'] as Map<String, dynamic>),
      lastMealCutoff: const TimeOfDayConverter()
          .fromJson(json['lastMealCutoff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SleepScheduleImplToJson(_$SleepScheduleImpl instance) =>
    <String, dynamic>{
      'targetBedtime':
          const TimeOfDayConverter().toJson(instance.targetBedtime),
      'targetWakeTime':
          const TimeOfDayConverter().toJson(instance.targetWakeTime),
      'targetSleepMinutes': instance.targetSleepMinutes,
      'windDownStart':
          const TimeOfDayConverter().toJson(instance.windDownStart),
      'lastCaffeineCutoff':
          const TimeOfDayConverter().toJson(instance.lastCaffeineCutoff),
      'lastMealCutoff':
          const TimeOfDayConverter().toJson(instance.lastMealCutoff),
    };
