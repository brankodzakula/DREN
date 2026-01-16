// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingDataImpl _$$OnboardingDataImplFromJson(Map<String, dynamic> json) =>
    _$OnboardingDataImpl(
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      sex: json['sex'] as String?,
      heightCm: (json['heightCm'] as num?)?.toDouble(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      targetWeightKg: (json['targetWeightKg'] as num?)?.toDouble(),
      activityLevel: json['activityLevel'] as String?,
      goals:
          (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      wakeTime: const TimeOfDayConverter()
          .fromJson(json['wakeTime'] as Map<String, dynamic>?),
      longevityAmbition: json['longevityAmbition'] as String?,
      healthPermissionsGranted:
          json['healthPermissionsGranted'] as bool? ?? false,
      disclaimerAccepted: json['disclaimerAccepted'] as bool? ?? false,
      fitnessLevel: json['fitnessLevel'] as String? ?? 'intermediate',
      dietaryRestrictions: (json['dietaryRestrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      medicalConditions: (json['medicalConditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      equipment: (json['equipment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredWorkoutMinutes:
          (json['preferredWorkoutMinutes'] as num?)?.toInt() ?? 45,
    );

Map<String, dynamic> _$$OnboardingDataImplToJson(
        _$OnboardingDataImpl instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'sex': instance.sex,
      'heightCm': instance.heightCm,
      'weightKg': instance.weightKg,
      'targetWeightKg': instance.targetWeightKg,
      'activityLevel': instance.activityLevel,
      'goals': instance.goals,
      'wakeTime': const TimeOfDayConverter().toJson(instance.wakeTime),
      'longevityAmbition': instance.longevityAmbition,
      'healthPermissionsGranted': instance.healthPermissionsGranted,
      'disclaimerAccepted': instance.disclaimerAccepted,
      'fitnessLevel': instance.fitnessLevel,
      'dietaryRestrictions': instance.dietaryRestrictions,
      'medicalConditions': instance.medicalConditions,
      'equipment': instance.equipment,
      'preferredWorkoutMinutes': instance.preferredWorkoutMinutes,
    };
