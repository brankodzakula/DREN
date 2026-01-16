// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      muscleGroup: json['muscleGroup'] as String,
      sets: (json['sets'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      restSeconds: (json['restSeconds'] as num).toInt(),
      videoUrl: json['videoUrl'] as String?,
      instructions: json['instructions'] as String?,
      alternatives: (json['alternatives'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contraindications: (json['contraindications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'muscleGroup': instance.muscleGroup,
      'sets': instance.sets,
      'reps': instance.reps,
      'durationSeconds': instance.durationSeconds,
      'restSeconds': instance.restSeconds,
      'videoUrl': instance.videoUrl,
      'instructions': instance.instructions,
      'alternatives': instance.alternatives,
      'contraindications': instance.contraindications,
    };
