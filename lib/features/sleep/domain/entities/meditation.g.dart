// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeditationImpl _$$MeditationImplFromJson(Map<String, dynamic> json) =>
    _$MeditationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      audioUrl: json['audioUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      isDownloaded: json['isDownloaded'] as bool,
    );

Map<String, dynamic> _$$MeditationImplToJson(_$MeditationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'durationMinutes': instance.durationMinutes,
      'audioUrl': instance.audioUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'isDownloaded': instance.isDownloaded,
    };
