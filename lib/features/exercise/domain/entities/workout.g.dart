// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      difficulty: json['difficulty'] as String,
      equipmentRequired: (json['equipmentRequired'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      estimatedCalories: (json['estimatedCalories'] as num).toInt(),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoUrl: json['videoUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'durationMinutes': instance.durationMinutes,
      'difficulty': instance.difficulty,
      'equipmentRequired': instance.equipmentRequired,
      'estimatedCalories': instance.estimatedCalories,
      'exercises': instance.exercises,
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
    };
