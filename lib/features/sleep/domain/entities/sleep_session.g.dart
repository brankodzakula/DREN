// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepSessionImpl _$$SleepSessionImplFromJson(Map<String, dynamic> json) =>
    _$SleepSessionImpl(
      id: json['id'] as String,
      oderId: json['oderId'] as String,
      bedTime: DateTime.parse(json['bedTime'] as String),
      wakeTime: DateTime.parse(json['wakeTime'] as String),
      totalMinutes: (json['totalMinutes'] as num).toInt(),
      deepSleepMinutes: (json['deepSleepMinutes'] as num).toInt(),
      lightSleepMinutes: (json['lightSleepMinutes'] as num).toInt(),
      remSleepMinutes: (json['remSleepMinutes'] as num).toInt(),
      awakeMinutes: (json['awakeMinutes'] as num).toInt(),
      efficiency: (json['efficiency'] as num).toDouble(),
      latencyMinutes: (json['latencyMinutes'] as num).toInt(),
      sleepScore: (json['sleepScore'] as num).toInt(),
      source: json['source'] as String,
      externalId: json['externalId'] as String?,
    );

Map<String, dynamic> _$$SleepSessionImplToJson(_$SleepSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oderId': instance.oderId,
      'bedTime': instance.bedTime.toIso8601String(),
      'wakeTime': instance.wakeTime.toIso8601String(),
      'totalMinutes': instance.totalMinutes,
      'deepSleepMinutes': instance.deepSleepMinutes,
      'lightSleepMinutes': instance.lightSleepMinutes,
      'remSleepMinutes': instance.remSleepMinutes,
      'awakeMinutes': instance.awakeMinutes,
      'efficiency': instance.efficiency,
      'latencyMinutes': instance.latencyMinutes,
      'sleepScore': instance.sleepScore,
      'source': instance.source,
      'externalId': instance.externalId,
    };
