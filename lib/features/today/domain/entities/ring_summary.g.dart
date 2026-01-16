// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ring_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RingSummaryImpl _$$RingSummaryImplFromJson(Map<String, dynamic> json) =>
    _$RingSummaryImpl(
      caloriesIn: RingData.fromJson(json['caloriesIn'] as Map<String, dynamic>),
      caloriesOut:
          RingData.fromJson(json['caloriesOut'] as Map<String, dynamic>),
      exercise: RingData.fromJson(json['exercise'] as Map<String, dynamic>),
      sleep: RingData.fromJson(json['sleep'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RingSummaryImplToJson(_$RingSummaryImpl instance) =>
    <String, dynamic>{
      'caloriesIn': instance.caloriesIn,
      'caloriesOut': instance.caloriesOut,
      'exercise': instance.exercise,
      'sleep': instance.sleep,
    };

_$RingDataImpl _$$RingDataImplFromJson(Map<String, dynamic> json) =>
    _$RingDataImpl(
      current: (json['current'] as num).toInt(),
      target: (json['target'] as num).toInt(),
      label: json['label'] as String,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$RingDataImplToJson(_$RingDataImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'target': instance.target,
      'label': instance.label,
      'unit': instance.unit,
    };
