// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _heightCmMeta =
      const VerificationMeta('heightCm');
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
      'height_cm', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _targetWeightKgMeta =
      const VerificationMeta('targetWeightKg');
  @override
  late final GeneratedColumn<double> targetWeightKg = GeneratedColumn<double>(
      'target_weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _activityLevelMeta =
      const VerificationMeta('activityLevel');
  @override
  late final GeneratedColumn<String> activityLevel = GeneratedColumn<String>(
      'activity_level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longevityAmbitionMeta =
      const VerificationMeta('longevityAmbition');
  @override
  late final GeneratedColumn<String> longevityAmbition =
      GeneratedColumn<String>('longevity_ambition', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fitnessLevelMeta =
      const VerificationMeta('fitnessLevel');
  @override
  late final GeneratedColumn<String> fitnessLevel = GeneratedColumn<String>(
      'fitness_level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dietaryRestrictionsMeta =
      const VerificationMeta('dietaryRestrictions');
  @override
  late final GeneratedColumn<String> dietaryRestrictions =
      GeneratedColumn<String>('dietary_restrictions', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medicalConditionsMeta =
      const VerificationMeta('medicalConditions');
  @override
  late final GeneratedColumn<String> medicalConditions =
      GeneratedColumn<String>('medical_conditions', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _equipmentMeta =
      const VerificationMeta('equipment');
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
      'equipment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _preferredWorkoutMinutesMeta =
      const VerificationMeta('preferredWorkoutMinutes');
  @override
  late final GeneratedColumn<int> preferredWorkoutMinutes =
      GeneratedColumn<int>('preferred_workout_minutes', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wakeTimeMeta =
      const VerificationMeta('wakeTime');
  @override
  late final GeneratedColumn<String> wakeTime = GeneratedColumn<String>(
      'wake_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _healthDisclaimerAcceptedMeta =
      const VerificationMeta('healthDisclaimerAccepted');
  @override
  late final GeneratedColumn<bool> healthDisclaimerAccepted =
      GeneratedColumn<bool>(
          'health_disclaimer_accepted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("health_disclaimer_accepted" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateOfBirth,
        sex,
        heightCm,
        weightKg,
        targetWeightKg,
        activityLevel,
        longevityAmbition,
        fitnessLevel,
        dietaryRestrictions,
        medicalConditions,
        equipment,
        preferredWorkoutMinutes,
        wakeTime,
        healthDisclaimerAccepted,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('height_cm')) {
      context.handle(_heightCmMeta,
          heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta));
    } else if (isInserting) {
      context.missing(_heightCmMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('target_weight_kg')) {
      context.handle(
          _targetWeightKgMeta,
          targetWeightKg.isAcceptableOrUnknown(
              data['target_weight_kg']!, _targetWeightKgMeta));
    }
    if (data.containsKey('activity_level')) {
      context.handle(
          _activityLevelMeta,
          activityLevel.isAcceptableOrUnknown(
              data['activity_level']!, _activityLevelMeta));
    } else if (isInserting) {
      context.missing(_activityLevelMeta);
    }
    if (data.containsKey('longevity_ambition')) {
      context.handle(
          _longevityAmbitionMeta,
          longevityAmbition.isAcceptableOrUnknown(
              data['longevity_ambition']!, _longevityAmbitionMeta));
    } else if (isInserting) {
      context.missing(_longevityAmbitionMeta);
    }
    if (data.containsKey('fitness_level')) {
      context.handle(
          _fitnessLevelMeta,
          fitnessLevel.isAcceptableOrUnknown(
              data['fitness_level']!, _fitnessLevelMeta));
    } else if (isInserting) {
      context.missing(_fitnessLevelMeta);
    }
    if (data.containsKey('dietary_restrictions')) {
      context.handle(
          _dietaryRestrictionsMeta,
          dietaryRestrictions.isAcceptableOrUnknown(
              data['dietary_restrictions']!, _dietaryRestrictionsMeta));
    } else if (isInserting) {
      context.missing(_dietaryRestrictionsMeta);
    }
    if (data.containsKey('medical_conditions')) {
      context.handle(
          _medicalConditionsMeta,
          medicalConditions.isAcceptableOrUnknown(
              data['medical_conditions']!, _medicalConditionsMeta));
    } else if (isInserting) {
      context.missing(_medicalConditionsMeta);
    }
    if (data.containsKey('equipment')) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta));
    } else if (isInserting) {
      context.missing(_equipmentMeta);
    }
    if (data.containsKey('preferred_workout_minutes')) {
      context.handle(
          _preferredWorkoutMinutesMeta,
          preferredWorkoutMinutes.isAcceptableOrUnknown(
              data['preferred_workout_minutes']!,
              _preferredWorkoutMinutesMeta));
    } else if (isInserting) {
      context.missing(_preferredWorkoutMinutesMeta);
    }
    if (data.containsKey('wake_time')) {
      context.handle(_wakeTimeMeta,
          wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta));
    } else if (isInserting) {
      context.missing(_wakeTimeMeta);
    }
    if (data.containsKey('health_disclaimer_accepted')) {
      context.handle(
          _healthDisclaimerAcceptedMeta,
          healthDisclaimerAccepted.isAcceptableOrUnknown(
              data['health_disclaimer_accepted']!,
              _healthDisclaimerAcceptedMeta));
    } else if (isInserting) {
      context.missing(_healthDisclaimerAcceptedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      dateOfBirth: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      heightCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height_cm'])!,
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg'])!,
      targetWeightKg: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}target_weight_kg']),
      activityLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_level'])!,
      longevityAmbition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}longevity_ambition'])!,
      fitnessLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fitness_level'])!,
      dietaryRestrictions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}dietary_restrictions'])!,
      medicalConditions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}medical_conditions'])!,
      equipment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipment'])!,
      preferredWorkoutMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}preferred_workout_minutes'])!,
      wakeTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wake_time'])!,
      healthDisclaimerAccepted: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}health_disclaimer_accepted'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final String id;
  final DateTime dateOfBirth;
  final String sex;
  final double heightCm;
  final double weightKg;
  final double? targetWeightKg;
  final String activityLevel;
  final String longevityAmbition;
  final String fitnessLevel;
  final String dietaryRestrictions;
  final String medicalConditions;
  final String equipment;
  final int preferredWorkoutMinutes;
  final String wakeTime;
  final bool healthDisclaimerAccepted;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserProfile(
      {required this.id,
      required this.dateOfBirth,
      required this.sex,
      required this.heightCm,
      required this.weightKg,
      this.targetWeightKg,
      required this.activityLevel,
      required this.longevityAmbition,
      required this.fitnessLevel,
      required this.dietaryRestrictions,
      required this.medicalConditions,
      required this.equipment,
      required this.preferredWorkoutMinutes,
      required this.wakeTime,
      required this.healthDisclaimerAccepted,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    map['sex'] = Variable<String>(sex);
    map['height_cm'] = Variable<double>(heightCm);
    map['weight_kg'] = Variable<double>(weightKg);
    if (!nullToAbsent || targetWeightKg != null) {
      map['target_weight_kg'] = Variable<double>(targetWeightKg);
    }
    map['activity_level'] = Variable<String>(activityLevel);
    map['longevity_ambition'] = Variable<String>(longevityAmbition);
    map['fitness_level'] = Variable<String>(fitnessLevel);
    map['dietary_restrictions'] = Variable<String>(dietaryRestrictions);
    map['medical_conditions'] = Variable<String>(medicalConditions);
    map['equipment'] = Variable<String>(equipment);
    map['preferred_workout_minutes'] = Variable<int>(preferredWorkoutMinutes);
    map['wake_time'] = Variable<String>(wakeTime);
    map['health_disclaimer_accepted'] =
        Variable<bool>(healthDisclaimerAccepted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      dateOfBirth: Value(dateOfBirth),
      sex: Value(sex),
      heightCm: Value(heightCm),
      weightKg: Value(weightKg),
      targetWeightKg: targetWeightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(targetWeightKg),
      activityLevel: Value(activityLevel),
      longevityAmbition: Value(longevityAmbition),
      fitnessLevel: Value(fitnessLevel),
      dietaryRestrictions: Value(dietaryRestrictions),
      medicalConditions: Value(medicalConditions),
      equipment: Value(equipment),
      preferredWorkoutMinutes: Value(preferredWorkoutMinutes),
      wakeTime: Value(wakeTime),
      healthDisclaimerAccepted: Value(healthDisclaimerAccepted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<String>(json['id']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      sex: serializer.fromJson<String>(json['sex']),
      heightCm: serializer.fromJson<double>(json['heightCm']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      targetWeightKg: serializer.fromJson<double?>(json['targetWeightKg']),
      activityLevel: serializer.fromJson<String>(json['activityLevel']),
      longevityAmbition: serializer.fromJson<String>(json['longevityAmbition']),
      fitnessLevel: serializer.fromJson<String>(json['fitnessLevel']),
      dietaryRestrictions:
          serializer.fromJson<String>(json['dietaryRestrictions']),
      medicalConditions: serializer.fromJson<String>(json['medicalConditions']),
      equipment: serializer.fromJson<String>(json['equipment']),
      preferredWorkoutMinutes:
          serializer.fromJson<int>(json['preferredWorkoutMinutes']),
      wakeTime: serializer.fromJson<String>(json['wakeTime']),
      healthDisclaimerAccepted:
          serializer.fromJson<bool>(json['healthDisclaimerAccepted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'sex': serializer.toJson<String>(sex),
      'heightCm': serializer.toJson<double>(heightCm),
      'weightKg': serializer.toJson<double>(weightKg),
      'targetWeightKg': serializer.toJson<double?>(targetWeightKg),
      'activityLevel': serializer.toJson<String>(activityLevel),
      'longevityAmbition': serializer.toJson<String>(longevityAmbition),
      'fitnessLevel': serializer.toJson<String>(fitnessLevel),
      'dietaryRestrictions': serializer.toJson<String>(dietaryRestrictions),
      'medicalConditions': serializer.toJson<String>(medicalConditions),
      'equipment': serializer.toJson<String>(equipment),
      'preferredWorkoutMinutes':
          serializer.toJson<int>(preferredWorkoutMinutes),
      'wakeTime': serializer.toJson<String>(wakeTime),
      'healthDisclaimerAccepted':
          serializer.toJson<bool>(healthDisclaimerAccepted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfile copyWith(
          {String? id,
          DateTime? dateOfBirth,
          String? sex,
          double? heightCm,
          double? weightKg,
          Value<double?> targetWeightKg = const Value.absent(),
          String? activityLevel,
          String? longevityAmbition,
          String? fitnessLevel,
          String? dietaryRestrictions,
          String? medicalConditions,
          String? equipment,
          int? preferredWorkoutMinutes,
          String? wakeTime,
          bool? healthDisclaimerAccepted,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UserProfile(
        id: id ?? this.id,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        sex: sex ?? this.sex,
        heightCm: heightCm ?? this.heightCm,
        weightKg: weightKg ?? this.weightKg,
        targetWeightKg:
            targetWeightKg.present ? targetWeightKg.value : this.targetWeightKg,
        activityLevel: activityLevel ?? this.activityLevel,
        longevityAmbition: longevityAmbition ?? this.longevityAmbition,
        fitnessLevel: fitnessLevel ?? this.fitnessLevel,
        dietaryRestrictions: dietaryRestrictions ?? this.dietaryRestrictions,
        medicalConditions: medicalConditions ?? this.medicalConditions,
        equipment: equipment ?? this.equipment,
        preferredWorkoutMinutes:
            preferredWorkoutMinutes ?? this.preferredWorkoutMinutes,
        wakeTime: wakeTime ?? this.wakeTime,
        healthDisclaimerAccepted:
            healthDisclaimerAccepted ?? this.healthDisclaimerAccepted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      sex: data.sex.present ? data.sex.value : this.sex,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      targetWeightKg: data.targetWeightKg.present
          ? data.targetWeightKg.value
          : this.targetWeightKg,
      activityLevel: data.activityLevel.present
          ? data.activityLevel.value
          : this.activityLevel,
      longevityAmbition: data.longevityAmbition.present
          ? data.longevityAmbition.value
          : this.longevityAmbition,
      fitnessLevel: data.fitnessLevel.present
          ? data.fitnessLevel.value
          : this.fitnessLevel,
      dietaryRestrictions: data.dietaryRestrictions.present
          ? data.dietaryRestrictions.value
          : this.dietaryRestrictions,
      medicalConditions: data.medicalConditions.present
          ? data.medicalConditions.value
          : this.medicalConditions,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      preferredWorkoutMinutes: data.preferredWorkoutMinutes.present
          ? data.preferredWorkoutMinutes.value
          : this.preferredWorkoutMinutes,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      healthDisclaimerAccepted: data.healthDisclaimerAccepted.present
          ? data.healthDisclaimerAccepted.value
          : this.healthDisclaimerAccepted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('sex: $sex, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('targetWeightKg: $targetWeightKg, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('longevityAmbition: $longevityAmbition, ')
          ..write('fitnessLevel: $fitnessLevel, ')
          ..write('dietaryRestrictions: $dietaryRestrictions, ')
          ..write('medicalConditions: $medicalConditions, ')
          ..write('equipment: $equipment, ')
          ..write('preferredWorkoutMinutes: $preferredWorkoutMinutes, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('healthDisclaimerAccepted: $healthDisclaimerAccepted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      dateOfBirth,
      sex,
      heightCm,
      weightKg,
      targetWeightKg,
      activityLevel,
      longevityAmbition,
      fitnessLevel,
      dietaryRestrictions,
      medicalConditions,
      equipment,
      preferredWorkoutMinutes,
      wakeTime,
      healthDisclaimerAccepted,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.dateOfBirth == this.dateOfBirth &&
          other.sex == this.sex &&
          other.heightCm == this.heightCm &&
          other.weightKg == this.weightKg &&
          other.targetWeightKg == this.targetWeightKg &&
          other.activityLevel == this.activityLevel &&
          other.longevityAmbition == this.longevityAmbition &&
          other.fitnessLevel == this.fitnessLevel &&
          other.dietaryRestrictions == this.dietaryRestrictions &&
          other.medicalConditions == this.medicalConditions &&
          other.equipment == this.equipment &&
          other.preferredWorkoutMinutes == this.preferredWorkoutMinutes &&
          other.wakeTime == this.wakeTime &&
          other.healthDisclaimerAccepted == this.healthDisclaimerAccepted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<String> id;
  final Value<DateTime> dateOfBirth;
  final Value<String> sex;
  final Value<double> heightCm;
  final Value<double> weightKg;
  final Value<double?> targetWeightKg;
  final Value<String> activityLevel;
  final Value<String> longevityAmbition;
  final Value<String> fitnessLevel;
  final Value<String> dietaryRestrictions;
  final Value<String> medicalConditions;
  final Value<String> equipment;
  final Value<int> preferredWorkoutMinutes;
  final Value<String> wakeTime;
  final Value<bool> healthDisclaimerAccepted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.sex = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.targetWeightKg = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.longevityAmbition = const Value.absent(),
    this.fitnessLevel = const Value.absent(),
    this.dietaryRestrictions = const Value.absent(),
    this.medicalConditions = const Value.absent(),
    this.equipment = const Value.absent(),
    this.preferredWorkoutMinutes = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.healthDisclaimerAccepted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String id,
    required DateTime dateOfBirth,
    required String sex,
    required double heightCm,
    required double weightKg,
    this.targetWeightKg = const Value.absent(),
    required String activityLevel,
    required String longevityAmbition,
    required String fitnessLevel,
    required String dietaryRestrictions,
    required String medicalConditions,
    required String equipment,
    required int preferredWorkoutMinutes,
    required String wakeTime,
    required bool healthDisclaimerAccepted,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        dateOfBirth = Value(dateOfBirth),
        sex = Value(sex),
        heightCm = Value(heightCm),
        weightKg = Value(weightKg),
        activityLevel = Value(activityLevel),
        longevityAmbition = Value(longevityAmbition),
        fitnessLevel = Value(fitnessLevel),
        dietaryRestrictions = Value(dietaryRestrictions),
        medicalConditions = Value(medicalConditions),
        equipment = Value(equipment),
        preferredWorkoutMinutes = Value(preferredWorkoutMinutes),
        wakeTime = Value(wakeTime),
        healthDisclaimerAccepted = Value(healthDisclaimerAccepted),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserProfile> custom({
    Expression<String>? id,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? sex,
    Expression<double>? heightCm,
    Expression<double>? weightKg,
    Expression<double>? targetWeightKg,
    Expression<String>? activityLevel,
    Expression<String>? longevityAmbition,
    Expression<String>? fitnessLevel,
    Expression<String>? dietaryRestrictions,
    Expression<String>? medicalConditions,
    Expression<String>? equipment,
    Expression<int>? preferredWorkoutMinutes,
    Expression<String>? wakeTime,
    Expression<bool>? healthDisclaimerAccepted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (sex != null) 'sex': sex,
      if (heightCm != null) 'height_cm': heightCm,
      if (weightKg != null) 'weight_kg': weightKg,
      if (targetWeightKg != null) 'target_weight_kg': targetWeightKg,
      if (activityLevel != null) 'activity_level': activityLevel,
      if (longevityAmbition != null) 'longevity_ambition': longevityAmbition,
      if (fitnessLevel != null) 'fitness_level': fitnessLevel,
      if (dietaryRestrictions != null)
        'dietary_restrictions': dietaryRestrictions,
      if (medicalConditions != null) 'medical_conditions': medicalConditions,
      if (equipment != null) 'equipment': equipment,
      if (preferredWorkoutMinutes != null)
        'preferred_workout_minutes': preferredWorkoutMinutes,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (healthDisclaimerAccepted != null)
        'health_disclaimer_accepted': healthDisclaimerAccepted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? dateOfBirth,
      Value<String>? sex,
      Value<double>? heightCm,
      Value<double>? weightKg,
      Value<double?>? targetWeightKg,
      Value<String>? activityLevel,
      Value<String>? longevityAmbition,
      Value<String>? fitnessLevel,
      Value<String>? dietaryRestrictions,
      Value<String>? medicalConditions,
      Value<String>? equipment,
      Value<int>? preferredWorkoutMinutes,
      Value<String>? wakeTime,
      Value<bool>? healthDisclaimerAccepted,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      sex: sex ?? this.sex,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      targetWeightKg: targetWeightKg ?? this.targetWeightKg,
      activityLevel: activityLevel ?? this.activityLevel,
      longevityAmbition: longevityAmbition ?? this.longevityAmbition,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
      dietaryRestrictions: dietaryRestrictions ?? this.dietaryRestrictions,
      medicalConditions: medicalConditions ?? this.medicalConditions,
      equipment: equipment ?? this.equipment,
      preferredWorkoutMinutes:
          preferredWorkoutMinutes ?? this.preferredWorkoutMinutes,
      wakeTime: wakeTime ?? this.wakeTime,
      healthDisclaimerAccepted:
          healthDisclaimerAccepted ?? this.healthDisclaimerAccepted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (targetWeightKg.present) {
      map['target_weight_kg'] = Variable<double>(targetWeightKg.value);
    }
    if (activityLevel.present) {
      map['activity_level'] = Variable<String>(activityLevel.value);
    }
    if (longevityAmbition.present) {
      map['longevity_ambition'] = Variable<String>(longevityAmbition.value);
    }
    if (fitnessLevel.present) {
      map['fitness_level'] = Variable<String>(fitnessLevel.value);
    }
    if (dietaryRestrictions.present) {
      map['dietary_restrictions'] = Variable<String>(dietaryRestrictions.value);
    }
    if (medicalConditions.present) {
      map['medical_conditions'] = Variable<String>(medicalConditions.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (preferredWorkoutMinutes.present) {
      map['preferred_workout_minutes'] =
          Variable<int>(preferredWorkoutMinutes.value);
    }
    if (wakeTime.present) {
      map['wake_time'] = Variable<String>(wakeTime.value);
    }
    if (healthDisclaimerAccepted.present) {
      map['health_disclaimer_accepted'] =
          Variable<bool>(healthDisclaimerAccepted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('sex: $sex, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('targetWeightKg: $targetWeightKg, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('longevityAmbition: $longevityAmbition, ')
          ..write('fitnessLevel: $fitnessLevel, ')
          ..write('dietaryRestrictions: $dietaryRestrictions, ')
          ..write('medicalConditions: $medicalConditions, ')
          ..write('equipment: $equipment, ')
          ..write('preferredWorkoutMinutes: $preferredWorkoutMinutes, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('healthDisclaimerAccepted: $healthDisclaimerAccepted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyProtocolsTable extends DailyProtocols
    with TableInfo<$DailyProtocolsTable, DailyProtocol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyProtocolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _targetCaloriesMeta =
      const VerificationMeta('targetCalories');
  @override
  late final GeneratedColumn<int> targetCalories = GeneratedColumn<int>(
      'target_calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _targetProteinMeta =
      const VerificationMeta('targetProtein');
  @override
  late final GeneratedColumn<int> targetProtein = GeneratedColumn<int>(
      'target_protein', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _targetCarbsMeta =
      const VerificationMeta('targetCarbs');
  @override
  late final GeneratedColumn<int> targetCarbs = GeneratedColumn<int>(
      'target_carbs', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _targetFatMeta =
      const VerificationMeta('targetFat');
  @override
  late final GeneratedColumn<int> targetFat = GeneratedColumn<int>(
      'target_fat', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _eatingWindowStartMeta =
      const VerificationMeta('eatingWindowStart');
  @override
  late final GeneratedColumn<String> eatingWindowStart =
      GeneratedColumn<String>('eating_window_start', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eatingWindowEndMeta =
      const VerificationMeta('eatingWindowEnd');
  @override
  late final GeneratedColumn<String> eatingWindowEnd = GeneratedColumn<String>(
      'eating_window_end', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseTargetMinutesMeta =
      const VerificationMeta('exerciseTargetMinutes');
  @override
  late final GeneratedColumn<int> exerciseTargetMinutes = GeneratedColumn<int>(
      'exercise_target_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scheduledWorkoutIdMeta =
      const VerificationMeta('scheduledWorkoutId');
  @override
  late final GeneratedColumn<String> scheduledWorkoutId =
      GeneratedColumn<String>('scheduled_workout_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _estimatedCaloriesBurnMeta =
      const VerificationMeta('estimatedCaloriesBurn');
  @override
  late final GeneratedColumn<int> estimatedCaloriesBurn = GeneratedColumn<int>(
      'estimated_calories_burn', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isRestDayMeta =
      const VerificationMeta('isRestDay');
  @override
  late final GeneratedColumn<bool> isRestDay = GeneratedColumn<bool>(
      'is_rest_day', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_rest_day" IN (0, 1))'));
  static const VerificationMeta _targetBedtimeMeta =
      const VerificationMeta('targetBedtime');
  @override
  late final GeneratedColumn<String> targetBedtime = GeneratedColumn<String>(
      'target_bedtime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetWakeTimeMeta =
      const VerificationMeta('targetWakeTime');
  @override
  late final GeneratedColumn<String> targetWakeTime = GeneratedColumn<String>(
      'target_wake_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetSleepMinutesMeta =
      const VerificationMeta('targetSleepMinutes');
  @override
  late final GeneratedColumn<int> targetSleepMinutes = GeneratedColumn<int>(
      'target_sleep_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _windDownStartMeta =
      const VerificationMeta('windDownStart');
  @override
  late final GeneratedColumn<String> windDownStart = GeneratedColumn<String>(
      'wind_down_start', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastCaffeineCutoffMeta =
      const VerificationMeta('lastCaffeineCutoff');
  @override
  late final GeneratedColumn<String> lastCaffeineCutoff =
      GeneratedColumn<String>('last_caffeine_cutoff', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastMealCutoffMeta =
      const VerificationMeta('lastMealCutoff');
  @override
  late final GeneratedColumn<String> lastMealCutoff = GeneratedColumn<String>(
      'last_meal_cutoff', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _supplementsMeta =
      const VerificationMeta('supplements');
  @override
  late final GeneratedColumn<String> supplements = GeneratedColumn<String>(
      'supplements', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
      'generated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        targetCalories,
        targetProtein,
        targetCarbs,
        targetFat,
        eatingWindowStart,
        eatingWindowEnd,
        exerciseTargetMinutes,
        scheduledWorkoutId,
        estimatedCaloriesBurn,
        isRestDay,
        targetBedtime,
        targetWakeTime,
        targetSleepMinutes,
        windDownStart,
        lastCaffeineCutoff,
        lastMealCutoff,
        supplements,
        generatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_protocols';
  @override
  VerificationContext validateIntegrity(Insertable<DailyProtocol> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('target_calories')) {
      context.handle(
          _targetCaloriesMeta,
          targetCalories.isAcceptableOrUnknown(
              data['target_calories']!, _targetCaloriesMeta));
    } else if (isInserting) {
      context.missing(_targetCaloriesMeta);
    }
    if (data.containsKey('target_protein')) {
      context.handle(
          _targetProteinMeta,
          targetProtein.isAcceptableOrUnknown(
              data['target_protein']!, _targetProteinMeta));
    } else if (isInserting) {
      context.missing(_targetProteinMeta);
    }
    if (data.containsKey('target_carbs')) {
      context.handle(
          _targetCarbsMeta,
          targetCarbs.isAcceptableOrUnknown(
              data['target_carbs']!, _targetCarbsMeta));
    } else if (isInserting) {
      context.missing(_targetCarbsMeta);
    }
    if (data.containsKey('target_fat')) {
      context.handle(_targetFatMeta,
          targetFat.isAcceptableOrUnknown(data['target_fat']!, _targetFatMeta));
    } else if (isInserting) {
      context.missing(_targetFatMeta);
    }
    if (data.containsKey('eating_window_start')) {
      context.handle(
          _eatingWindowStartMeta,
          eatingWindowStart.isAcceptableOrUnknown(
              data['eating_window_start']!, _eatingWindowStartMeta));
    } else if (isInserting) {
      context.missing(_eatingWindowStartMeta);
    }
    if (data.containsKey('eating_window_end')) {
      context.handle(
          _eatingWindowEndMeta,
          eatingWindowEnd.isAcceptableOrUnknown(
              data['eating_window_end']!, _eatingWindowEndMeta));
    } else if (isInserting) {
      context.missing(_eatingWindowEndMeta);
    }
    if (data.containsKey('exercise_target_minutes')) {
      context.handle(
          _exerciseTargetMinutesMeta,
          exerciseTargetMinutes.isAcceptableOrUnknown(
              data['exercise_target_minutes']!, _exerciseTargetMinutesMeta));
    } else if (isInserting) {
      context.missing(_exerciseTargetMinutesMeta);
    }
    if (data.containsKey('scheduled_workout_id')) {
      context.handle(
          _scheduledWorkoutIdMeta,
          scheduledWorkoutId.isAcceptableOrUnknown(
              data['scheduled_workout_id']!, _scheduledWorkoutIdMeta));
    }
    if (data.containsKey('estimated_calories_burn')) {
      context.handle(
          _estimatedCaloriesBurnMeta,
          estimatedCaloriesBurn.isAcceptableOrUnknown(
              data['estimated_calories_burn']!, _estimatedCaloriesBurnMeta));
    } else if (isInserting) {
      context.missing(_estimatedCaloriesBurnMeta);
    }
    if (data.containsKey('is_rest_day')) {
      context.handle(
          _isRestDayMeta,
          isRestDay.isAcceptableOrUnknown(
              data['is_rest_day']!, _isRestDayMeta));
    } else if (isInserting) {
      context.missing(_isRestDayMeta);
    }
    if (data.containsKey('target_bedtime')) {
      context.handle(
          _targetBedtimeMeta,
          targetBedtime.isAcceptableOrUnknown(
              data['target_bedtime']!, _targetBedtimeMeta));
    } else if (isInserting) {
      context.missing(_targetBedtimeMeta);
    }
    if (data.containsKey('target_wake_time')) {
      context.handle(
          _targetWakeTimeMeta,
          targetWakeTime.isAcceptableOrUnknown(
              data['target_wake_time']!, _targetWakeTimeMeta));
    } else if (isInserting) {
      context.missing(_targetWakeTimeMeta);
    }
    if (data.containsKey('target_sleep_minutes')) {
      context.handle(
          _targetSleepMinutesMeta,
          targetSleepMinutes.isAcceptableOrUnknown(
              data['target_sleep_minutes']!, _targetSleepMinutesMeta));
    } else if (isInserting) {
      context.missing(_targetSleepMinutesMeta);
    }
    if (data.containsKey('wind_down_start')) {
      context.handle(
          _windDownStartMeta,
          windDownStart.isAcceptableOrUnknown(
              data['wind_down_start']!, _windDownStartMeta));
    } else if (isInserting) {
      context.missing(_windDownStartMeta);
    }
    if (data.containsKey('last_caffeine_cutoff')) {
      context.handle(
          _lastCaffeineCutoffMeta,
          lastCaffeineCutoff.isAcceptableOrUnknown(
              data['last_caffeine_cutoff']!, _lastCaffeineCutoffMeta));
    } else if (isInserting) {
      context.missing(_lastCaffeineCutoffMeta);
    }
    if (data.containsKey('last_meal_cutoff')) {
      context.handle(
          _lastMealCutoffMeta,
          lastMealCutoff.isAcceptableOrUnknown(
              data['last_meal_cutoff']!, _lastMealCutoffMeta));
    } else if (isInserting) {
      context.missing(_lastMealCutoffMeta);
    }
    if (data.containsKey('supplements')) {
      context.handle(
          _supplementsMeta,
          supplements.isAcceptableOrUnknown(
              data['supplements']!, _supplementsMeta));
    } else if (isInserting) {
      context.missing(_supplementsMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyProtocol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyProtocol(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      targetCalories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_calories'])!,
      targetProtein: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_protein'])!,
      targetCarbs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_carbs'])!,
      targetFat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_fat'])!,
      eatingWindowStart: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}eating_window_start'])!,
      eatingWindowEnd: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}eating_window_end'])!,
      exerciseTargetMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}exercise_target_minutes'])!,
      scheduledWorkoutId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}scheduled_workout_id']),
      estimatedCaloriesBurn: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_calories_burn'])!,
      isRestDay: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_rest_day'])!,
      targetBedtime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_bedtime'])!,
      targetWakeTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_wake_time'])!,
      targetSleepMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}target_sleep_minutes'])!,
      windDownStart: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}wind_down_start'])!,
      lastCaffeineCutoff: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_caffeine_cutoff'])!,
      lastMealCutoff: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_meal_cutoff'])!,
      supplements: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplements'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}generated_at'])!,
    );
  }

  @override
  $DailyProtocolsTable createAlias(String alias) {
    return $DailyProtocolsTable(attachedDatabase, alias);
  }
}

class DailyProtocol extends DataClass implements Insertable<DailyProtocol> {
  final String id;
  final DateTime date;
  final int targetCalories;
  final int targetProtein;
  final int targetCarbs;
  final int targetFat;
  final String eatingWindowStart;
  final String eatingWindowEnd;
  final int exerciseTargetMinutes;
  final String? scheduledWorkoutId;
  final int estimatedCaloriesBurn;
  final bool isRestDay;
  final String targetBedtime;
  final String targetWakeTime;
  final int targetSleepMinutes;
  final String windDownStart;
  final String lastCaffeineCutoff;
  final String lastMealCutoff;
  final String supplements;
  final DateTime generatedAt;
  const DailyProtocol(
      {required this.id,
      required this.date,
      required this.targetCalories,
      required this.targetProtein,
      required this.targetCarbs,
      required this.targetFat,
      required this.eatingWindowStart,
      required this.eatingWindowEnd,
      required this.exerciseTargetMinutes,
      this.scheduledWorkoutId,
      required this.estimatedCaloriesBurn,
      required this.isRestDay,
      required this.targetBedtime,
      required this.targetWakeTime,
      required this.targetSleepMinutes,
      required this.windDownStart,
      required this.lastCaffeineCutoff,
      required this.lastMealCutoff,
      required this.supplements,
      required this.generatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['target_calories'] = Variable<int>(targetCalories);
    map['target_protein'] = Variable<int>(targetProtein);
    map['target_carbs'] = Variable<int>(targetCarbs);
    map['target_fat'] = Variable<int>(targetFat);
    map['eating_window_start'] = Variable<String>(eatingWindowStart);
    map['eating_window_end'] = Variable<String>(eatingWindowEnd);
    map['exercise_target_minutes'] = Variable<int>(exerciseTargetMinutes);
    if (!nullToAbsent || scheduledWorkoutId != null) {
      map['scheduled_workout_id'] = Variable<String>(scheduledWorkoutId);
    }
    map['estimated_calories_burn'] = Variable<int>(estimatedCaloriesBurn);
    map['is_rest_day'] = Variable<bool>(isRestDay);
    map['target_bedtime'] = Variable<String>(targetBedtime);
    map['target_wake_time'] = Variable<String>(targetWakeTime);
    map['target_sleep_minutes'] = Variable<int>(targetSleepMinutes);
    map['wind_down_start'] = Variable<String>(windDownStart);
    map['last_caffeine_cutoff'] = Variable<String>(lastCaffeineCutoff);
    map['last_meal_cutoff'] = Variable<String>(lastMealCutoff);
    map['supplements'] = Variable<String>(supplements);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    return map;
  }

  DailyProtocolsCompanion toCompanion(bool nullToAbsent) {
    return DailyProtocolsCompanion(
      id: Value(id),
      date: Value(date),
      targetCalories: Value(targetCalories),
      targetProtein: Value(targetProtein),
      targetCarbs: Value(targetCarbs),
      targetFat: Value(targetFat),
      eatingWindowStart: Value(eatingWindowStart),
      eatingWindowEnd: Value(eatingWindowEnd),
      exerciseTargetMinutes: Value(exerciseTargetMinutes),
      scheduledWorkoutId: scheduledWorkoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledWorkoutId),
      estimatedCaloriesBurn: Value(estimatedCaloriesBurn),
      isRestDay: Value(isRestDay),
      targetBedtime: Value(targetBedtime),
      targetWakeTime: Value(targetWakeTime),
      targetSleepMinutes: Value(targetSleepMinutes),
      windDownStart: Value(windDownStart),
      lastCaffeineCutoff: Value(lastCaffeineCutoff),
      lastMealCutoff: Value(lastMealCutoff),
      supplements: Value(supplements),
      generatedAt: Value(generatedAt),
    );
  }

  factory DailyProtocol.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyProtocol(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      targetCalories: serializer.fromJson<int>(json['targetCalories']),
      targetProtein: serializer.fromJson<int>(json['targetProtein']),
      targetCarbs: serializer.fromJson<int>(json['targetCarbs']),
      targetFat: serializer.fromJson<int>(json['targetFat']),
      eatingWindowStart: serializer.fromJson<String>(json['eatingWindowStart']),
      eatingWindowEnd: serializer.fromJson<String>(json['eatingWindowEnd']),
      exerciseTargetMinutes:
          serializer.fromJson<int>(json['exerciseTargetMinutes']),
      scheduledWorkoutId:
          serializer.fromJson<String?>(json['scheduledWorkoutId']),
      estimatedCaloriesBurn:
          serializer.fromJson<int>(json['estimatedCaloriesBurn']),
      isRestDay: serializer.fromJson<bool>(json['isRestDay']),
      targetBedtime: serializer.fromJson<String>(json['targetBedtime']),
      targetWakeTime: serializer.fromJson<String>(json['targetWakeTime']),
      targetSleepMinutes: serializer.fromJson<int>(json['targetSleepMinutes']),
      windDownStart: serializer.fromJson<String>(json['windDownStart']),
      lastCaffeineCutoff:
          serializer.fromJson<String>(json['lastCaffeineCutoff']),
      lastMealCutoff: serializer.fromJson<String>(json['lastMealCutoff']),
      supplements: serializer.fromJson<String>(json['supplements']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'targetCalories': serializer.toJson<int>(targetCalories),
      'targetProtein': serializer.toJson<int>(targetProtein),
      'targetCarbs': serializer.toJson<int>(targetCarbs),
      'targetFat': serializer.toJson<int>(targetFat),
      'eatingWindowStart': serializer.toJson<String>(eatingWindowStart),
      'eatingWindowEnd': serializer.toJson<String>(eatingWindowEnd),
      'exerciseTargetMinutes': serializer.toJson<int>(exerciseTargetMinutes),
      'scheduledWorkoutId': serializer.toJson<String?>(scheduledWorkoutId),
      'estimatedCaloriesBurn': serializer.toJson<int>(estimatedCaloriesBurn),
      'isRestDay': serializer.toJson<bool>(isRestDay),
      'targetBedtime': serializer.toJson<String>(targetBedtime),
      'targetWakeTime': serializer.toJson<String>(targetWakeTime),
      'targetSleepMinutes': serializer.toJson<int>(targetSleepMinutes),
      'windDownStart': serializer.toJson<String>(windDownStart),
      'lastCaffeineCutoff': serializer.toJson<String>(lastCaffeineCutoff),
      'lastMealCutoff': serializer.toJson<String>(lastMealCutoff),
      'supplements': serializer.toJson<String>(supplements),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
    };
  }

  DailyProtocol copyWith(
          {String? id,
          DateTime? date,
          int? targetCalories,
          int? targetProtein,
          int? targetCarbs,
          int? targetFat,
          String? eatingWindowStart,
          String? eatingWindowEnd,
          int? exerciseTargetMinutes,
          Value<String?> scheduledWorkoutId = const Value.absent(),
          int? estimatedCaloriesBurn,
          bool? isRestDay,
          String? targetBedtime,
          String? targetWakeTime,
          int? targetSleepMinutes,
          String? windDownStart,
          String? lastCaffeineCutoff,
          String? lastMealCutoff,
          String? supplements,
          DateTime? generatedAt}) =>
      DailyProtocol(
        id: id ?? this.id,
        date: date ?? this.date,
        targetCalories: targetCalories ?? this.targetCalories,
        targetProtein: targetProtein ?? this.targetProtein,
        targetCarbs: targetCarbs ?? this.targetCarbs,
        targetFat: targetFat ?? this.targetFat,
        eatingWindowStart: eatingWindowStart ?? this.eatingWindowStart,
        eatingWindowEnd: eatingWindowEnd ?? this.eatingWindowEnd,
        exerciseTargetMinutes:
            exerciseTargetMinutes ?? this.exerciseTargetMinutes,
        scheduledWorkoutId: scheduledWorkoutId.present
            ? scheduledWorkoutId.value
            : this.scheduledWorkoutId,
        estimatedCaloriesBurn:
            estimatedCaloriesBurn ?? this.estimatedCaloriesBurn,
        isRestDay: isRestDay ?? this.isRestDay,
        targetBedtime: targetBedtime ?? this.targetBedtime,
        targetWakeTime: targetWakeTime ?? this.targetWakeTime,
        targetSleepMinutes: targetSleepMinutes ?? this.targetSleepMinutes,
        windDownStart: windDownStart ?? this.windDownStart,
        lastCaffeineCutoff: lastCaffeineCutoff ?? this.lastCaffeineCutoff,
        lastMealCutoff: lastMealCutoff ?? this.lastMealCutoff,
        supplements: supplements ?? this.supplements,
        generatedAt: generatedAt ?? this.generatedAt,
      );
  DailyProtocol copyWithCompanion(DailyProtocolsCompanion data) {
    return DailyProtocol(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      targetCalories: data.targetCalories.present
          ? data.targetCalories.value
          : this.targetCalories,
      targetProtein: data.targetProtein.present
          ? data.targetProtein.value
          : this.targetProtein,
      targetCarbs:
          data.targetCarbs.present ? data.targetCarbs.value : this.targetCarbs,
      targetFat: data.targetFat.present ? data.targetFat.value : this.targetFat,
      eatingWindowStart: data.eatingWindowStart.present
          ? data.eatingWindowStart.value
          : this.eatingWindowStart,
      eatingWindowEnd: data.eatingWindowEnd.present
          ? data.eatingWindowEnd.value
          : this.eatingWindowEnd,
      exerciseTargetMinutes: data.exerciseTargetMinutes.present
          ? data.exerciseTargetMinutes.value
          : this.exerciseTargetMinutes,
      scheduledWorkoutId: data.scheduledWorkoutId.present
          ? data.scheduledWorkoutId.value
          : this.scheduledWorkoutId,
      estimatedCaloriesBurn: data.estimatedCaloriesBurn.present
          ? data.estimatedCaloriesBurn.value
          : this.estimatedCaloriesBurn,
      isRestDay: data.isRestDay.present ? data.isRestDay.value : this.isRestDay,
      targetBedtime: data.targetBedtime.present
          ? data.targetBedtime.value
          : this.targetBedtime,
      targetWakeTime: data.targetWakeTime.present
          ? data.targetWakeTime.value
          : this.targetWakeTime,
      targetSleepMinutes: data.targetSleepMinutes.present
          ? data.targetSleepMinutes.value
          : this.targetSleepMinutes,
      windDownStart: data.windDownStart.present
          ? data.windDownStart.value
          : this.windDownStart,
      lastCaffeineCutoff: data.lastCaffeineCutoff.present
          ? data.lastCaffeineCutoff.value
          : this.lastCaffeineCutoff,
      lastMealCutoff: data.lastMealCutoff.present
          ? data.lastMealCutoff.value
          : this.lastMealCutoff,
      supplements:
          data.supplements.present ? data.supplements.value : this.supplements,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyProtocol(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('targetCalories: $targetCalories, ')
          ..write('targetProtein: $targetProtein, ')
          ..write('targetCarbs: $targetCarbs, ')
          ..write('targetFat: $targetFat, ')
          ..write('eatingWindowStart: $eatingWindowStart, ')
          ..write('eatingWindowEnd: $eatingWindowEnd, ')
          ..write('exerciseTargetMinutes: $exerciseTargetMinutes, ')
          ..write('scheduledWorkoutId: $scheduledWorkoutId, ')
          ..write('estimatedCaloriesBurn: $estimatedCaloriesBurn, ')
          ..write('isRestDay: $isRestDay, ')
          ..write('targetBedtime: $targetBedtime, ')
          ..write('targetWakeTime: $targetWakeTime, ')
          ..write('targetSleepMinutes: $targetSleepMinutes, ')
          ..write('windDownStart: $windDownStart, ')
          ..write('lastCaffeineCutoff: $lastCaffeineCutoff, ')
          ..write('lastMealCutoff: $lastMealCutoff, ')
          ..write('supplements: $supplements, ')
          ..write('generatedAt: $generatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      date,
      targetCalories,
      targetProtein,
      targetCarbs,
      targetFat,
      eatingWindowStart,
      eatingWindowEnd,
      exerciseTargetMinutes,
      scheduledWorkoutId,
      estimatedCaloriesBurn,
      isRestDay,
      targetBedtime,
      targetWakeTime,
      targetSleepMinutes,
      windDownStart,
      lastCaffeineCutoff,
      lastMealCutoff,
      supplements,
      generatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyProtocol &&
          other.id == this.id &&
          other.date == this.date &&
          other.targetCalories == this.targetCalories &&
          other.targetProtein == this.targetProtein &&
          other.targetCarbs == this.targetCarbs &&
          other.targetFat == this.targetFat &&
          other.eatingWindowStart == this.eatingWindowStart &&
          other.eatingWindowEnd == this.eatingWindowEnd &&
          other.exerciseTargetMinutes == this.exerciseTargetMinutes &&
          other.scheduledWorkoutId == this.scheduledWorkoutId &&
          other.estimatedCaloriesBurn == this.estimatedCaloriesBurn &&
          other.isRestDay == this.isRestDay &&
          other.targetBedtime == this.targetBedtime &&
          other.targetWakeTime == this.targetWakeTime &&
          other.targetSleepMinutes == this.targetSleepMinutes &&
          other.windDownStart == this.windDownStart &&
          other.lastCaffeineCutoff == this.lastCaffeineCutoff &&
          other.lastMealCutoff == this.lastMealCutoff &&
          other.supplements == this.supplements &&
          other.generatedAt == this.generatedAt);
}

class DailyProtocolsCompanion extends UpdateCompanion<DailyProtocol> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<int> targetCalories;
  final Value<int> targetProtein;
  final Value<int> targetCarbs;
  final Value<int> targetFat;
  final Value<String> eatingWindowStart;
  final Value<String> eatingWindowEnd;
  final Value<int> exerciseTargetMinutes;
  final Value<String?> scheduledWorkoutId;
  final Value<int> estimatedCaloriesBurn;
  final Value<bool> isRestDay;
  final Value<String> targetBedtime;
  final Value<String> targetWakeTime;
  final Value<int> targetSleepMinutes;
  final Value<String> windDownStart;
  final Value<String> lastCaffeineCutoff;
  final Value<String> lastMealCutoff;
  final Value<String> supplements;
  final Value<DateTime> generatedAt;
  final Value<int> rowid;
  const DailyProtocolsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.targetCalories = const Value.absent(),
    this.targetProtein = const Value.absent(),
    this.targetCarbs = const Value.absent(),
    this.targetFat = const Value.absent(),
    this.eatingWindowStart = const Value.absent(),
    this.eatingWindowEnd = const Value.absent(),
    this.exerciseTargetMinutes = const Value.absent(),
    this.scheduledWorkoutId = const Value.absent(),
    this.estimatedCaloriesBurn = const Value.absent(),
    this.isRestDay = const Value.absent(),
    this.targetBedtime = const Value.absent(),
    this.targetWakeTime = const Value.absent(),
    this.targetSleepMinutes = const Value.absent(),
    this.windDownStart = const Value.absent(),
    this.lastCaffeineCutoff = const Value.absent(),
    this.lastMealCutoff = const Value.absent(),
    this.supplements = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyProtocolsCompanion.insert({
    required String id,
    required DateTime date,
    required int targetCalories,
    required int targetProtein,
    required int targetCarbs,
    required int targetFat,
    required String eatingWindowStart,
    required String eatingWindowEnd,
    required int exerciseTargetMinutes,
    this.scheduledWorkoutId = const Value.absent(),
    required int estimatedCaloriesBurn,
    required bool isRestDay,
    required String targetBedtime,
    required String targetWakeTime,
    required int targetSleepMinutes,
    required String windDownStart,
    required String lastCaffeineCutoff,
    required String lastMealCutoff,
    required String supplements,
    required DateTime generatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        targetCalories = Value(targetCalories),
        targetProtein = Value(targetProtein),
        targetCarbs = Value(targetCarbs),
        targetFat = Value(targetFat),
        eatingWindowStart = Value(eatingWindowStart),
        eatingWindowEnd = Value(eatingWindowEnd),
        exerciseTargetMinutes = Value(exerciseTargetMinutes),
        estimatedCaloriesBurn = Value(estimatedCaloriesBurn),
        isRestDay = Value(isRestDay),
        targetBedtime = Value(targetBedtime),
        targetWakeTime = Value(targetWakeTime),
        targetSleepMinutes = Value(targetSleepMinutes),
        windDownStart = Value(windDownStart),
        lastCaffeineCutoff = Value(lastCaffeineCutoff),
        lastMealCutoff = Value(lastMealCutoff),
        supplements = Value(supplements),
        generatedAt = Value(generatedAt);
  static Insertable<DailyProtocol> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<int>? targetCalories,
    Expression<int>? targetProtein,
    Expression<int>? targetCarbs,
    Expression<int>? targetFat,
    Expression<String>? eatingWindowStart,
    Expression<String>? eatingWindowEnd,
    Expression<int>? exerciseTargetMinutes,
    Expression<String>? scheduledWorkoutId,
    Expression<int>? estimatedCaloriesBurn,
    Expression<bool>? isRestDay,
    Expression<String>? targetBedtime,
    Expression<String>? targetWakeTime,
    Expression<int>? targetSleepMinutes,
    Expression<String>? windDownStart,
    Expression<String>? lastCaffeineCutoff,
    Expression<String>? lastMealCutoff,
    Expression<String>? supplements,
    Expression<DateTime>? generatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (targetCalories != null) 'target_calories': targetCalories,
      if (targetProtein != null) 'target_protein': targetProtein,
      if (targetCarbs != null) 'target_carbs': targetCarbs,
      if (targetFat != null) 'target_fat': targetFat,
      if (eatingWindowStart != null) 'eating_window_start': eatingWindowStart,
      if (eatingWindowEnd != null) 'eating_window_end': eatingWindowEnd,
      if (exerciseTargetMinutes != null)
        'exercise_target_minutes': exerciseTargetMinutes,
      if (scheduledWorkoutId != null)
        'scheduled_workout_id': scheduledWorkoutId,
      if (estimatedCaloriesBurn != null)
        'estimated_calories_burn': estimatedCaloriesBurn,
      if (isRestDay != null) 'is_rest_day': isRestDay,
      if (targetBedtime != null) 'target_bedtime': targetBedtime,
      if (targetWakeTime != null) 'target_wake_time': targetWakeTime,
      if (targetSleepMinutes != null)
        'target_sleep_minutes': targetSleepMinutes,
      if (windDownStart != null) 'wind_down_start': windDownStart,
      if (lastCaffeineCutoff != null)
        'last_caffeine_cutoff': lastCaffeineCutoff,
      if (lastMealCutoff != null) 'last_meal_cutoff': lastMealCutoff,
      if (supplements != null) 'supplements': supplements,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyProtocolsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<int>? targetCalories,
      Value<int>? targetProtein,
      Value<int>? targetCarbs,
      Value<int>? targetFat,
      Value<String>? eatingWindowStart,
      Value<String>? eatingWindowEnd,
      Value<int>? exerciseTargetMinutes,
      Value<String?>? scheduledWorkoutId,
      Value<int>? estimatedCaloriesBurn,
      Value<bool>? isRestDay,
      Value<String>? targetBedtime,
      Value<String>? targetWakeTime,
      Value<int>? targetSleepMinutes,
      Value<String>? windDownStart,
      Value<String>? lastCaffeineCutoff,
      Value<String>? lastMealCutoff,
      Value<String>? supplements,
      Value<DateTime>? generatedAt,
      Value<int>? rowid}) {
    return DailyProtocolsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      targetCalories: targetCalories ?? this.targetCalories,
      targetProtein: targetProtein ?? this.targetProtein,
      targetCarbs: targetCarbs ?? this.targetCarbs,
      targetFat: targetFat ?? this.targetFat,
      eatingWindowStart: eatingWindowStart ?? this.eatingWindowStart,
      eatingWindowEnd: eatingWindowEnd ?? this.eatingWindowEnd,
      exerciseTargetMinutes:
          exerciseTargetMinutes ?? this.exerciseTargetMinutes,
      scheduledWorkoutId: scheduledWorkoutId ?? this.scheduledWorkoutId,
      estimatedCaloriesBurn:
          estimatedCaloriesBurn ?? this.estimatedCaloriesBurn,
      isRestDay: isRestDay ?? this.isRestDay,
      targetBedtime: targetBedtime ?? this.targetBedtime,
      targetWakeTime: targetWakeTime ?? this.targetWakeTime,
      targetSleepMinutes: targetSleepMinutes ?? this.targetSleepMinutes,
      windDownStart: windDownStart ?? this.windDownStart,
      lastCaffeineCutoff: lastCaffeineCutoff ?? this.lastCaffeineCutoff,
      lastMealCutoff: lastMealCutoff ?? this.lastMealCutoff,
      supplements: supplements ?? this.supplements,
      generatedAt: generatedAt ?? this.generatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (targetCalories.present) {
      map['target_calories'] = Variable<int>(targetCalories.value);
    }
    if (targetProtein.present) {
      map['target_protein'] = Variable<int>(targetProtein.value);
    }
    if (targetCarbs.present) {
      map['target_carbs'] = Variable<int>(targetCarbs.value);
    }
    if (targetFat.present) {
      map['target_fat'] = Variable<int>(targetFat.value);
    }
    if (eatingWindowStart.present) {
      map['eating_window_start'] = Variable<String>(eatingWindowStart.value);
    }
    if (eatingWindowEnd.present) {
      map['eating_window_end'] = Variable<String>(eatingWindowEnd.value);
    }
    if (exerciseTargetMinutes.present) {
      map['exercise_target_minutes'] =
          Variable<int>(exerciseTargetMinutes.value);
    }
    if (scheduledWorkoutId.present) {
      map['scheduled_workout_id'] = Variable<String>(scheduledWorkoutId.value);
    }
    if (estimatedCaloriesBurn.present) {
      map['estimated_calories_burn'] =
          Variable<int>(estimatedCaloriesBurn.value);
    }
    if (isRestDay.present) {
      map['is_rest_day'] = Variable<bool>(isRestDay.value);
    }
    if (targetBedtime.present) {
      map['target_bedtime'] = Variable<String>(targetBedtime.value);
    }
    if (targetWakeTime.present) {
      map['target_wake_time'] = Variable<String>(targetWakeTime.value);
    }
    if (targetSleepMinutes.present) {
      map['target_sleep_minutes'] = Variable<int>(targetSleepMinutes.value);
    }
    if (windDownStart.present) {
      map['wind_down_start'] = Variable<String>(windDownStart.value);
    }
    if (lastCaffeineCutoff.present) {
      map['last_caffeine_cutoff'] = Variable<String>(lastCaffeineCutoff.value);
    }
    if (lastMealCutoff.present) {
      map['last_meal_cutoff'] = Variable<String>(lastMealCutoff.value);
    }
    if (supplements.present) {
      map['supplements'] = Variable<String>(supplements.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyProtocolsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('targetCalories: $targetCalories, ')
          ..write('targetProtein: $targetProtein, ')
          ..write('targetCarbs: $targetCarbs, ')
          ..write('targetFat: $targetFat, ')
          ..write('eatingWindowStart: $eatingWindowStart, ')
          ..write('eatingWindowEnd: $eatingWindowEnd, ')
          ..write('exerciseTargetMinutes: $exerciseTargetMinutes, ')
          ..write('scheduledWorkoutId: $scheduledWorkoutId, ')
          ..write('estimatedCaloriesBurn: $estimatedCaloriesBurn, ')
          ..write('isRestDay: $isRestDay, ')
          ..write('targetBedtime: $targetBedtime, ')
          ..write('targetWakeTime: $targetWakeTime, ')
          ..write('targetSleepMinutes: $targetSleepMinutes, ')
          ..write('windDownStart: $windDownStart, ')
          ..write('lastCaffeineCutoff: $lastCaffeineCutoff, ')
          ..write('lastMealCutoff: $lastMealCutoff, ')
          ..write('supplements: $supplements, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealEntriesTable extends MealEntries
    with TableInfo<$MealEntriesTable, MealEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oderIdMeta = const VerificationMeta('oderId');
  @override
  late final GeneratedColumn<String> oderId = GeneratedColumn<String>(
      'oder_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _mealTypeMeta =
      const VerificationMeta('mealType');
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
      'meal_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemsJsonMeta =
      const VerificationMeta('itemsJson');
  @override
  late final GeneratedColumn<String> itemsJson = GeneratedColumn<String>(
      'items_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalCaloriesMeta =
      const VerificationMeta('totalCalories');
  @override
  late final GeneratedColumn<int> totalCalories = GeneratedColumn<int>(
      'total_calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalProteinMeta =
      const VerificationMeta('totalProtein');
  @override
  late final GeneratedColumn<double> totalProtein = GeneratedColumn<double>(
      'total_protein', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalCarbsMeta =
      const VerificationMeta('totalCarbs');
  @override
  late final GeneratedColumn<double> totalCarbs = GeneratedColumn<double>(
      'total_carbs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalFatMeta =
      const VerificationMeta('totalFat');
  @override
  late final GeneratedColumn<double> totalFat = GeneratedColumn<double>(
      'total_fat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oderId,
        timestamp,
        mealType,
        itemsJson,
        totalCalories,
        totalProtein,
        totalCarbs,
        totalFat,
        source
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<MealEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('oder_id')) {
      context.handle(_oderIdMeta,
          oderId.isAcceptableOrUnknown(data['oder_id']!, _oderIdMeta));
    } else if (isInserting) {
      context.missing(_oderIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(_mealTypeMeta,
          mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta));
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('items_json')) {
      context.handle(_itemsJsonMeta,
          itemsJson.isAcceptableOrUnknown(data['items_json']!, _itemsJsonMeta));
    } else if (isInserting) {
      context.missing(_itemsJsonMeta);
    }
    if (data.containsKey('total_calories')) {
      context.handle(
          _totalCaloriesMeta,
          totalCalories.isAcceptableOrUnknown(
              data['total_calories']!, _totalCaloriesMeta));
    } else if (isInserting) {
      context.missing(_totalCaloriesMeta);
    }
    if (data.containsKey('total_protein')) {
      context.handle(
          _totalProteinMeta,
          totalProtein.isAcceptableOrUnknown(
              data['total_protein']!, _totalProteinMeta));
    } else if (isInserting) {
      context.missing(_totalProteinMeta);
    }
    if (data.containsKey('total_carbs')) {
      context.handle(
          _totalCarbsMeta,
          totalCarbs.isAcceptableOrUnknown(
              data['total_carbs']!, _totalCarbsMeta));
    } else if (isInserting) {
      context.missing(_totalCarbsMeta);
    }
    if (data.containsKey('total_fat')) {
      context.handle(_totalFatMeta,
          totalFat.isAcceptableOrUnknown(data['total_fat']!, _totalFatMeta));
    } else if (isInserting) {
      context.missing(_totalFatMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      oderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oder_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      mealType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_type'])!,
      itemsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}items_json'])!,
      totalCalories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_calories'])!,
      totalProtein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_protein'])!,
      totalCarbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_carbs'])!,
      totalFat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_fat'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
    );
  }

  @override
  $MealEntriesTable createAlias(String alias) {
    return $MealEntriesTable(attachedDatabase, alias);
  }
}

class MealEntry extends DataClass implements Insertable<MealEntry> {
  final String id;
  final String oderId;
  final DateTime timestamp;
  final String mealType;
  final String itemsJson;
  final int totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;
  final String source;
  const MealEntry(
      {required this.id,
      required this.oderId,
      required this.timestamp,
      required this.mealType,
      required this.itemsJson,
      required this.totalCalories,
      required this.totalProtein,
      required this.totalCarbs,
      required this.totalFat,
      required this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['oder_id'] = Variable<String>(oderId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['meal_type'] = Variable<String>(mealType);
    map['items_json'] = Variable<String>(itemsJson);
    map['total_calories'] = Variable<int>(totalCalories);
    map['total_protein'] = Variable<double>(totalProtein);
    map['total_carbs'] = Variable<double>(totalCarbs);
    map['total_fat'] = Variable<double>(totalFat);
    map['source'] = Variable<String>(source);
    return map;
  }

  MealEntriesCompanion toCompanion(bool nullToAbsent) {
    return MealEntriesCompanion(
      id: Value(id),
      oderId: Value(oderId),
      timestamp: Value(timestamp),
      mealType: Value(mealType),
      itemsJson: Value(itemsJson),
      totalCalories: Value(totalCalories),
      totalProtein: Value(totalProtein),
      totalCarbs: Value(totalCarbs),
      totalFat: Value(totalFat),
      source: Value(source),
    );
  }

  factory MealEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealEntry(
      id: serializer.fromJson<String>(json['id']),
      oderId: serializer.fromJson<String>(json['oderId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      mealType: serializer.fromJson<String>(json['mealType']),
      itemsJson: serializer.fromJson<String>(json['itemsJson']),
      totalCalories: serializer.fromJson<int>(json['totalCalories']),
      totalProtein: serializer.fromJson<double>(json['totalProtein']),
      totalCarbs: serializer.fromJson<double>(json['totalCarbs']),
      totalFat: serializer.fromJson<double>(json['totalFat']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'oderId': serializer.toJson<String>(oderId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'mealType': serializer.toJson<String>(mealType),
      'itemsJson': serializer.toJson<String>(itemsJson),
      'totalCalories': serializer.toJson<int>(totalCalories),
      'totalProtein': serializer.toJson<double>(totalProtein),
      'totalCarbs': serializer.toJson<double>(totalCarbs),
      'totalFat': serializer.toJson<double>(totalFat),
      'source': serializer.toJson<String>(source),
    };
  }

  MealEntry copyWith(
          {String? id,
          String? oderId,
          DateTime? timestamp,
          String? mealType,
          String? itemsJson,
          int? totalCalories,
          double? totalProtein,
          double? totalCarbs,
          double? totalFat,
          String? source}) =>
      MealEntry(
        id: id ?? this.id,
        oderId: oderId ?? this.oderId,
        timestamp: timestamp ?? this.timestamp,
        mealType: mealType ?? this.mealType,
        itemsJson: itemsJson ?? this.itemsJson,
        totalCalories: totalCalories ?? this.totalCalories,
        totalProtein: totalProtein ?? this.totalProtein,
        totalCarbs: totalCarbs ?? this.totalCarbs,
        totalFat: totalFat ?? this.totalFat,
        source: source ?? this.source,
      );
  MealEntry copyWithCompanion(MealEntriesCompanion data) {
    return MealEntry(
      id: data.id.present ? data.id.value : this.id,
      oderId: data.oderId.present ? data.oderId.value : this.oderId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      itemsJson: data.itemsJson.present ? data.itemsJson.value : this.itemsJson,
      totalCalories: data.totalCalories.present
          ? data.totalCalories.value
          : this.totalCalories,
      totalProtein: data.totalProtein.present
          ? data.totalProtein.value
          : this.totalProtein,
      totalCarbs:
          data.totalCarbs.present ? data.totalCarbs.value : this.totalCarbs,
      totalFat: data.totalFat.present ? data.totalFat.value : this.totalFat,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealEntry(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('timestamp: $timestamp, ')
          ..write('mealType: $mealType, ')
          ..write('itemsJson: $itemsJson, ')
          ..write('totalCalories: $totalCalories, ')
          ..write('totalProtein: $totalProtein, ')
          ..write('totalCarbs: $totalCarbs, ')
          ..write('totalFat: $totalFat, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, oderId, timestamp, mealType, itemsJson,
      totalCalories, totalProtein, totalCarbs, totalFat, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealEntry &&
          other.id == this.id &&
          other.oderId == this.oderId &&
          other.timestamp == this.timestamp &&
          other.mealType == this.mealType &&
          other.itemsJson == this.itemsJson &&
          other.totalCalories == this.totalCalories &&
          other.totalProtein == this.totalProtein &&
          other.totalCarbs == this.totalCarbs &&
          other.totalFat == this.totalFat &&
          other.source == this.source);
}

class MealEntriesCompanion extends UpdateCompanion<MealEntry> {
  final Value<String> id;
  final Value<String> oderId;
  final Value<DateTime> timestamp;
  final Value<String> mealType;
  final Value<String> itemsJson;
  final Value<int> totalCalories;
  final Value<double> totalProtein;
  final Value<double> totalCarbs;
  final Value<double> totalFat;
  final Value<String> source;
  final Value<int> rowid;
  const MealEntriesCompanion({
    this.id = const Value.absent(),
    this.oderId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.mealType = const Value.absent(),
    this.itemsJson = const Value.absent(),
    this.totalCalories = const Value.absent(),
    this.totalProtein = const Value.absent(),
    this.totalCarbs = const Value.absent(),
    this.totalFat = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealEntriesCompanion.insert({
    required String id,
    required String oderId,
    required DateTime timestamp,
    required String mealType,
    required String itemsJson,
    required int totalCalories,
    required double totalProtein,
    required double totalCarbs,
    required double totalFat,
    required String source,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        oderId = Value(oderId),
        timestamp = Value(timestamp),
        mealType = Value(mealType),
        itemsJson = Value(itemsJson),
        totalCalories = Value(totalCalories),
        totalProtein = Value(totalProtein),
        totalCarbs = Value(totalCarbs),
        totalFat = Value(totalFat),
        source = Value(source);
  static Insertable<MealEntry> custom({
    Expression<String>? id,
    Expression<String>? oderId,
    Expression<DateTime>? timestamp,
    Expression<String>? mealType,
    Expression<String>? itemsJson,
    Expression<int>? totalCalories,
    Expression<double>? totalProtein,
    Expression<double>? totalCarbs,
    Expression<double>? totalFat,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oderId != null) 'oder_id': oderId,
      if (timestamp != null) 'timestamp': timestamp,
      if (mealType != null) 'meal_type': mealType,
      if (itemsJson != null) 'items_json': itemsJson,
      if (totalCalories != null) 'total_calories': totalCalories,
      if (totalProtein != null) 'total_protein': totalProtein,
      if (totalCarbs != null) 'total_carbs': totalCarbs,
      if (totalFat != null) 'total_fat': totalFat,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? oderId,
      Value<DateTime>? timestamp,
      Value<String>? mealType,
      Value<String>? itemsJson,
      Value<int>? totalCalories,
      Value<double>? totalProtein,
      Value<double>? totalCarbs,
      Value<double>? totalFat,
      Value<String>? source,
      Value<int>? rowid}) {
    return MealEntriesCompanion(
      id: id ?? this.id,
      oderId: oderId ?? this.oderId,
      timestamp: timestamp ?? this.timestamp,
      mealType: mealType ?? this.mealType,
      itemsJson: itemsJson ?? this.itemsJson,
      totalCalories: totalCalories ?? this.totalCalories,
      totalProtein: totalProtein ?? this.totalProtein,
      totalCarbs: totalCarbs ?? this.totalCarbs,
      totalFat: totalFat ?? this.totalFat,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (oderId.present) {
      map['oder_id'] = Variable<String>(oderId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (itemsJson.present) {
      map['items_json'] = Variable<String>(itemsJson.value);
    }
    if (totalCalories.present) {
      map['total_calories'] = Variable<int>(totalCalories.value);
    }
    if (totalProtein.present) {
      map['total_protein'] = Variable<double>(totalProtein.value);
    }
    if (totalCarbs.present) {
      map['total_carbs'] = Variable<double>(totalCarbs.value);
    }
    if (totalFat.present) {
      map['total_fat'] = Variable<double>(totalFat.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealEntriesCompanion(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('timestamp: $timestamp, ')
          ..write('mealType: $mealType, ')
          ..write('itemsJson: $itemsJson, ')
          ..write('totalCalories: $totalCalories, ')
          ..write('totalProtein: $totalProtein, ')
          ..write('totalCarbs: $totalCarbs, ')
          ..write('totalFat: $totalFat, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oderIdMeta = const VerificationMeta('oderId');
  @override
  late final GeneratedColumn<String> oderId = GeneratedColumn<String>(
      'oder_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
      'workout_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _caloriesBurnedMeta =
      const VerificationMeta('caloriesBurned');
  @override
  late final GeneratedColumn<int> caloriesBurned = GeneratedColumn<int>(
      'calories_burned', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _averageHeartRateMeta =
      const VerificationMeta('averageHeartRate');
  @override
  late final GeneratedColumn<double> averageHeartRate = GeneratedColumn<double>(
      'average_heart_rate', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxHeartRateMeta =
      const VerificationMeta('maxHeartRate');
  @override
  late final GeneratedColumn<double> maxHeartRate = GeneratedColumn<double>(
      'max_heart_rate', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _distanceMetersMeta =
      const VerificationMeta('distanceMeters');
  @override
  late final GeneratedColumn<double> distanceMeters = GeneratedColumn<double>(
      'distance_meters', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oderId,
        workoutId,
        startTime,
        endTime,
        durationMinutes,
        caloriesBurned,
        category,
        averageHeartRate,
        maxHeartRate,
        distanceMeters,
        source,
        externalId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('oder_id')) {
      context.handle(_oderIdMeta,
          oderId.isAcceptableOrUnknown(data['oder_id']!, _oderIdMeta));
    } else if (isInserting) {
      context.missing(_oderIdMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
          _caloriesBurnedMeta,
          caloriesBurned.isAcceptableOrUnknown(
              data['calories_burned']!, _caloriesBurnedMeta));
    } else if (isInserting) {
      context.missing(_caloriesBurnedMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('average_heart_rate')) {
      context.handle(
          _averageHeartRateMeta,
          averageHeartRate.isAcceptableOrUnknown(
              data['average_heart_rate']!, _averageHeartRateMeta));
    }
    if (data.containsKey('max_heart_rate')) {
      context.handle(
          _maxHeartRateMeta,
          maxHeartRate.isAcceptableOrUnknown(
              data['max_heart_rate']!, _maxHeartRateMeta));
    }
    if (data.containsKey('distance_meters')) {
      context.handle(
          _distanceMetersMeta,
          distanceMeters.isAcceptableOrUnknown(
              data['distance_meters']!, _distanceMetersMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      oderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oder_id'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      caloriesBurned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories_burned'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      averageHeartRate: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}average_heart_rate']),
      maxHeartRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_heart_rate']),
      distanceMeters: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}distance_meters']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id']),
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }
}

class WorkoutSession extends DataClass implements Insertable<WorkoutSession> {
  final String id;
  final String oderId;
  final String? workoutId;
  final DateTime startTime;
  final DateTime endTime;
  final int durationMinutes;
  final int caloriesBurned;
  final String category;
  final double? averageHeartRate;
  final double? maxHeartRate;
  final double? distanceMeters;
  final String source;
  final String? externalId;
  const WorkoutSession(
      {required this.id,
      required this.oderId,
      this.workoutId,
      required this.startTime,
      required this.endTime,
      required this.durationMinutes,
      required this.caloriesBurned,
      required this.category,
      this.averageHeartRate,
      this.maxHeartRate,
      this.distanceMeters,
      required this.source,
      this.externalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['oder_id'] = Variable<String>(oderId);
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<String>(workoutId);
    }
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['calories_burned'] = Variable<int>(caloriesBurned);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || averageHeartRate != null) {
      map['average_heart_rate'] = Variable<double>(averageHeartRate);
    }
    if (!nullToAbsent || maxHeartRate != null) {
      map['max_heart_rate'] = Variable<double>(maxHeartRate);
    }
    if (!nullToAbsent || distanceMeters != null) {
      map['distance_meters'] = Variable<double>(distanceMeters);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || externalId != null) {
      map['external_id'] = Variable<String>(externalId);
    }
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      oderId: Value(oderId),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      startTime: Value(startTime),
      endTime: Value(endTime),
      durationMinutes: Value(durationMinutes),
      caloriesBurned: Value(caloriesBurned),
      category: Value(category),
      averageHeartRate: averageHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(averageHeartRate),
      maxHeartRate: maxHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(maxHeartRate),
      distanceMeters: distanceMeters == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceMeters),
      source: Value(source),
      externalId: externalId == null && nullToAbsent
          ? const Value.absent()
          : Value(externalId),
    );
  }

  factory WorkoutSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSession(
      id: serializer.fromJson<String>(json['id']),
      oderId: serializer.fromJson<String>(json['oderId']),
      workoutId: serializer.fromJson<String?>(json['workoutId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      caloriesBurned: serializer.fromJson<int>(json['caloriesBurned']),
      category: serializer.fromJson<String>(json['category']),
      averageHeartRate: serializer.fromJson<double?>(json['averageHeartRate']),
      maxHeartRate: serializer.fromJson<double?>(json['maxHeartRate']),
      distanceMeters: serializer.fromJson<double?>(json['distanceMeters']),
      source: serializer.fromJson<String>(json['source']),
      externalId: serializer.fromJson<String?>(json['externalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'oderId': serializer.toJson<String>(oderId),
      'workoutId': serializer.toJson<String?>(workoutId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'caloriesBurned': serializer.toJson<int>(caloriesBurned),
      'category': serializer.toJson<String>(category),
      'averageHeartRate': serializer.toJson<double?>(averageHeartRate),
      'maxHeartRate': serializer.toJson<double?>(maxHeartRate),
      'distanceMeters': serializer.toJson<double?>(distanceMeters),
      'source': serializer.toJson<String>(source),
      'externalId': serializer.toJson<String?>(externalId),
    };
  }

  WorkoutSession copyWith(
          {String? id,
          String? oderId,
          Value<String?> workoutId = const Value.absent(),
          DateTime? startTime,
          DateTime? endTime,
          int? durationMinutes,
          int? caloriesBurned,
          String? category,
          Value<double?> averageHeartRate = const Value.absent(),
          Value<double?> maxHeartRate = const Value.absent(),
          Value<double?> distanceMeters = const Value.absent(),
          String? source,
          Value<String?> externalId = const Value.absent()}) =>
      WorkoutSession(
        id: id ?? this.id,
        oderId: oderId ?? this.oderId,
        workoutId: workoutId.present ? workoutId.value : this.workoutId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        caloriesBurned: caloriesBurned ?? this.caloriesBurned,
        category: category ?? this.category,
        averageHeartRate: averageHeartRate.present
            ? averageHeartRate.value
            : this.averageHeartRate,
        maxHeartRate:
            maxHeartRate.present ? maxHeartRate.value : this.maxHeartRate,
        distanceMeters:
            distanceMeters.present ? distanceMeters.value : this.distanceMeters,
        source: source ?? this.source,
        externalId: externalId.present ? externalId.value : this.externalId,
      );
  WorkoutSession copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSession(
      id: data.id.present ? data.id.value : this.id,
      oderId: data.oderId.present ? data.oderId.value : this.oderId,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
      category: data.category.present ? data.category.value : this.category,
      averageHeartRate: data.averageHeartRate.present
          ? data.averageHeartRate.value
          : this.averageHeartRate,
      maxHeartRate: data.maxHeartRate.present
          ? data.maxHeartRate.value
          : this.maxHeartRate,
      distanceMeters: data.distanceMeters.present
          ? data.distanceMeters.value
          : this.distanceMeters,
      source: data.source.present ? data.source.value : this.source,
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSession(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('workoutId: $workoutId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('category: $category, ')
          ..write('averageHeartRate: $averageHeartRate, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      oderId,
      workoutId,
      startTime,
      endTime,
      durationMinutes,
      caloriesBurned,
      category,
      averageHeartRate,
      maxHeartRate,
      distanceMeters,
      source,
      externalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSession &&
          other.id == this.id &&
          other.oderId == this.oderId &&
          other.workoutId == this.workoutId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.durationMinutes == this.durationMinutes &&
          other.caloriesBurned == this.caloriesBurned &&
          other.category == this.category &&
          other.averageHeartRate == this.averageHeartRate &&
          other.maxHeartRate == this.maxHeartRate &&
          other.distanceMeters == this.distanceMeters &&
          other.source == this.source &&
          other.externalId == this.externalId);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSession> {
  final Value<String> id;
  final Value<String> oderId;
  final Value<String?> workoutId;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<int> durationMinutes;
  final Value<int> caloriesBurned;
  final Value<String> category;
  final Value<double?> averageHeartRate;
  final Value<double?> maxHeartRate;
  final Value<double?> distanceMeters;
  final Value<String> source;
  final Value<String?> externalId;
  final Value<int> rowid;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.oderId = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.category = const Value.absent(),
    this.averageHeartRate = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.distanceMeters = const Value.absent(),
    this.source = const Value.absent(),
    this.externalId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    required String id,
    required String oderId,
    this.workoutId = const Value.absent(),
    required DateTime startTime,
    required DateTime endTime,
    required int durationMinutes,
    required int caloriesBurned,
    required String category,
    this.averageHeartRate = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.distanceMeters = const Value.absent(),
    required String source,
    this.externalId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        oderId = Value(oderId),
        startTime = Value(startTime),
        endTime = Value(endTime),
        durationMinutes = Value(durationMinutes),
        caloriesBurned = Value(caloriesBurned),
        category = Value(category),
        source = Value(source);
  static Insertable<WorkoutSession> custom({
    Expression<String>? id,
    Expression<String>? oderId,
    Expression<String>? workoutId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? durationMinutes,
    Expression<int>? caloriesBurned,
    Expression<String>? category,
    Expression<double>? averageHeartRate,
    Expression<double>? maxHeartRate,
    Expression<double>? distanceMeters,
    Expression<String>? source,
    Expression<String>? externalId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oderId != null) 'oder_id': oderId,
      if (workoutId != null) 'workout_id': workoutId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (category != null) 'category': category,
      if (averageHeartRate != null) 'average_heart_rate': averageHeartRate,
      if (maxHeartRate != null) 'max_heart_rate': maxHeartRate,
      if (distanceMeters != null) 'distance_meters': distanceMeters,
      if (source != null) 'source': source,
      if (externalId != null) 'external_id': externalId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? oderId,
      Value<String?>? workoutId,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime,
      Value<int>? durationMinutes,
      Value<int>? caloriesBurned,
      Value<String>? category,
      Value<double?>? averageHeartRate,
      Value<double?>? maxHeartRate,
      Value<double?>? distanceMeters,
      Value<String>? source,
      Value<String?>? externalId,
      Value<int>? rowid}) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      oderId: oderId ?? this.oderId,
      workoutId: workoutId ?? this.workoutId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      category: category ?? this.category,
      averageHeartRate: averageHeartRate ?? this.averageHeartRate,
      maxHeartRate: maxHeartRate ?? this.maxHeartRate,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      source: source ?? this.source,
      externalId: externalId ?? this.externalId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (oderId.present) {
      map['oder_id'] = Variable<String>(oderId.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<int>(caloriesBurned.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (averageHeartRate.present) {
      map['average_heart_rate'] = Variable<double>(averageHeartRate.value);
    }
    if (maxHeartRate.present) {
      map['max_heart_rate'] = Variable<double>(maxHeartRate.value);
    }
    if (distanceMeters.present) {
      map['distance_meters'] = Variable<double>(distanceMeters.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('workoutId: $workoutId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('category: $category, ')
          ..write('averageHeartRate: $averageHeartRate, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SleepSessionsTable extends SleepSessions
    with TableInfo<$SleepSessionsTable, SleepSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SleepSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oderIdMeta = const VerificationMeta('oderId');
  @override
  late final GeneratedColumn<String> oderId = GeneratedColumn<String>(
      'oder_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bedTimeMeta =
      const VerificationMeta('bedTime');
  @override
  late final GeneratedColumn<DateTime> bedTime = GeneratedColumn<DateTime>(
      'bed_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _wakeTimeMeta =
      const VerificationMeta('wakeTime');
  @override
  late final GeneratedColumn<DateTime> wakeTime = GeneratedColumn<DateTime>(
      'wake_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalMinutesMeta =
      const VerificationMeta('totalMinutes');
  @override
  late final GeneratedColumn<int> totalMinutes = GeneratedColumn<int>(
      'total_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deepSleepMinutesMeta =
      const VerificationMeta('deepSleepMinutes');
  @override
  late final GeneratedColumn<int> deepSleepMinutes = GeneratedColumn<int>(
      'deep_sleep_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lightSleepMinutesMeta =
      const VerificationMeta('lightSleepMinutes');
  @override
  late final GeneratedColumn<int> lightSleepMinutes = GeneratedColumn<int>(
      'light_sleep_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remSleepMinutesMeta =
      const VerificationMeta('remSleepMinutes');
  @override
  late final GeneratedColumn<int> remSleepMinutes = GeneratedColumn<int>(
      'rem_sleep_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _awakeMinutesMeta =
      const VerificationMeta('awakeMinutes');
  @override
  late final GeneratedColumn<int> awakeMinutes = GeneratedColumn<int>(
      'awake_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _efficiencyMeta =
      const VerificationMeta('efficiency');
  @override
  late final GeneratedColumn<double> efficiency = GeneratedColumn<double>(
      'efficiency', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _latencyMinutesMeta =
      const VerificationMeta('latencyMinutes');
  @override
  late final GeneratedColumn<int> latencyMinutes = GeneratedColumn<int>(
      'latency_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sleepScoreMeta =
      const VerificationMeta('sleepScore');
  @override
  late final GeneratedColumn<int> sleepScore = GeneratedColumn<int>(
      'sleep_score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oderId,
        bedTime,
        wakeTime,
        totalMinutes,
        deepSleepMinutes,
        lightSleepMinutes,
        remSleepMinutes,
        awakeMinutes,
        efficiency,
        latencyMinutes,
        sleepScore,
        source,
        externalId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sleep_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<SleepSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('oder_id')) {
      context.handle(_oderIdMeta,
          oderId.isAcceptableOrUnknown(data['oder_id']!, _oderIdMeta));
    } else if (isInserting) {
      context.missing(_oderIdMeta);
    }
    if (data.containsKey('bed_time')) {
      context.handle(_bedTimeMeta,
          bedTime.isAcceptableOrUnknown(data['bed_time']!, _bedTimeMeta));
    } else if (isInserting) {
      context.missing(_bedTimeMeta);
    }
    if (data.containsKey('wake_time')) {
      context.handle(_wakeTimeMeta,
          wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta));
    } else if (isInserting) {
      context.missing(_wakeTimeMeta);
    }
    if (data.containsKey('total_minutes')) {
      context.handle(
          _totalMinutesMeta,
          totalMinutes.isAcceptableOrUnknown(
              data['total_minutes']!, _totalMinutesMeta));
    } else if (isInserting) {
      context.missing(_totalMinutesMeta);
    }
    if (data.containsKey('deep_sleep_minutes')) {
      context.handle(
          _deepSleepMinutesMeta,
          deepSleepMinutes.isAcceptableOrUnknown(
              data['deep_sleep_minutes']!, _deepSleepMinutesMeta));
    } else if (isInserting) {
      context.missing(_deepSleepMinutesMeta);
    }
    if (data.containsKey('light_sleep_minutes')) {
      context.handle(
          _lightSleepMinutesMeta,
          lightSleepMinutes.isAcceptableOrUnknown(
              data['light_sleep_minutes']!, _lightSleepMinutesMeta));
    } else if (isInserting) {
      context.missing(_lightSleepMinutesMeta);
    }
    if (data.containsKey('rem_sleep_minutes')) {
      context.handle(
          _remSleepMinutesMeta,
          remSleepMinutes.isAcceptableOrUnknown(
              data['rem_sleep_minutes']!, _remSleepMinutesMeta));
    } else if (isInserting) {
      context.missing(_remSleepMinutesMeta);
    }
    if (data.containsKey('awake_minutes')) {
      context.handle(
          _awakeMinutesMeta,
          awakeMinutes.isAcceptableOrUnknown(
              data['awake_minutes']!, _awakeMinutesMeta));
    } else if (isInserting) {
      context.missing(_awakeMinutesMeta);
    }
    if (data.containsKey('efficiency')) {
      context.handle(
          _efficiencyMeta,
          efficiency.isAcceptableOrUnknown(
              data['efficiency']!, _efficiencyMeta));
    } else if (isInserting) {
      context.missing(_efficiencyMeta);
    }
    if (data.containsKey('latency_minutes')) {
      context.handle(
          _latencyMinutesMeta,
          latencyMinutes.isAcceptableOrUnknown(
              data['latency_minutes']!, _latencyMinutesMeta));
    } else if (isInserting) {
      context.missing(_latencyMinutesMeta);
    }
    if (data.containsKey('sleep_score')) {
      context.handle(
          _sleepScoreMeta,
          sleepScore.isAcceptableOrUnknown(
              data['sleep_score']!, _sleepScoreMeta));
    } else if (isInserting) {
      context.missing(_sleepScoreMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SleepSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SleepSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      oderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oder_id'])!,
      bedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}bed_time'])!,
      wakeTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}wake_time'])!,
      totalMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_minutes'])!,
      deepSleepMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}deep_sleep_minutes'])!,
      lightSleepMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}light_sleep_minutes'])!,
      remSleepMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rem_sleep_minutes'])!,
      awakeMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}awake_minutes'])!,
      efficiency: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}efficiency'])!,
      latencyMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}latency_minutes'])!,
      sleepScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_score'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id']),
    );
  }

  @override
  $SleepSessionsTable createAlias(String alias) {
    return $SleepSessionsTable(attachedDatabase, alias);
  }
}

class SleepSession extends DataClass implements Insertable<SleepSession> {
  final String id;
  final String oderId;
  final DateTime bedTime;
  final DateTime wakeTime;
  final int totalMinutes;
  final int deepSleepMinutes;
  final int lightSleepMinutes;
  final int remSleepMinutes;
  final int awakeMinutes;
  final double efficiency;
  final int latencyMinutes;
  final int sleepScore;
  final String source;
  final String? externalId;
  const SleepSession(
      {required this.id,
      required this.oderId,
      required this.bedTime,
      required this.wakeTime,
      required this.totalMinutes,
      required this.deepSleepMinutes,
      required this.lightSleepMinutes,
      required this.remSleepMinutes,
      required this.awakeMinutes,
      required this.efficiency,
      required this.latencyMinutes,
      required this.sleepScore,
      required this.source,
      this.externalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['oder_id'] = Variable<String>(oderId);
    map['bed_time'] = Variable<DateTime>(bedTime);
    map['wake_time'] = Variable<DateTime>(wakeTime);
    map['total_minutes'] = Variable<int>(totalMinutes);
    map['deep_sleep_minutes'] = Variable<int>(deepSleepMinutes);
    map['light_sleep_minutes'] = Variable<int>(lightSleepMinutes);
    map['rem_sleep_minutes'] = Variable<int>(remSleepMinutes);
    map['awake_minutes'] = Variable<int>(awakeMinutes);
    map['efficiency'] = Variable<double>(efficiency);
    map['latency_minutes'] = Variable<int>(latencyMinutes);
    map['sleep_score'] = Variable<int>(sleepScore);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || externalId != null) {
      map['external_id'] = Variable<String>(externalId);
    }
    return map;
  }

  SleepSessionsCompanion toCompanion(bool nullToAbsent) {
    return SleepSessionsCompanion(
      id: Value(id),
      oderId: Value(oderId),
      bedTime: Value(bedTime),
      wakeTime: Value(wakeTime),
      totalMinutes: Value(totalMinutes),
      deepSleepMinutes: Value(deepSleepMinutes),
      lightSleepMinutes: Value(lightSleepMinutes),
      remSleepMinutes: Value(remSleepMinutes),
      awakeMinutes: Value(awakeMinutes),
      efficiency: Value(efficiency),
      latencyMinutes: Value(latencyMinutes),
      sleepScore: Value(sleepScore),
      source: Value(source),
      externalId: externalId == null && nullToAbsent
          ? const Value.absent()
          : Value(externalId),
    );
  }

  factory SleepSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SleepSession(
      id: serializer.fromJson<String>(json['id']),
      oderId: serializer.fromJson<String>(json['oderId']),
      bedTime: serializer.fromJson<DateTime>(json['bedTime']),
      wakeTime: serializer.fromJson<DateTime>(json['wakeTime']),
      totalMinutes: serializer.fromJson<int>(json['totalMinutes']),
      deepSleepMinutes: serializer.fromJson<int>(json['deepSleepMinutes']),
      lightSleepMinutes: serializer.fromJson<int>(json['lightSleepMinutes']),
      remSleepMinutes: serializer.fromJson<int>(json['remSleepMinutes']),
      awakeMinutes: serializer.fromJson<int>(json['awakeMinutes']),
      efficiency: serializer.fromJson<double>(json['efficiency']),
      latencyMinutes: serializer.fromJson<int>(json['latencyMinutes']),
      sleepScore: serializer.fromJson<int>(json['sleepScore']),
      source: serializer.fromJson<String>(json['source']),
      externalId: serializer.fromJson<String?>(json['externalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'oderId': serializer.toJson<String>(oderId),
      'bedTime': serializer.toJson<DateTime>(bedTime),
      'wakeTime': serializer.toJson<DateTime>(wakeTime),
      'totalMinutes': serializer.toJson<int>(totalMinutes),
      'deepSleepMinutes': serializer.toJson<int>(deepSleepMinutes),
      'lightSleepMinutes': serializer.toJson<int>(lightSleepMinutes),
      'remSleepMinutes': serializer.toJson<int>(remSleepMinutes),
      'awakeMinutes': serializer.toJson<int>(awakeMinutes),
      'efficiency': serializer.toJson<double>(efficiency),
      'latencyMinutes': serializer.toJson<int>(latencyMinutes),
      'sleepScore': serializer.toJson<int>(sleepScore),
      'source': serializer.toJson<String>(source),
      'externalId': serializer.toJson<String?>(externalId),
    };
  }

  SleepSession copyWith(
          {String? id,
          String? oderId,
          DateTime? bedTime,
          DateTime? wakeTime,
          int? totalMinutes,
          int? deepSleepMinutes,
          int? lightSleepMinutes,
          int? remSleepMinutes,
          int? awakeMinutes,
          double? efficiency,
          int? latencyMinutes,
          int? sleepScore,
          String? source,
          Value<String?> externalId = const Value.absent()}) =>
      SleepSession(
        id: id ?? this.id,
        oderId: oderId ?? this.oderId,
        bedTime: bedTime ?? this.bedTime,
        wakeTime: wakeTime ?? this.wakeTime,
        totalMinutes: totalMinutes ?? this.totalMinutes,
        deepSleepMinutes: deepSleepMinutes ?? this.deepSleepMinutes,
        lightSleepMinutes: lightSleepMinutes ?? this.lightSleepMinutes,
        remSleepMinutes: remSleepMinutes ?? this.remSleepMinutes,
        awakeMinutes: awakeMinutes ?? this.awakeMinutes,
        efficiency: efficiency ?? this.efficiency,
        latencyMinutes: latencyMinutes ?? this.latencyMinutes,
        sleepScore: sleepScore ?? this.sleepScore,
        source: source ?? this.source,
        externalId: externalId.present ? externalId.value : this.externalId,
      );
  SleepSession copyWithCompanion(SleepSessionsCompanion data) {
    return SleepSession(
      id: data.id.present ? data.id.value : this.id,
      oderId: data.oderId.present ? data.oderId.value : this.oderId,
      bedTime: data.bedTime.present ? data.bedTime.value : this.bedTime,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      totalMinutes: data.totalMinutes.present
          ? data.totalMinutes.value
          : this.totalMinutes,
      deepSleepMinutes: data.deepSleepMinutes.present
          ? data.deepSleepMinutes.value
          : this.deepSleepMinutes,
      lightSleepMinutes: data.lightSleepMinutes.present
          ? data.lightSleepMinutes.value
          : this.lightSleepMinutes,
      remSleepMinutes: data.remSleepMinutes.present
          ? data.remSleepMinutes.value
          : this.remSleepMinutes,
      awakeMinutes: data.awakeMinutes.present
          ? data.awakeMinutes.value
          : this.awakeMinutes,
      efficiency:
          data.efficiency.present ? data.efficiency.value : this.efficiency,
      latencyMinutes: data.latencyMinutes.present
          ? data.latencyMinutes.value
          : this.latencyMinutes,
      sleepScore:
          data.sleepScore.present ? data.sleepScore.value : this.sleepScore,
      source: data.source.present ? data.source.value : this.source,
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SleepSession(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('bedTime: $bedTime, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('deepSleepMinutes: $deepSleepMinutes, ')
          ..write('lightSleepMinutes: $lightSleepMinutes, ')
          ..write('remSleepMinutes: $remSleepMinutes, ')
          ..write('awakeMinutes: $awakeMinutes, ')
          ..write('efficiency: $efficiency, ')
          ..write('latencyMinutes: $latencyMinutes, ')
          ..write('sleepScore: $sleepScore, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      oderId,
      bedTime,
      wakeTime,
      totalMinutes,
      deepSleepMinutes,
      lightSleepMinutes,
      remSleepMinutes,
      awakeMinutes,
      efficiency,
      latencyMinutes,
      sleepScore,
      source,
      externalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SleepSession &&
          other.id == this.id &&
          other.oderId == this.oderId &&
          other.bedTime == this.bedTime &&
          other.wakeTime == this.wakeTime &&
          other.totalMinutes == this.totalMinutes &&
          other.deepSleepMinutes == this.deepSleepMinutes &&
          other.lightSleepMinutes == this.lightSleepMinutes &&
          other.remSleepMinutes == this.remSleepMinutes &&
          other.awakeMinutes == this.awakeMinutes &&
          other.efficiency == this.efficiency &&
          other.latencyMinutes == this.latencyMinutes &&
          other.sleepScore == this.sleepScore &&
          other.source == this.source &&
          other.externalId == this.externalId);
}

class SleepSessionsCompanion extends UpdateCompanion<SleepSession> {
  final Value<String> id;
  final Value<String> oderId;
  final Value<DateTime> bedTime;
  final Value<DateTime> wakeTime;
  final Value<int> totalMinutes;
  final Value<int> deepSleepMinutes;
  final Value<int> lightSleepMinutes;
  final Value<int> remSleepMinutes;
  final Value<int> awakeMinutes;
  final Value<double> efficiency;
  final Value<int> latencyMinutes;
  final Value<int> sleepScore;
  final Value<String> source;
  final Value<String?> externalId;
  final Value<int> rowid;
  const SleepSessionsCompanion({
    this.id = const Value.absent(),
    this.oderId = const Value.absent(),
    this.bedTime = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.totalMinutes = const Value.absent(),
    this.deepSleepMinutes = const Value.absent(),
    this.lightSleepMinutes = const Value.absent(),
    this.remSleepMinutes = const Value.absent(),
    this.awakeMinutes = const Value.absent(),
    this.efficiency = const Value.absent(),
    this.latencyMinutes = const Value.absent(),
    this.sleepScore = const Value.absent(),
    this.source = const Value.absent(),
    this.externalId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SleepSessionsCompanion.insert({
    required String id,
    required String oderId,
    required DateTime bedTime,
    required DateTime wakeTime,
    required int totalMinutes,
    required int deepSleepMinutes,
    required int lightSleepMinutes,
    required int remSleepMinutes,
    required int awakeMinutes,
    required double efficiency,
    required int latencyMinutes,
    required int sleepScore,
    required String source,
    this.externalId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        oderId = Value(oderId),
        bedTime = Value(bedTime),
        wakeTime = Value(wakeTime),
        totalMinutes = Value(totalMinutes),
        deepSleepMinutes = Value(deepSleepMinutes),
        lightSleepMinutes = Value(lightSleepMinutes),
        remSleepMinutes = Value(remSleepMinutes),
        awakeMinutes = Value(awakeMinutes),
        efficiency = Value(efficiency),
        latencyMinutes = Value(latencyMinutes),
        sleepScore = Value(sleepScore),
        source = Value(source);
  static Insertable<SleepSession> custom({
    Expression<String>? id,
    Expression<String>? oderId,
    Expression<DateTime>? bedTime,
    Expression<DateTime>? wakeTime,
    Expression<int>? totalMinutes,
    Expression<int>? deepSleepMinutes,
    Expression<int>? lightSleepMinutes,
    Expression<int>? remSleepMinutes,
    Expression<int>? awakeMinutes,
    Expression<double>? efficiency,
    Expression<int>? latencyMinutes,
    Expression<int>? sleepScore,
    Expression<String>? source,
    Expression<String>? externalId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oderId != null) 'oder_id': oderId,
      if (bedTime != null) 'bed_time': bedTime,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (totalMinutes != null) 'total_minutes': totalMinutes,
      if (deepSleepMinutes != null) 'deep_sleep_minutes': deepSleepMinutes,
      if (lightSleepMinutes != null) 'light_sleep_minutes': lightSleepMinutes,
      if (remSleepMinutes != null) 'rem_sleep_minutes': remSleepMinutes,
      if (awakeMinutes != null) 'awake_minutes': awakeMinutes,
      if (efficiency != null) 'efficiency': efficiency,
      if (latencyMinutes != null) 'latency_minutes': latencyMinutes,
      if (sleepScore != null) 'sleep_score': sleepScore,
      if (source != null) 'source': source,
      if (externalId != null) 'external_id': externalId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SleepSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? oderId,
      Value<DateTime>? bedTime,
      Value<DateTime>? wakeTime,
      Value<int>? totalMinutes,
      Value<int>? deepSleepMinutes,
      Value<int>? lightSleepMinutes,
      Value<int>? remSleepMinutes,
      Value<int>? awakeMinutes,
      Value<double>? efficiency,
      Value<int>? latencyMinutes,
      Value<int>? sleepScore,
      Value<String>? source,
      Value<String?>? externalId,
      Value<int>? rowid}) {
    return SleepSessionsCompanion(
      id: id ?? this.id,
      oderId: oderId ?? this.oderId,
      bedTime: bedTime ?? this.bedTime,
      wakeTime: wakeTime ?? this.wakeTime,
      totalMinutes: totalMinutes ?? this.totalMinutes,
      deepSleepMinutes: deepSleepMinutes ?? this.deepSleepMinutes,
      lightSleepMinutes: lightSleepMinutes ?? this.lightSleepMinutes,
      remSleepMinutes: remSleepMinutes ?? this.remSleepMinutes,
      awakeMinutes: awakeMinutes ?? this.awakeMinutes,
      efficiency: efficiency ?? this.efficiency,
      latencyMinutes: latencyMinutes ?? this.latencyMinutes,
      sleepScore: sleepScore ?? this.sleepScore,
      source: source ?? this.source,
      externalId: externalId ?? this.externalId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (oderId.present) {
      map['oder_id'] = Variable<String>(oderId.value);
    }
    if (bedTime.present) {
      map['bed_time'] = Variable<DateTime>(bedTime.value);
    }
    if (wakeTime.present) {
      map['wake_time'] = Variable<DateTime>(wakeTime.value);
    }
    if (totalMinutes.present) {
      map['total_minutes'] = Variable<int>(totalMinutes.value);
    }
    if (deepSleepMinutes.present) {
      map['deep_sleep_minutes'] = Variable<int>(deepSleepMinutes.value);
    }
    if (lightSleepMinutes.present) {
      map['light_sleep_minutes'] = Variable<int>(lightSleepMinutes.value);
    }
    if (remSleepMinutes.present) {
      map['rem_sleep_minutes'] = Variable<int>(remSleepMinutes.value);
    }
    if (awakeMinutes.present) {
      map['awake_minutes'] = Variable<int>(awakeMinutes.value);
    }
    if (efficiency.present) {
      map['efficiency'] = Variable<double>(efficiency.value);
    }
    if (latencyMinutes.present) {
      map['latency_minutes'] = Variable<int>(latencyMinutes.value);
    }
    if (sleepScore.present) {
      map['sleep_score'] = Variable<int>(sleepScore.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SleepSessionsCompanion(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('bedTime: $bedTime, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('deepSleepMinutes: $deepSleepMinutes, ')
          ..write('lightSleepMinutes: $lightSleepMinutes, ')
          ..write('remSleepMinutes: $remSleepMinutes, ')
          ..write('awakeMinutes: $awakeMinutes, ')
          ..write('efficiency: $efficiency, ')
          ..write('latencyMinutes: $latencyMinutes, ')
          ..write('sleepScore: $sleepScore, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SleepHabitLogsTable extends SleepHabitLogs
    with TableInfo<$SleepHabitLogsTable, SleepHabitLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SleepHabitLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oderIdMeta = const VerificationMeta('oderId');
  @override
  late final GeneratedColumn<String> oderId = GeneratedColumn<String>(
      'oder_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noCaffeineAfterCutoffMeta =
      const VerificationMeta('noCaffeineAfterCutoff');
  @override
  late final GeneratedColumn<bool> noCaffeineAfterCutoff =
      GeneratedColumn<bool>('no_caffeine_after_cutoff', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("no_caffeine_after_cutoff" IN (0, 1))'));
  static const VerificationMeta _lastMealOnTimeMeta =
      const VerificationMeta('lastMealOnTime');
  @override
  late final GeneratedColumn<bool> lastMealOnTime = GeneratedColumn<bool>(
      'last_meal_on_time', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("last_meal_on_time" IN (0, 1))'));
  static const VerificationMeta _screenFreeBeforeBedMeta =
      const VerificationMeta('screenFreeBeforeBed');
  @override
  late final GeneratedColumn<bool> screenFreeBeforeBed = GeneratedColumn<bool>(
      'screen_free_before_bed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("screen_free_before_bed" IN (0, 1))'));
  static const VerificationMeta _roomTempOptimalMeta =
      const VerificationMeta('roomTempOptimal');
  @override
  late final GeneratedColumn<bool> roomTempOptimal = GeneratedColumn<bool>(
      'room_temp_optimal', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("room_temp_optimal" IN (0, 1))'));
  static const VerificationMeta _meditationCompletedMeta =
      const VerificationMeta('meditationCompleted');
  @override
  late final GeneratedColumn<bool> meditationCompleted = GeneratedColumn<bool>(
      'meditation_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("meditation_completed" IN (0, 1))'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oderId,
        date,
        noCaffeineAfterCutoff,
        lastMealOnTime,
        screenFreeBeforeBed,
        roomTempOptimal,
        meditationCompleted,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sleep_habit_logs';
  @override
  VerificationContext validateIntegrity(Insertable<SleepHabitLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('oder_id')) {
      context.handle(_oderIdMeta,
          oderId.isAcceptableOrUnknown(data['oder_id']!, _oderIdMeta));
    } else if (isInserting) {
      context.missing(_oderIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('no_caffeine_after_cutoff')) {
      context.handle(
          _noCaffeineAfterCutoffMeta,
          noCaffeineAfterCutoff.isAcceptableOrUnknown(
              data['no_caffeine_after_cutoff']!, _noCaffeineAfterCutoffMeta));
    } else if (isInserting) {
      context.missing(_noCaffeineAfterCutoffMeta);
    }
    if (data.containsKey('last_meal_on_time')) {
      context.handle(
          _lastMealOnTimeMeta,
          lastMealOnTime.isAcceptableOrUnknown(
              data['last_meal_on_time']!, _lastMealOnTimeMeta));
    } else if (isInserting) {
      context.missing(_lastMealOnTimeMeta);
    }
    if (data.containsKey('screen_free_before_bed')) {
      context.handle(
          _screenFreeBeforeBedMeta,
          screenFreeBeforeBed.isAcceptableOrUnknown(
              data['screen_free_before_bed']!, _screenFreeBeforeBedMeta));
    } else if (isInserting) {
      context.missing(_screenFreeBeforeBedMeta);
    }
    if (data.containsKey('room_temp_optimal')) {
      context.handle(
          _roomTempOptimalMeta,
          roomTempOptimal.isAcceptableOrUnknown(
              data['room_temp_optimal']!, _roomTempOptimalMeta));
    } else if (isInserting) {
      context.missing(_roomTempOptimalMeta);
    }
    if (data.containsKey('meditation_completed')) {
      context.handle(
          _meditationCompletedMeta,
          meditationCompleted.isAcceptableOrUnknown(
              data['meditation_completed']!, _meditationCompletedMeta));
    } else if (isInserting) {
      context.missing(_meditationCompletedMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SleepHabitLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SleepHabitLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      oderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oder_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      noCaffeineAfterCutoff: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}no_caffeine_after_cutoff'])!,
      lastMealOnTime: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}last_meal_on_time'])!,
      screenFreeBeforeBed: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}screen_free_before_bed'])!,
      roomTempOptimal: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}room_temp_optimal'])!,
      meditationCompleted: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}meditation_completed'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $SleepHabitLogsTable createAlias(String alias) {
    return $SleepHabitLogsTable(attachedDatabase, alias);
  }
}

class SleepHabitLog extends DataClass implements Insertable<SleepHabitLog> {
  final String id;
  final String oderId;
  final DateTime date;
  final bool noCaffeineAfterCutoff;
  final bool lastMealOnTime;
  final bool screenFreeBeforeBed;
  final bool roomTempOptimal;
  final bool meditationCompleted;
  final String? notes;
  const SleepHabitLog(
      {required this.id,
      required this.oderId,
      required this.date,
      required this.noCaffeineAfterCutoff,
      required this.lastMealOnTime,
      required this.screenFreeBeforeBed,
      required this.roomTempOptimal,
      required this.meditationCompleted,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['oder_id'] = Variable<String>(oderId);
    map['date'] = Variable<DateTime>(date);
    map['no_caffeine_after_cutoff'] = Variable<bool>(noCaffeineAfterCutoff);
    map['last_meal_on_time'] = Variable<bool>(lastMealOnTime);
    map['screen_free_before_bed'] = Variable<bool>(screenFreeBeforeBed);
    map['room_temp_optimal'] = Variable<bool>(roomTempOptimal);
    map['meditation_completed'] = Variable<bool>(meditationCompleted);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SleepHabitLogsCompanion toCompanion(bool nullToAbsent) {
    return SleepHabitLogsCompanion(
      id: Value(id),
      oderId: Value(oderId),
      date: Value(date),
      noCaffeineAfterCutoff: Value(noCaffeineAfterCutoff),
      lastMealOnTime: Value(lastMealOnTime),
      screenFreeBeforeBed: Value(screenFreeBeforeBed),
      roomTempOptimal: Value(roomTempOptimal),
      meditationCompleted: Value(meditationCompleted),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory SleepHabitLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SleepHabitLog(
      id: serializer.fromJson<String>(json['id']),
      oderId: serializer.fromJson<String>(json['oderId']),
      date: serializer.fromJson<DateTime>(json['date']),
      noCaffeineAfterCutoff:
          serializer.fromJson<bool>(json['noCaffeineAfterCutoff']),
      lastMealOnTime: serializer.fromJson<bool>(json['lastMealOnTime']),
      screenFreeBeforeBed:
          serializer.fromJson<bool>(json['screenFreeBeforeBed']),
      roomTempOptimal: serializer.fromJson<bool>(json['roomTempOptimal']),
      meditationCompleted:
          serializer.fromJson<bool>(json['meditationCompleted']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'oderId': serializer.toJson<String>(oderId),
      'date': serializer.toJson<DateTime>(date),
      'noCaffeineAfterCutoff': serializer.toJson<bool>(noCaffeineAfterCutoff),
      'lastMealOnTime': serializer.toJson<bool>(lastMealOnTime),
      'screenFreeBeforeBed': serializer.toJson<bool>(screenFreeBeforeBed),
      'roomTempOptimal': serializer.toJson<bool>(roomTempOptimal),
      'meditationCompleted': serializer.toJson<bool>(meditationCompleted),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SleepHabitLog copyWith(
          {String? id,
          String? oderId,
          DateTime? date,
          bool? noCaffeineAfterCutoff,
          bool? lastMealOnTime,
          bool? screenFreeBeforeBed,
          bool? roomTempOptimal,
          bool? meditationCompleted,
          Value<String?> notes = const Value.absent()}) =>
      SleepHabitLog(
        id: id ?? this.id,
        oderId: oderId ?? this.oderId,
        date: date ?? this.date,
        noCaffeineAfterCutoff:
            noCaffeineAfterCutoff ?? this.noCaffeineAfterCutoff,
        lastMealOnTime: lastMealOnTime ?? this.lastMealOnTime,
        screenFreeBeforeBed: screenFreeBeforeBed ?? this.screenFreeBeforeBed,
        roomTempOptimal: roomTempOptimal ?? this.roomTempOptimal,
        meditationCompleted: meditationCompleted ?? this.meditationCompleted,
        notes: notes.present ? notes.value : this.notes,
      );
  SleepHabitLog copyWithCompanion(SleepHabitLogsCompanion data) {
    return SleepHabitLog(
      id: data.id.present ? data.id.value : this.id,
      oderId: data.oderId.present ? data.oderId.value : this.oderId,
      date: data.date.present ? data.date.value : this.date,
      noCaffeineAfterCutoff: data.noCaffeineAfterCutoff.present
          ? data.noCaffeineAfterCutoff.value
          : this.noCaffeineAfterCutoff,
      lastMealOnTime: data.lastMealOnTime.present
          ? data.lastMealOnTime.value
          : this.lastMealOnTime,
      screenFreeBeforeBed: data.screenFreeBeforeBed.present
          ? data.screenFreeBeforeBed.value
          : this.screenFreeBeforeBed,
      roomTempOptimal: data.roomTempOptimal.present
          ? data.roomTempOptimal.value
          : this.roomTempOptimal,
      meditationCompleted: data.meditationCompleted.present
          ? data.meditationCompleted.value
          : this.meditationCompleted,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SleepHabitLog(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('date: $date, ')
          ..write('noCaffeineAfterCutoff: $noCaffeineAfterCutoff, ')
          ..write('lastMealOnTime: $lastMealOnTime, ')
          ..write('screenFreeBeforeBed: $screenFreeBeforeBed, ')
          ..write('roomTempOptimal: $roomTempOptimal, ')
          ..write('meditationCompleted: $meditationCompleted, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      oderId,
      date,
      noCaffeineAfterCutoff,
      lastMealOnTime,
      screenFreeBeforeBed,
      roomTempOptimal,
      meditationCompleted,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SleepHabitLog &&
          other.id == this.id &&
          other.oderId == this.oderId &&
          other.date == this.date &&
          other.noCaffeineAfterCutoff == this.noCaffeineAfterCutoff &&
          other.lastMealOnTime == this.lastMealOnTime &&
          other.screenFreeBeforeBed == this.screenFreeBeforeBed &&
          other.roomTempOptimal == this.roomTempOptimal &&
          other.meditationCompleted == this.meditationCompleted &&
          other.notes == this.notes);
}

class SleepHabitLogsCompanion extends UpdateCompanion<SleepHabitLog> {
  final Value<String> id;
  final Value<String> oderId;
  final Value<DateTime> date;
  final Value<bool> noCaffeineAfterCutoff;
  final Value<bool> lastMealOnTime;
  final Value<bool> screenFreeBeforeBed;
  final Value<bool> roomTempOptimal;
  final Value<bool> meditationCompleted;
  final Value<String?> notes;
  final Value<int> rowid;
  const SleepHabitLogsCompanion({
    this.id = const Value.absent(),
    this.oderId = const Value.absent(),
    this.date = const Value.absent(),
    this.noCaffeineAfterCutoff = const Value.absent(),
    this.lastMealOnTime = const Value.absent(),
    this.screenFreeBeforeBed = const Value.absent(),
    this.roomTempOptimal = const Value.absent(),
    this.meditationCompleted = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SleepHabitLogsCompanion.insert({
    required String id,
    required String oderId,
    required DateTime date,
    required bool noCaffeineAfterCutoff,
    required bool lastMealOnTime,
    required bool screenFreeBeforeBed,
    required bool roomTempOptimal,
    required bool meditationCompleted,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        oderId = Value(oderId),
        date = Value(date),
        noCaffeineAfterCutoff = Value(noCaffeineAfterCutoff),
        lastMealOnTime = Value(lastMealOnTime),
        screenFreeBeforeBed = Value(screenFreeBeforeBed),
        roomTempOptimal = Value(roomTempOptimal),
        meditationCompleted = Value(meditationCompleted);
  static Insertable<SleepHabitLog> custom({
    Expression<String>? id,
    Expression<String>? oderId,
    Expression<DateTime>? date,
    Expression<bool>? noCaffeineAfterCutoff,
    Expression<bool>? lastMealOnTime,
    Expression<bool>? screenFreeBeforeBed,
    Expression<bool>? roomTempOptimal,
    Expression<bool>? meditationCompleted,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oderId != null) 'oder_id': oderId,
      if (date != null) 'date': date,
      if (noCaffeineAfterCutoff != null)
        'no_caffeine_after_cutoff': noCaffeineAfterCutoff,
      if (lastMealOnTime != null) 'last_meal_on_time': lastMealOnTime,
      if (screenFreeBeforeBed != null)
        'screen_free_before_bed': screenFreeBeforeBed,
      if (roomTempOptimal != null) 'room_temp_optimal': roomTempOptimal,
      if (meditationCompleted != null)
        'meditation_completed': meditationCompleted,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SleepHabitLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? oderId,
      Value<DateTime>? date,
      Value<bool>? noCaffeineAfterCutoff,
      Value<bool>? lastMealOnTime,
      Value<bool>? screenFreeBeforeBed,
      Value<bool>? roomTempOptimal,
      Value<bool>? meditationCompleted,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return SleepHabitLogsCompanion(
      id: id ?? this.id,
      oderId: oderId ?? this.oderId,
      date: date ?? this.date,
      noCaffeineAfterCutoff:
          noCaffeineAfterCutoff ?? this.noCaffeineAfterCutoff,
      lastMealOnTime: lastMealOnTime ?? this.lastMealOnTime,
      screenFreeBeforeBed: screenFreeBeforeBed ?? this.screenFreeBeforeBed,
      roomTempOptimal: roomTempOptimal ?? this.roomTempOptimal,
      meditationCompleted: meditationCompleted ?? this.meditationCompleted,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (oderId.present) {
      map['oder_id'] = Variable<String>(oderId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (noCaffeineAfterCutoff.present) {
      map['no_caffeine_after_cutoff'] =
          Variable<bool>(noCaffeineAfterCutoff.value);
    }
    if (lastMealOnTime.present) {
      map['last_meal_on_time'] = Variable<bool>(lastMealOnTime.value);
    }
    if (screenFreeBeforeBed.present) {
      map['screen_free_before_bed'] = Variable<bool>(screenFreeBeforeBed.value);
    }
    if (roomTempOptimal.present) {
      map['room_temp_optimal'] = Variable<bool>(roomTempOptimal.value);
    }
    if (meditationCompleted.present) {
      map['meditation_completed'] = Variable<bool>(meditationCompleted.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SleepHabitLogsCompanion(')
          ..write('id: $id, ')
          ..write('oderId: $oderId, ')
          ..write('date: $date, ')
          ..write('noCaffeineAfterCutoff: $noCaffeineAfterCutoff, ')
          ..write('lastMealOnTime: $lastMealOnTime, ')
          ..write('screenFreeBeforeBed: $screenFreeBeforeBed, ')
          ..write('roomTempOptimal: $roomTempOptimal, ')
          ..write('meditationCompleted: $meditationCompleted, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyProgressEntriesTable extends DailyProgressEntries
    with TableInfo<$DailyProgressEntriesTable, DailyProgressEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyProgressEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _caloriesConsumedMeta =
      const VerificationMeta('caloriesConsumed');
  @override
  late final GeneratedColumn<int> caloriesConsumed = GeneratedColumn<int>(
      'calories_consumed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _caloriesBurnedMeta =
      const VerificationMeta('caloriesBurned');
  @override
  late final GeneratedColumn<int> caloriesBurned = GeneratedColumn<int>(
      'calories_burned', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _exerciseMinutesMeta =
      const VerificationMeta('exerciseMinutes');
  @override
  late final GeneratedColumn<int> exerciseMinutes = GeneratedColumn<int>(
      'exercise_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sleepMinutesMeta =
      const VerificationMeta('sleepMinutes');
  @override
  late final GeneratedColumn<int> sleepMinutes = GeneratedColumn<int>(
      'sleep_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _proteinGramsMeta =
      const VerificationMeta('proteinGrams');
  @override
  late final GeneratedColumn<double> proteinGrams = GeneratedColumn<double>(
      'protein_grams', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carbsGramsMeta =
      const VerificationMeta('carbsGrams');
  @override
  late final GeneratedColumn<double> carbsGrams = GeneratedColumn<double>(
      'carbs_grams', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fatGramsMeta =
      const VerificationMeta('fatGrams');
  @override
  late final GeneratedColumn<double> fatGrams = GeneratedColumn<double>(
      'fat_grams', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _stepsCountMeta =
      const VerificationMeta('stepsCount');
  @override
  late final GeneratedColumn<int> stepsCount = GeneratedColumn<int>(
      'steps_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        caloriesConsumed,
        caloriesBurned,
        exerciseMinutes,
        sleepMinutes,
        proteinGrams,
        carbsGrams,
        fatGrams,
        stepsCount,
        weightKg
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_progress_entries';
  @override
  VerificationContext validateIntegrity(Insertable<DailyProgressEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('calories_consumed')) {
      context.handle(
          _caloriesConsumedMeta,
          caloriesConsumed.isAcceptableOrUnknown(
              data['calories_consumed']!, _caloriesConsumedMeta));
    } else if (isInserting) {
      context.missing(_caloriesConsumedMeta);
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
          _caloriesBurnedMeta,
          caloriesBurned.isAcceptableOrUnknown(
              data['calories_burned']!, _caloriesBurnedMeta));
    } else if (isInserting) {
      context.missing(_caloriesBurnedMeta);
    }
    if (data.containsKey('exercise_minutes')) {
      context.handle(
          _exerciseMinutesMeta,
          exerciseMinutes.isAcceptableOrUnknown(
              data['exercise_minutes']!, _exerciseMinutesMeta));
    } else if (isInserting) {
      context.missing(_exerciseMinutesMeta);
    }
    if (data.containsKey('sleep_minutes')) {
      context.handle(
          _sleepMinutesMeta,
          sleepMinutes.isAcceptableOrUnknown(
              data['sleep_minutes']!, _sleepMinutesMeta));
    } else if (isInserting) {
      context.missing(_sleepMinutesMeta);
    }
    if (data.containsKey('protein_grams')) {
      context.handle(
          _proteinGramsMeta,
          proteinGrams.isAcceptableOrUnknown(
              data['protein_grams']!, _proteinGramsMeta));
    } else if (isInserting) {
      context.missing(_proteinGramsMeta);
    }
    if (data.containsKey('carbs_grams')) {
      context.handle(
          _carbsGramsMeta,
          carbsGrams.isAcceptableOrUnknown(
              data['carbs_grams']!, _carbsGramsMeta));
    } else if (isInserting) {
      context.missing(_carbsGramsMeta);
    }
    if (data.containsKey('fat_grams')) {
      context.handle(_fatGramsMeta,
          fatGrams.isAcceptableOrUnknown(data['fat_grams']!, _fatGramsMeta));
    } else if (isInserting) {
      context.missing(_fatGramsMeta);
    }
    if (data.containsKey('steps_count')) {
      context.handle(
          _stepsCountMeta,
          stepsCount.isAcceptableOrUnknown(
              data['steps_count']!, _stepsCountMeta));
    } else if (isInserting) {
      context.missing(_stepsCountMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyProgressEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyProgressEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      caloriesConsumed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories_consumed'])!,
      caloriesBurned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories_burned'])!,
      exerciseMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_minutes'])!,
      sleepMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_minutes'])!,
      proteinGrams: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein_grams'])!,
      carbsGrams: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs_grams'])!,
      fatGrams: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat_grams'])!,
      stepsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}steps_count'])!,
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg']),
    );
  }

  @override
  $DailyProgressEntriesTable createAlias(String alias) {
    return $DailyProgressEntriesTable(attachedDatabase, alias);
  }
}

class DailyProgressEntry extends DataClass
    implements Insertable<DailyProgressEntry> {
  final String id;
  final DateTime date;
  final int caloriesConsumed;
  final int caloriesBurned;
  final int exerciseMinutes;
  final int sleepMinutes;
  final double proteinGrams;
  final double carbsGrams;
  final double fatGrams;
  final int stepsCount;
  final double? weightKg;
  const DailyProgressEntry(
      {required this.id,
      required this.date,
      required this.caloriesConsumed,
      required this.caloriesBurned,
      required this.exerciseMinutes,
      required this.sleepMinutes,
      required this.proteinGrams,
      required this.carbsGrams,
      required this.fatGrams,
      required this.stepsCount,
      this.weightKg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['calories_consumed'] = Variable<int>(caloriesConsumed);
    map['calories_burned'] = Variable<int>(caloriesBurned);
    map['exercise_minutes'] = Variable<int>(exerciseMinutes);
    map['sleep_minutes'] = Variable<int>(sleepMinutes);
    map['protein_grams'] = Variable<double>(proteinGrams);
    map['carbs_grams'] = Variable<double>(carbsGrams);
    map['fat_grams'] = Variable<double>(fatGrams);
    map['steps_count'] = Variable<int>(stepsCount);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    return map;
  }

  DailyProgressEntriesCompanion toCompanion(bool nullToAbsent) {
    return DailyProgressEntriesCompanion(
      id: Value(id),
      date: Value(date),
      caloriesConsumed: Value(caloriesConsumed),
      caloriesBurned: Value(caloriesBurned),
      exerciseMinutes: Value(exerciseMinutes),
      sleepMinutes: Value(sleepMinutes),
      proteinGrams: Value(proteinGrams),
      carbsGrams: Value(carbsGrams),
      fatGrams: Value(fatGrams),
      stepsCount: Value(stepsCount),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
    );
  }

  factory DailyProgressEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyProgressEntry(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      caloriesConsumed: serializer.fromJson<int>(json['caloriesConsumed']),
      caloriesBurned: serializer.fromJson<int>(json['caloriesBurned']),
      exerciseMinutes: serializer.fromJson<int>(json['exerciseMinutes']),
      sleepMinutes: serializer.fromJson<int>(json['sleepMinutes']),
      proteinGrams: serializer.fromJson<double>(json['proteinGrams']),
      carbsGrams: serializer.fromJson<double>(json['carbsGrams']),
      fatGrams: serializer.fromJson<double>(json['fatGrams']),
      stepsCount: serializer.fromJson<int>(json['stepsCount']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'caloriesConsumed': serializer.toJson<int>(caloriesConsumed),
      'caloriesBurned': serializer.toJson<int>(caloriesBurned),
      'exerciseMinutes': serializer.toJson<int>(exerciseMinutes),
      'sleepMinutes': serializer.toJson<int>(sleepMinutes),
      'proteinGrams': serializer.toJson<double>(proteinGrams),
      'carbsGrams': serializer.toJson<double>(carbsGrams),
      'fatGrams': serializer.toJson<double>(fatGrams),
      'stepsCount': serializer.toJson<int>(stepsCount),
      'weightKg': serializer.toJson<double?>(weightKg),
    };
  }

  DailyProgressEntry copyWith(
          {String? id,
          DateTime? date,
          int? caloriesConsumed,
          int? caloriesBurned,
          int? exerciseMinutes,
          int? sleepMinutes,
          double? proteinGrams,
          double? carbsGrams,
          double? fatGrams,
          int? stepsCount,
          Value<double?> weightKg = const Value.absent()}) =>
      DailyProgressEntry(
        id: id ?? this.id,
        date: date ?? this.date,
        caloriesConsumed: caloriesConsumed ?? this.caloriesConsumed,
        caloriesBurned: caloriesBurned ?? this.caloriesBurned,
        exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
        sleepMinutes: sleepMinutes ?? this.sleepMinutes,
        proteinGrams: proteinGrams ?? this.proteinGrams,
        carbsGrams: carbsGrams ?? this.carbsGrams,
        fatGrams: fatGrams ?? this.fatGrams,
        stepsCount: stepsCount ?? this.stepsCount,
        weightKg: weightKg.present ? weightKg.value : this.weightKg,
      );
  DailyProgressEntry copyWithCompanion(DailyProgressEntriesCompanion data) {
    return DailyProgressEntry(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      caloriesConsumed: data.caloriesConsumed.present
          ? data.caloriesConsumed.value
          : this.caloriesConsumed,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
      exerciseMinutes: data.exerciseMinutes.present
          ? data.exerciseMinutes.value
          : this.exerciseMinutes,
      sleepMinutes: data.sleepMinutes.present
          ? data.sleepMinutes.value
          : this.sleepMinutes,
      proteinGrams: data.proteinGrams.present
          ? data.proteinGrams.value
          : this.proteinGrams,
      carbsGrams:
          data.carbsGrams.present ? data.carbsGrams.value : this.carbsGrams,
      fatGrams: data.fatGrams.present ? data.fatGrams.value : this.fatGrams,
      stepsCount:
          data.stepsCount.present ? data.stepsCount.value : this.stepsCount,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyProgressEntry(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('caloriesConsumed: $caloriesConsumed, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('exerciseMinutes: $exerciseMinutes, ')
          ..write('sleepMinutes: $sleepMinutes, ')
          ..write('proteinGrams: $proteinGrams, ')
          ..write('carbsGrams: $carbsGrams, ')
          ..write('fatGrams: $fatGrams, ')
          ..write('stepsCount: $stepsCount, ')
          ..write('weightKg: $weightKg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      date,
      caloriesConsumed,
      caloriesBurned,
      exerciseMinutes,
      sleepMinutes,
      proteinGrams,
      carbsGrams,
      fatGrams,
      stepsCount,
      weightKg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyProgressEntry &&
          other.id == this.id &&
          other.date == this.date &&
          other.caloriesConsumed == this.caloriesConsumed &&
          other.caloriesBurned == this.caloriesBurned &&
          other.exerciseMinutes == this.exerciseMinutes &&
          other.sleepMinutes == this.sleepMinutes &&
          other.proteinGrams == this.proteinGrams &&
          other.carbsGrams == this.carbsGrams &&
          other.fatGrams == this.fatGrams &&
          other.stepsCount == this.stepsCount &&
          other.weightKg == this.weightKg);
}

class DailyProgressEntriesCompanion
    extends UpdateCompanion<DailyProgressEntry> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<int> caloriesConsumed;
  final Value<int> caloriesBurned;
  final Value<int> exerciseMinutes;
  final Value<int> sleepMinutes;
  final Value<double> proteinGrams;
  final Value<double> carbsGrams;
  final Value<double> fatGrams;
  final Value<int> stepsCount;
  final Value<double?> weightKg;
  final Value<int> rowid;
  const DailyProgressEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.caloriesConsumed = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.exerciseMinutes = const Value.absent(),
    this.sleepMinutes = const Value.absent(),
    this.proteinGrams = const Value.absent(),
    this.carbsGrams = const Value.absent(),
    this.fatGrams = const Value.absent(),
    this.stepsCount = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyProgressEntriesCompanion.insert({
    required String id,
    required DateTime date,
    required int caloriesConsumed,
    required int caloriesBurned,
    required int exerciseMinutes,
    required int sleepMinutes,
    required double proteinGrams,
    required double carbsGrams,
    required double fatGrams,
    required int stepsCount,
    this.weightKg = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        caloriesConsumed = Value(caloriesConsumed),
        caloriesBurned = Value(caloriesBurned),
        exerciseMinutes = Value(exerciseMinutes),
        sleepMinutes = Value(sleepMinutes),
        proteinGrams = Value(proteinGrams),
        carbsGrams = Value(carbsGrams),
        fatGrams = Value(fatGrams),
        stepsCount = Value(stepsCount);
  static Insertable<DailyProgressEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<int>? caloriesConsumed,
    Expression<int>? caloriesBurned,
    Expression<int>? exerciseMinutes,
    Expression<int>? sleepMinutes,
    Expression<double>? proteinGrams,
    Expression<double>? carbsGrams,
    Expression<double>? fatGrams,
    Expression<int>? stepsCount,
    Expression<double>? weightKg,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (caloriesConsumed != null) 'calories_consumed': caloriesConsumed,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (exerciseMinutes != null) 'exercise_minutes': exerciseMinutes,
      if (sleepMinutes != null) 'sleep_minutes': sleepMinutes,
      if (proteinGrams != null) 'protein_grams': proteinGrams,
      if (carbsGrams != null) 'carbs_grams': carbsGrams,
      if (fatGrams != null) 'fat_grams': fatGrams,
      if (stepsCount != null) 'steps_count': stepsCount,
      if (weightKg != null) 'weight_kg': weightKg,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyProgressEntriesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<int>? caloriesConsumed,
      Value<int>? caloriesBurned,
      Value<int>? exerciseMinutes,
      Value<int>? sleepMinutes,
      Value<double>? proteinGrams,
      Value<double>? carbsGrams,
      Value<double>? fatGrams,
      Value<int>? stepsCount,
      Value<double?>? weightKg,
      Value<int>? rowid}) {
    return DailyProgressEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      caloriesConsumed: caloriesConsumed ?? this.caloriesConsumed,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
      sleepMinutes: sleepMinutes ?? this.sleepMinutes,
      proteinGrams: proteinGrams ?? this.proteinGrams,
      carbsGrams: carbsGrams ?? this.carbsGrams,
      fatGrams: fatGrams ?? this.fatGrams,
      stepsCount: stepsCount ?? this.stepsCount,
      weightKg: weightKg ?? this.weightKg,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (caloriesConsumed.present) {
      map['calories_consumed'] = Variable<int>(caloriesConsumed.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<int>(caloriesBurned.value);
    }
    if (exerciseMinutes.present) {
      map['exercise_minutes'] = Variable<int>(exerciseMinutes.value);
    }
    if (sleepMinutes.present) {
      map['sleep_minutes'] = Variable<int>(sleepMinutes.value);
    }
    if (proteinGrams.present) {
      map['protein_grams'] = Variable<double>(proteinGrams.value);
    }
    if (carbsGrams.present) {
      map['carbs_grams'] = Variable<double>(carbsGrams.value);
    }
    if (fatGrams.present) {
      map['fat_grams'] = Variable<double>(fatGrams.value);
    }
    if (stepsCount.present) {
      map['steps_count'] = Variable<int>(stepsCount.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyProgressEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('caloriesConsumed: $caloriesConsumed, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('exerciseMinutes: $exerciseMinutes, ')
          ..write('sleepMinutes: $sleepMinutes, ')
          ..write('proteinGrams: $proteinGrams, ')
          ..write('carbsGrams: $carbsGrams, ')
          ..write('fatGrams: $fatGrams, ')
          ..write('stepsCount: $stepsCount, ')
          ..write('weightKg: $weightKg, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prepTimeMinutesMeta =
      const VerificationMeta('prepTimeMinutes');
  @override
  late final GeneratedColumn<int> prepTimeMinutes = GeneratedColumn<int>(
      'prep_time_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cookTimeMinutesMeta =
      const VerificationMeta('cookTimeMinutes');
  @override
  late final GeneratedColumn<int> cookTimeMinutes = GeneratedColumn<int>(
      'cook_time_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _servingsMeta =
      const VerificationMeta('servings');
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
      'servings', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ingredientsJsonMeta =
      const VerificationMeta('ingredientsJson');
  @override
  late final GeneratedColumn<String> ingredientsJson = GeneratedColumn<String>(
      'ingredients_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsJsonMeta =
      const VerificationMeta('instructionsJson');
  @override
  late final GeneratedColumn<String> instructionsJson = GeneratedColumn<String>(
      'instructions_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
      'calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _proteinMeta =
      const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
      'protein', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
      'carbs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
      'fat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
      'fiber', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  @override
  late final GeneratedColumn<double> sugar = GeneratedColumn<double>(
      'sugar', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dietaryTagsMeta =
      const VerificationMeta('dietaryTags');
  @override
  late final GeneratedColumn<String> dietaryTags = GeneratedColumn<String>(
      'dietary_tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _allergensMeta =
      const VerificationMeta('allergens');
  @override
  late final GeneratedColumn<String> allergens = GeneratedColumn<String>(
      'allergens', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longevityRationaleMeta =
      const VerificationMeta('longevityRationale');
  @override
  late final GeneratedColumn<String> longevityRationale =
      GeneratedColumn<String>('longevity_rationale', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isBlueprintRecipeMeta =
      const VerificationMeta('isBlueprintRecipe');
  @override
  late final GeneratedColumn<bool> isBlueprintRecipe = GeneratedColumn<bool>(
      'is_blueprint_recipe', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_blueprint_recipe" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        imageUrl,
        prepTimeMinutes,
        cookTimeMinutes,
        servings,
        ingredientsJson,
        instructionsJson,
        calories,
        protein,
        carbs,
        fat,
        fiber,
        sugar,
        dietaryTags,
        allergens,
        longevityRationale,
        isBlueprintRecipe
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<Recipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('prep_time_minutes')) {
      context.handle(
          _prepTimeMinutesMeta,
          prepTimeMinutes.isAcceptableOrUnknown(
              data['prep_time_minutes']!, _prepTimeMinutesMeta));
    } else if (isInserting) {
      context.missing(_prepTimeMinutesMeta);
    }
    if (data.containsKey('cook_time_minutes')) {
      context.handle(
          _cookTimeMinutesMeta,
          cookTimeMinutes.isAcceptableOrUnknown(
              data['cook_time_minutes']!, _cookTimeMinutesMeta));
    } else if (isInserting) {
      context.missing(_cookTimeMinutesMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(_servingsMeta,
          servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta));
    } else if (isInserting) {
      context.missing(_servingsMeta);
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
          _ingredientsJsonMeta,
          ingredientsJson.isAcceptableOrUnknown(
              data['ingredients_json']!, _ingredientsJsonMeta));
    } else if (isInserting) {
      context.missing(_ingredientsJsonMeta);
    }
    if (data.containsKey('instructions_json')) {
      context.handle(
          _instructionsJsonMeta,
          instructionsJson.isAcceptableOrUnknown(
              data['instructions_json']!, _instructionsJsonMeta));
    } else if (isInserting) {
      context.missing(_instructionsJsonMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
          _carbsMeta, carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta));
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('fiber')) {
      context.handle(
          _fiberMeta, fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta));
    }
    if (data.containsKey('sugar')) {
      context.handle(
          _sugarMeta, sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta));
    }
    if (data.containsKey('dietary_tags')) {
      context.handle(
          _dietaryTagsMeta,
          dietaryTags.isAcceptableOrUnknown(
              data['dietary_tags']!, _dietaryTagsMeta));
    } else if (isInserting) {
      context.missing(_dietaryTagsMeta);
    }
    if (data.containsKey('allergens')) {
      context.handle(_allergensMeta,
          allergens.isAcceptableOrUnknown(data['allergens']!, _allergensMeta));
    } else if (isInserting) {
      context.missing(_allergensMeta);
    }
    if (data.containsKey('longevity_rationale')) {
      context.handle(
          _longevityRationaleMeta,
          longevityRationale.isAcceptableOrUnknown(
              data['longevity_rationale']!, _longevityRationaleMeta));
    } else if (isInserting) {
      context.missing(_longevityRationaleMeta);
    }
    if (data.containsKey('is_blueprint_recipe')) {
      context.handle(
          _isBlueprintRecipeMeta,
          isBlueprintRecipe.isAcceptableOrUnknown(
              data['is_blueprint_recipe']!, _isBlueprintRecipeMeta));
    } else if (isInserting) {
      context.missing(_isBlueprintRecipeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      prepTimeMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prep_time_minutes'])!,
      cookTimeMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cook_time_minutes'])!,
      servings: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}servings'])!,
      ingredientsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ingredients_json'])!,
      instructionsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}instructions_json'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories'])!,
      protein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein'])!,
      carbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs'])!,
      fat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat'])!,
      fiber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber']),
      sugar: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugar']),
      dietaryTags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dietary_tags'])!,
      allergens: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}allergens'])!,
      longevityRationale: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}longevity_rationale'])!,
      isBlueprintRecipe: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_blueprint_recipe'])!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String ingredientsJson;
  final String instructionsJson;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final double? fiber;
  final double? sugar;
  final String dietaryTags;
  final String allergens;
  final String longevityRationale;
  final bool isBlueprintRecipe;
  const Recipe(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.prepTimeMinutes,
      required this.cookTimeMinutes,
      required this.servings,
      required this.ingredientsJson,
      required this.instructionsJson,
      required this.calories,
      required this.protein,
      required this.carbs,
      required this.fat,
      this.fiber,
      this.sugar,
      required this.dietaryTags,
      required this.allergens,
      required this.longevityRationale,
      required this.isBlueprintRecipe});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image_url'] = Variable<String>(imageUrl);
    map['prep_time_minutes'] = Variable<int>(prepTimeMinutes);
    map['cook_time_minutes'] = Variable<int>(cookTimeMinutes);
    map['servings'] = Variable<int>(servings);
    map['ingredients_json'] = Variable<String>(ingredientsJson);
    map['instructions_json'] = Variable<String>(instructionsJson);
    map['calories'] = Variable<int>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    if (!nullToAbsent || fiber != null) {
      map['fiber'] = Variable<double>(fiber);
    }
    if (!nullToAbsent || sugar != null) {
      map['sugar'] = Variable<double>(sugar);
    }
    map['dietary_tags'] = Variable<String>(dietaryTags);
    map['allergens'] = Variable<String>(allergens);
    map['longevity_rationale'] = Variable<String>(longevityRationale);
    map['is_blueprint_recipe'] = Variable<bool>(isBlueprintRecipe);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      imageUrl: Value(imageUrl),
      prepTimeMinutes: Value(prepTimeMinutes),
      cookTimeMinutes: Value(cookTimeMinutes),
      servings: Value(servings),
      ingredientsJson: Value(ingredientsJson),
      instructionsJson: Value(instructionsJson),
      calories: Value(calories),
      protein: Value(protein),
      carbs: Value(carbs),
      fat: Value(fat),
      fiber:
          fiber == null && nullToAbsent ? const Value.absent() : Value(fiber),
      sugar:
          sugar == null && nullToAbsent ? const Value.absent() : Value(sugar),
      dietaryTags: Value(dietaryTags),
      allergens: Value(allergens),
      longevityRationale: Value(longevityRationale),
      isBlueprintRecipe: Value(isBlueprintRecipe),
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      prepTimeMinutes: serializer.fromJson<int>(json['prepTimeMinutes']),
      cookTimeMinutes: serializer.fromJson<int>(json['cookTimeMinutes']),
      servings: serializer.fromJson<int>(json['servings']),
      ingredientsJson: serializer.fromJson<String>(json['ingredientsJson']),
      instructionsJson: serializer.fromJson<String>(json['instructionsJson']),
      calories: serializer.fromJson<int>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fat: serializer.fromJson<double>(json['fat']),
      fiber: serializer.fromJson<double?>(json['fiber']),
      sugar: serializer.fromJson<double?>(json['sugar']),
      dietaryTags: serializer.fromJson<String>(json['dietaryTags']),
      allergens: serializer.fromJson<String>(json['allergens']),
      longevityRationale:
          serializer.fromJson<String>(json['longevityRationale']),
      isBlueprintRecipe: serializer.fromJson<bool>(json['isBlueprintRecipe']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'prepTimeMinutes': serializer.toJson<int>(prepTimeMinutes),
      'cookTimeMinutes': serializer.toJson<int>(cookTimeMinutes),
      'servings': serializer.toJson<int>(servings),
      'ingredientsJson': serializer.toJson<String>(ingredientsJson),
      'instructionsJson': serializer.toJson<String>(instructionsJson),
      'calories': serializer.toJson<int>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'fiber': serializer.toJson<double?>(fiber),
      'sugar': serializer.toJson<double?>(sugar),
      'dietaryTags': serializer.toJson<String>(dietaryTags),
      'allergens': serializer.toJson<String>(allergens),
      'longevityRationale': serializer.toJson<String>(longevityRationale),
      'isBlueprintRecipe': serializer.toJson<bool>(isBlueprintRecipe),
    };
  }

  Recipe copyWith(
          {String? id,
          String? name,
          String? description,
          String? imageUrl,
          int? prepTimeMinutes,
          int? cookTimeMinutes,
          int? servings,
          String? ingredientsJson,
          String? instructionsJson,
          int? calories,
          double? protein,
          double? carbs,
          double? fat,
          Value<double?> fiber = const Value.absent(),
          Value<double?> sugar = const Value.absent(),
          String? dietaryTags,
          String? allergens,
          String? longevityRationale,
          bool? isBlueprintRecipe}) =>
      Recipe(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
        cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
        servings: servings ?? this.servings,
        ingredientsJson: ingredientsJson ?? this.ingredientsJson,
        instructionsJson: instructionsJson ?? this.instructionsJson,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbs: carbs ?? this.carbs,
        fat: fat ?? this.fat,
        fiber: fiber.present ? fiber.value : this.fiber,
        sugar: sugar.present ? sugar.value : this.sugar,
        dietaryTags: dietaryTags ?? this.dietaryTags,
        allergens: allergens ?? this.allergens,
        longevityRationale: longevityRationale ?? this.longevityRationale,
        isBlueprintRecipe: isBlueprintRecipe ?? this.isBlueprintRecipe,
      );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      prepTimeMinutes: data.prepTimeMinutes.present
          ? data.prepTimeMinutes.value
          : this.prepTimeMinutes,
      cookTimeMinutes: data.cookTimeMinutes.present
          ? data.cookTimeMinutes.value
          : this.cookTimeMinutes,
      servings: data.servings.present ? data.servings.value : this.servings,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
      instructionsJson: data.instructionsJson.present
          ? data.instructionsJson.value
          : this.instructionsJson,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
      fiber: data.fiber.present ? data.fiber.value : this.fiber,
      sugar: data.sugar.present ? data.sugar.value : this.sugar,
      dietaryTags:
          data.dietaryTags.present ? data.dietaryTags.value : this.dietaryTags,
      allergens: data.allergens.present ? data.allergens.value : this.allergens,
      longevityRationale: data.longevityRationale.present
          ? data.longevityRationale.value
          : this.longevityRationale,
      isBlueprintRecipe: data.isBlueprintRecipe.present
          ? data.isBlueprintRecipe.value
          : this.isBlueprintRecipe,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('prepTimeMinutes: $prepTimeMinutes, ')
          ..write('cookTimeMinutes: $cookTimeMinutes, ')
          ..write('servings: $servings, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('instructionsJson: $instructionsJson, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sugar: $sugar, ')
          ..write('dietaryTags: $dietaryTags, ')
          ..write('allergens: $allergens, ')
          ..write('longevityRationale: $longevityRationale, ')
          ..write('isBlueprintRecipe: $isBlueprintRecipe')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      imageUrl,
      prepTimeMinutes,
      cookTimeMinutes,
      servings,
      ingredientsJson,
      instructionsJson,
      calories,
      protein,
      carbs,
      fat,
      fiber,
      sugar,
      dietaryTags,
      allergens,
      longevityRationale,
      isBlueprintRecipe);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.prepTimeMinutes == this.prepTimeMinutes &&
          other.cookTimeMinutes == this.cookTimeMinutes &&
          other.servings == this.servings &&
          other.ingredientsJson == this.ingredientsJson &&
          other.instructionsJson == this.instructionsJson &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.fiber == this.fiber &&
          other.sugar == this.sugar &&
          other.dietaryTags == this.dietaryTags &&
          other.allergens == this.allergens &&
          other.longevityRationale == this.longevityRationale &&
          other.isBlueprintRecipe == this.isBlueprintRecipe);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> imageUrl;
  final Value<int> prepTimeMinutes;
  final Value<int> cookTimeMinutes;
  final Value<int> servings;
  final Value<String> ingredientsJson;
  final Value<String> instructionsJson;
  final Value<int> calories;
  final Value<double> protein;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double?> fiber;
  final Value<double?> sugar;
  final Value<String> dietaryTags;
  final Value<String> allergens;
  final Value<String> longevityRationale;
  final Value<bool> isBlueprintRecipe;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.prepTimeMinutes = const Value.absent(),
    this.cookTimeMinutes = const Value.absent(),
    this.servings = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.instructionsJson = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.fiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.dietaryTags = const Value.absent(),
    this.allergens = const Value.absent(),
    this.longevityRationale = const Value.absent(),
    this.isBlueprintRecipe = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required int prepTimeMinutes,
    required int cookTimeMinutes,
    required int servings,
    required String ingredientsJson,
    required String instructionsJson,
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    this.fiber = const Value.absent(),
    this.sugar = const Value.absent(),
    required String dietaryTags,
    required String allergens,
    required String longevityRationale,
    required bool isBlueprintRecipe,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        imageUrl = Value(imageUrl),
        prepTimeMinutes = Value(prepTimeMinutes),
        cookTimeMinutes = Value(cookTimeMinutes),
        servings = Value(servings),
        ingredientsJson = Value(ingredientsJson),
        instructionsJson = Value(instructionsJson),
        calories = Value(calories),
        protein = Value(protein),
        carbs = Value(carbs),
        fat = Value(fat),
        dietaryTags = Value(dietaryTags),
        allergens = Value(allergens),
        longevityRationale = Value(longevityRationale),
        isBlueprintRecipe = Value(isBlueprintRecipe);
  static Insertable<Recipe> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imageUrl,
    Expression<int>? prepTimeMinutes,
    Expression<int>? cookTimeMinutes,
    Expression<int>? servings,
    Expression<String>? ingredientsJson,
    Expression<String>? instructionsJson,
    Expression<int>? calories,
    Expression<double>? protein,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? fiber,
    Expression<double>? sugar,
    Expression<String>? dietaryTags,
    Expression<String>? allergens,
    Expression<String>? longevityRationale,
    Expression<bool>? isBlueprintRecipe,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (prepTimeMinutes != null) 'prep_time_minutes': prepTimeMinutes,
      if (cookTimeMinutes != null) 'cook_time_minutes': cookTimeMinutes,
      if (servings != null) 'servings': servings,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (instructionsJson != null) 'instructions_json': instructionsJson,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (fiber != null) 'fiber': fiber,
      if (sugar != null) 'sugar': sugar,
      if (dietaryTags != null) 'dietary_tags': dietaryTags,
      if (allergens != null) 'allergens': allergens,
      if (longevityRationale != null) 'longevity_rationale': longevityRationale,
      if (isBlueprintRecipe != null) 'is_blueprint_recipe': isBlueprintRecipe,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? imageUrl,
      Value<int>? prepTimeMinutes,
      Value<int>? cookTimeMinutes,
      Value<int>? servings,
      Value<String>? ingredientsJson,
      Value<String>? instructionsJson,
      Value<int>? calories,
      Value<double>? protein,
      Value<double>? carbs,
      Value<double>? fat,
      Value<double?>? fiber,
      Value<double?>? sugar,
      Value<String>? dietaryTags,
      Value<String>? allergens,
      Value<String>? longevityRationale,
      Value<bool>? isBlueprintRecipe,
      Value<int>? rowid}) {
    return RecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
      servings: servings ?? this.servings,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      instructionsJson: instructionsJson ?? this.instructionsJson,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      sugar: sugar ?? this.sugar,
      dietaryTags: dietaryTags ?? this.dietaryTags,
      allergens: allergens ?? this.allergens,
      longevityRationale: longevityRationale ?? this.longevityRationale,
      isBlueprintRecipe: isBlueprintRecipe ?? this.isBlueprintRecipe,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (prepTimeMinutes.present) {
      map['prep_time_minutes'] = Variable<int>(prepTimeMinutes.value);
    }
    if (cookTimeMinutes.present) {
      map['cook_time_minutes'] = Variable<int>(cookTimeMinutes.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (instructionsJson.present) {
      map['instructions_json'] = Variable<String>(instructionsJson.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    if (dietaryTags.present) {
      map['dietary_tags'] = Variable<String>(dietaryTags.value);
    }
    if (allergens.present) {
      map['allergens'] = Variable<String>(allergens.value);
    }
    if (longevityRationale.present) {
      map['longevity_rationale'] = Variable<String>(longevityRationale.value);
    }
    if (isBlueprintRecipe.present) {
      map['is_blueprint_recipe'] = Variable<bool>(isBlueprintRecipe.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('prepTimeMinutes: $prepTimeMinutes, ')
          ..write('cookTimeMinutes: $cookTimeMinutes, ')
          ..write('servings: $servings, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('instructionsJson: $instructionsJson, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sugar: $sugar, ')
          ..write('dietaryTags: $dietaryTags, ')
          ..write('allergens: $allergens, ')
          ..write('longevityRationale: $longevityRationale, ')
          ..write('isBlueprintRecipe: $isBlueprintRecipe, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
      'difficulty', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _equipmentRequiredMeta =
      const VerificationMeta('equipmentRequired');
  @override
  late final GeneratedColumn<String> equipmentRequired =
      GeneratedColumn<String>('equipment_required', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _estimatedCaloriesMeta =
      const VerificationMeta('estimatedCalories');
  @override
  late final GeneratedColumn<int> estimatedCalories = GeneratedColumn<int>(
      'estimated_calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _exercisesJsonMeta =
      const VerificationMeta('exercisesJson');
  @override
  late final GeneratedColumn<String> exercisesJson = GeneratedColumn<String>(
      'exercises_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
      'thumbnail_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        category,
        durationMinutes,
        difficulty,
        equipmentRequired,
        estimatedCalories,
        exercisesJson,
        videoUrl,
        thumbnailUrl
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<Workout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('equipment_required')) {
      context.handle(
          _equipmentRequiredMeta,
          equipmentRequired.isAcceptableOrUnknown(
              data['equipment_required']!, _equipmentRequiredMeta));
    } else if (isInserting) {
      context.missing(_equipmentRequiredMeta);
    }
    if (data.containsKey('estimated_calories')) {
      context.handle(
          _estimatedCaloriesMeta,
          estimatedCalories.isAcceptableOrUnknown(
              data['estimated_calories']!, _estimatedCaloriesMeta));
    } else if (isInserting) {
      context.missing(_estimatedCaloriesMeta);
    }
    if (data.containsKey('exercises_json')) {
      context.handle(
          _exercisesJsonMeta,
          exercisesJson.isAcceptableOrUnknown(
              data['exercises_json']!, _exercisesJsonMeta));
    } else if (isInserting) {
      context.missing(_exercisesJsonMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficulty'])!,
      equipmentRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}equipment_required'])!,
      estimatedCalories: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_calories'])!,
      exercisesJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercises_json'])!,
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url']),
      thumbnailUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_url']),
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final String id;
  final String name;
  final String category;
  final int durationMinutes;
  final String difficulty;
  final String equipmentRequired;
  final int estimatedCalories;
  final String exercisesJson;
  final String? videoUrl;
  final String? thumbnailUrl;
  const Workout(
      {required this.id,
      required this.name,
      required this.category,
      required this.durationMinutes,
      required this.difficulty,
      required this.equipmentRequired,
      required this.estimatedCalories,
      required this.exercisesJson,
      this.videoUrl,
      this.thumbnailUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['difficulty'] = Variable<String>(difficulty);
    map['equipment_required'] = Variable<String>(equipmentRequired);
    map['estimated_calories'] = Variable<int>(estimatedCalories);
    map['exercises_json'] = Variable<String>(exercisesJson);
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      durationMinutes: Value(durationMinutes),
      difficulty: Value(difficulty),
      equipmentRequired: Value(equipmentRequired),
      estimatedCalories: Value(estimatedCalories),
      exercisesJson: Value(exercisesJson),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
    );
  }

  factory Workout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      equipmentRequired: serializer.fromJson<String>(json['equipmentRequired']),
      estimatedCalories: serializer.fromJson<int>(json['estimatedCalories']),
      exercisesJson: serializer.fromJson<String>(json['exercisesJson']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'difficulty': serializer.toJson<String>(difficulty),
      'equipmentRequired': serializer.toJson<String>(equipmentRequired),
      'estimatedCalories': serializer.toJson<int>(estimatedCalories),
      'exercisesJson': serializer.toJson<String>(exercisesJson),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
    };
  }

  Workout copyWith(
          {String? id,
          String? name,
          String? category,
          int? durationMinutes,
          String? difficulty,
          String? equipmentRequired,
          int? estimatedCalories,
          String? exercisesJson,
          Value<String?> videoUrl = const Value.absent(),
          Value<String?> thumbnailUrl = const Value.absent()}) =>
      Workout(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        difficulty: difficulty ?? this.difficulty,
        equipmentRequired: equipmentRequired ?? this.equipmentRequired,
        estimatedCalories: estimatedCalories ?? this.estimatedCalories,
        exercisesJson: exercisesJson ?? this.exercisesJson,
        videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
      );
  Workout copyWithCompanion(WorkoutsCompanion data) {
    return Workout(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      equipmentRequired: data.equipmentRequired.present
          ? data.equipmentRequired.value
          : this.equipmentRequired,
      estimatedCalories: data.estimatedCalories.present
          ? data.estimatedCalories.value
          : this.estimatedCalories,
      exercisesJson: data.exercisesJson.present
          ? data.exercisesJson.value
          : this.exercisesJson,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('difficulty: $difficulty, ')
          ..write('equipmentRequired: $equipmentRequired, ')
          ..write('estimatedCalories: $estimatedCalories, ')
          ..write('exercisesJson: $exercisesJson, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      category,
      durationMinutes,
      difficulty,
      equipmentRequired,
      estimatedCalories,
      exercisesJson,
      videoUrl,
      thumbnailUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.durationMinutes == this.durationMinutes &&
          other.difficulty == this.difficulty &&
          other.equipmentRequired == this.equipmentRequired &&
          other.estimatedCalories == this.estimatedCalories &&
          other.exercisesJson == this.exercisesJson &&
          other.videoUrl == this.videoUrl &&
          other.thumbnailUrl == this.thumbnailUrl);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<int> durationMinutes;
  final Value<String> difficulty;
  final Value<String> equipmentRequired;
  final Value<int> estimatedCalories;
  final Value<String> exercisesJson;
  final Value<String?> videoUrl;
  final Value<String?> thumbnailUrl;
  final Value<int> rowid;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.equipmentRequired = const Value.absent(),
    this.estimatedCalories = const Value.absent(),
    this.exercisesJson = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    required String id,
    required String name,
    required String category,
    required int durationMinutes,
    required String difficulty,
    required String equipmentRequired,
    required int estimatedCalories,
    required String exercisesJson,
    this.videoUrl = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        category = Value(category),
        durationMinutes = Value(durationMinutes),
        difficulty = Value(difficulty),
        equipmentRequired = Value(equipmentRequired),
        estimatedCalories = Value(estimatedCalories),
        exercisesJson = Value(exercisesJson);
  static Insertable<Workout> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<int>? durationMinutes,
    Expression<String>? difficulty,
    Expression<String>? equipmentRequired,
    Expression<int>? estimatedCalories,
    Expression<String>? exercisesJson,
    Expression<String>? videoUrl,
    Expression<String>? thumbnailUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (difficulty != null) 'difficulty': difficulty,
      if (equipmentRequired != null) 'equipment_required': equipmentRequired,
      if (estimatedCalories != null) 'estimated_calories': estimatedCalories,
      if (exercisesJson != null) 'exercises_json': exercisesJson,
      if (videoUrl != null) 'video_url': videoUrl,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? category,
      Value<int>? durationMinutes,
      Value<String>? difficulty,
      Value<String>? equipmentRequired,
      Value<int>? estimatedCalories,
      Value<String>? exercisesJson,
      Value<String?>? videoUrl,
      Value<String?>? thumbnailUrl,
      Value<int>? rowid}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      difficulty: difficulty ?? this.difficulty,
      equipmentRequired: equipmentRequired ?? this.equipmentRequired,
      estimatedCalories: estimatedCalories ?? this.estimatedCalories,
      exercisesJson: exercisesJson ?? this.exercisesJson,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (equipmentRequired.present) {
      map['equipment_required'] = Variable<String>(equipmentRequired.value);
    }
    if (estimatedCalories.present) {
      map['estimated_calories'] = Variable<int>(estimatedCalories.value);
    }
    if (exercisesJson.present) {
      map['exercises_json'] = Variable<String>(exercisesJson.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('difficulty: $difficulty, ')
          ..write('equipmentRequired: $equipmentRequired, ')
          ..write('estimatedCalories: $estimatedCalories, ')
          ..write('exercisesJson: $exercisesJson, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedFoodsTable extends CachedFoods
    with TableInfo<$CachedFoodsTable, CachedFood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedFoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingSizeMeta =
      const VerificationMeta('servingSize');
  @override
  late final GeneratedColumn<double> servingSize = GeneratedColumn<double>(
      'serving_size', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _servingUnitMeta =
      const VerificationMeta('servingUnit');
  @override
  late final GeneratedColumn<String> servingUnit = GeneratedColumn<String>(
      'serving_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
      'calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _proteinMeta =
      const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
      'protein', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
      'carbs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
      'fat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
      'fiber', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  @override
  late final GeneratedColumn<double> sugar = GeneratedColumn<double>(
      'sugar', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sodiumMeta = const VerificationMeta('sodium');
  @override
  late final GeneratedColumn<double> sodium = GeneratedColumn<double>(
      'sodium', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _databaseSourceMeta =
      const VerificationMeta('databaseSource');
  @override
  late final GeneratedColumn<String> databaseSource = GeneratedColumn<String>(
      'database_source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        brand,
        servingSize,
        servingUnit,
        calories,
        protein,
        carbs,
        fat,
        fiber,
        sugar,
        sodium,
        barcode,
        databaseSource,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_foods';
  @override
  VerificationContext validateIntegrity(Insertable<CachedFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('serving_size')) {
      context.handle(
          _servingSizeMeta,
          servingSize.isAcceptableOrUnknown(
              data['serving_size']!, _servingSizeMeta));
    } else if (isInserting) {
      context.missing(_servingSizeMeta);
    }
    if (data.containsKey('serving_unit')) {
      context.handle(
          _servingUnitMeta,
          servingUnit.isAcceptableOrUnknown(
              data['serving_unit']!, _servingUnitMeta));
    } else if (isInserting) {
      context.missing(_servingUnitMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
          _carbsMeta, carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta));
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('fiber')) {
      context.handle(
          _fiberMeta, fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta));
    }
    if (data.containsKey('sugar')) {
      context.handle(
          _sugarMeta, sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta));
    }
    if (data.containsKey('sodium')) {
      context.handle(_sodiumMeta,
          sodium.isAcceptableOrUnknown(data['sodium']!, _sodiumMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('database_source')) {
      context.handle(
          _databaseSourceMeta,
          databaseSource.isAcceptableOrUnknown(
              data['database_source']!, _databaseSourceMeta));
    } else if (isInserting) {
      context.missing(_databaseSourceMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedFood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedFood(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      servingSize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}serving_size'])!,
      servingUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serving_unit'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories'])!,
      protein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein'])!,
      carbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs'])!,
      fat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat'])!,
      fiber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber']),
      sugar: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugar']),
      sodium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      databaseSource: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}database_source'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedFoodsTable createAlias(String alias) {
    return $CachedFoodsTable(attachedDatabase, alias);
  }
}

class CachedFood extends DataClass implements Insertable<CachedFood> {
  final String id;
  final String name;
  final String? brand;
  final double servingSize;
  final String servingUnit;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final double? fiber;
  final double? sugar;
  final double? sodium;
  final String? barcode;
  final String databaseSource;
  final DateTime cachedAt;
  const CachedFood(
      {required this.id,
      required this.name,
      this.brand,
      required this.servingSize,
      required this.servingUnit,
      required this.calories,
      required this.protein,
      required this.carbs,
      required this.fat,
      this.fiber,
      this.sugar,
      this.sodium,
      this.barcode,
      required this.databaseSource,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['serving_size'] = Variable<double>(servingSize);
    map['serving_unit'] = Variable<String>(servingUnit);
    map['calories'] = Variable<int>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    if (!nullToAbsent || fiber != null) {
      map['fiber'] = Variable<double>(fiber);
    }
    if (!nullToAbsent || sugar != null) {
      map['sugar'] = Variable<double>(sugar);
    }
    if (!nullToAbsent || sodium != null) {
      map['sodium'] = Variable<double>(sodium);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['database_source'] = Variable<String>(databaseSource);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedFoodsCompanion toCompanion(bool nullToAbsent) {
    return CachedFoodsCompanion(
      id: Value(id),
      name: Value(name),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      servingSize: Value(servingSize),
      servingUnit: Value(servingUnit),
      calories: Value(calories),
      protein: Value(protein),
      carbs: Value(carbs),
      fat: Value(fat),
      fiber:
          fiber == null && nullToAbsent ? const Value.absent() : Value(fiber),
      sugar:
          sugar == null && nullToAbsent ? const Value.absent() : Value(sugar),
      sodium:
          sodium == null && nullToAbsent ? const Value.absent() : Value(sodium),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      databaseSource: Value(databaseSource),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedFood(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      servingSize: serializer.fromJson<double>(json['servingSize']),
      servingUnit: serializer.fromJson<String>(json['servingUnit']),
      calories: serializer.fromJson<int>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fat: serializer.fromJson<double>(json['fat']),
      fiber: serializer.fromJson<double?>(json['fiber']),
      sugar: serializer.fromJson<double?>(json['sugar']),
      sodium: serializer.fromJson<double?>(json['sodium']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      databaseSource: serializer.fromJson<String>(json['databaseSource']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String?>(brand),
      'servingSize': serializer.toJson<double>(servingSize),
      'servingUnit': serializer.toJson<String>(servingUnit),
      'calories': serializer.toJson<int>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'fiber': serializer.toJson<double?>(fiber),
      'sugar': serializer.toJson<double?>(sugar),
      'sodium': serializer.toJson<double?>(sodium),
      'barcode': serializer.toJson<String?>(barcode),
      'databaseSource': serializer.toJson<String>(databaseSource),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedFood copyWith(
          {String? id,
          String? name,
          Value<String?> brand = const Value.absent(),
          double? servingSize,
          String? servingUnit,
          int? calories,
          double? protein,
          double? carbs,
          double? fat,
          Value<double?> fiber = const Value.absent(),
          Value<double?> sugar = const Value.absent(),
          Value<double?> sodium = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          String? databaseSource,
          DateTime? cachedAt}) =>
      CachedFood(
        id: id ?? this.id,
        name: name ?? this.name,
        brand: brand.present ? brand.value : this.brand,
        servingSize: servingSize ?? this.servingSize,
        servingUnit: servingUnit ?? this.servingUnit,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbs: carbs ?? this.carbs,
        fat: fat ?? this.fat,
        fiber: fiber.present ? fiber.value : this.fiber,
        sugar: sugar.present ? sugar.value : this.sugar,
        sodium: sodium.present ? sodium.value : this.sodium,
        barcode: barcode.present ? barcode.value : this.barcode,
        databaseSource: databaseSource ?? this.databaseSource,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedFood copyWithCompanion(CachedFoodsCompanion data) {
    return CachedFood(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      servingSize:
          data.servingSize.present ? data.servingSize.value : this.servingSize,
      servingUnit:
          data.servingUnit.present ? data.servingUnit.value : this.servingUnit,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
      fiber: data.fiber.present ? data.fiber.value : this.fiber,
      sugar: data.sugar.present ? data.sugar.value : this.sugar,
      sodium: data.sodium.present ? data.sodium.value : this.sodium,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      databaseSource: data.databaseSource.present
          ? data.databaseSource.value
          : this.databaseSource,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedFood(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('servingSize: $servingSize, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sugar: $sugar, ')
          ..write('sodium: $sodium, ')
          ..write('barcode: $barcode, ')
          ..write('databaseSource: $databaseSource, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      brand,
      servingSize,
      servingUnit,
      calories,
      protein,
      carbs,
      fat,
      fiber,
      sugar,
      sodium,
      barcode,
      databaseSource,
      cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedFood &&
          other.id == this.id &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.servingSize == this.servingSize &&
          other.servingUnit == this.servingUnit &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.fiber == this.fiber &&
          other.sugar == this.sugar &&
          other.sodium == this.sodium &&
          other.barcode == this.barcode &&
          other.databaseSource == this.databaseSource &&
          other.cachedAt == this.cachedAt);
}

class CachedFoodsCompanion extends UpdateCompanion<CachedFood> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> brand;
  final Value<double> servingSize;
  final Value<String> servingUnit;
  final Value<int> calories;
  final Value<double> protein;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double?> fiber;
  final Value<double?> sugar;
  final Value<double?> sodium;
  final Value<String?> barcode;
  final Value<String> databaseSource;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedFoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.fiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.sodium = const Value.absent(),
    this.barcode = const Value.absent(),
    this.databaseSource = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedFoodsCompanion.insert({
    required String id,
    required String name,
    this.brand = const Value.absent(),
    required double servingSize,
    required String servingUnit,
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    this.fiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.sodium = const Value.absent(),
    this.barcode = const Value.absent(),
    required String databaseSource,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        servingSize = Value(servingSize),
        servingUnit = Value(servingUnit),
        calories = Value(calories),
        protein = Value(protein),
        carbs = Value(carbs),
        fat = Value(fat),
        databaseSource = Value(databaseSource),
        cachedAt = Value(cachedAt);
  static Insertable<CachedFood> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<double>? servingSize,
    Expression<String>? servingUnit,
    Expression<int>? calories,
    Expression<double>? protein,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? fiber,
    Expression<double>? sugar,
    Expression<double>? sodium,
    Expression<String>? barcode,
    Expression<String>? databaseSource,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (servingSize != null) 'serving_size': servingSize,
      if (servingUnit != null) 'serving_unit': servingUnit,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (fiber != null) 'fiber': fiber,
      if (sugar != null) 'sugar': sugar,
      if (sodium != null) 'sodium': sodium,
      if (barcode != null) 'barcode': barcode,
      if (databaseSource != null) 'database_source': databaseSource,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedFoodsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? brand,
      Value<double>? servingSize,
      Value<String>? servingUnit,
      Value<int>? calories,
      Value<double>? protein,
      Value<double>? carbs,
      Value<double>? fat,
      Value<double?>? fiber,
      Value<double?>? sugar,
      Value<double?>? sodium,
      Value<String?>? barcode,
      Value<String>? databaseSource,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return CachedFoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      servingSize: servingSize ?? this.servingSize,
      servingUnit: servingUnit ?? this.servingUnit,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      sugar: sugar ?? this.sugar,
      sodium: sodium ?? this.sodium,
      barcode: barcode ?? this.barcode,
      databaseSource: databaseSource ?? this.databaseSource,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (servingSize.present) {
      map['serving_size'] = Variable<double>(servingSize.value);
    }
    if (servingUnit.present) {
      map['serving_unit'] = Variable<String>(servingUnit.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    if (sodium.present) {
      map['sodium'] = Variable<double>(sodium.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (databaseSource.present) {
      map['database_source'] = Variable<String>(databaseSource.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedFoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('servingSize: $servingSize, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sugar: $sugar, ')
          ..write('sodium: $sodium, ')
          ..write('barcode: $barcode, ')
          ..write('databaseSource: $databaseSource, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomFoodsTable extends CustomFoods
    with TableInfo<$CustomFoodsTable, CustomFood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomFoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _servingSizeMeta =
      const VerificationMeta('servingSize');
  @override
  late final GeneratedColumn<double> servingSize = GeneratedColumn<double>(
      'serving_size', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _servingUnitMeta =
      const VerificationMeta('servingUnit');
  @override
  late final GeneratedColumn<String> servingUnit = GeneratedColumn<String>(
      'serving_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
      'calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _proteinMeta =
      const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
      'protein', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
      'carbs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
      'fat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
      'fiber', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sugarMeta = const VerificationMeta('sugar');
  @override
  late final GeneratedColumn<double> sugar = GeneratedColumn<double>(
      'sugar', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sodiumMeta = const VerificationMeta('sodium');
  @override
  late final GeneratedColumn<double> sodium = GeneratedColumn<double>(
      'sodium', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        brand,
        servingSize,
        servingUnit,
        calories,
        protein,
        carbs,
        fat,
        fiber,
        sugar,
        sodium,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_foods';
  @override
  VerificationContext validateIntegrity(Insertable<CustomFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('serving_size')) {
      context.handle(
          _servingSizeMeta,
          servingSize.isAcceptableOrUnknown(
              data['serving_size']!, _servingSizeMeta));
    } else if (isInserting) {
      context.missing(_servingSizeMeta);
    }
    if (data.containsKey('serving_unit')) {
      context.handle(
          _servingUnitMeta,
          servingUnit.isAcceptableOrUnknown(
              data['serving_unit']!, _servingUnitMeta));
    } else if (isInserting) {
      context.missing(_servingUnitMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
          _carbsMeta, carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta));
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('fiber')) {
      context.handle(
          _fiberMeta, fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta));
    }
    if (data.containsKey('sugar')) {
      context.handle(
          _sugarMeta, sugar.isAcceptableOrUnknown(data['sugar']!, _sugarMeta));
    }
    if (data.containsKey('sodium')) {
      context.handle(_sodiumMeta,
          sodium.isAcceptableOrUnknown(data['sodium']!, _sodiumMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomFood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomFood(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      servingSize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}serving_size'])!,
      servingUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serving_unit'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories'])!,
      protein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein'])!,
      carbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs'])!,
      fat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat'])!,
      fiber: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fiber']),
      sugar: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sugar']),
      sodium: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sodium']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CustomFoodsTable createAlias(String alias) {
    return $CustomFoodsTable(attachedDatabase, alias);
  }
}

class CustomFood extends DataClass implements Insertable<CustomFood> {
  final String id;
  final String name;
  final String? brand;
  final double servingSize;
  final String servingUnit;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final double? fiber;
  final double? sugar;
  final double? sodium;
  final DateTime createdAt;
  const CustomFood(
      {required this.id,
      required this.name,
      this.brand,
      required this.servingSize,
      required this.servingUnit,
      required this.calories,
      required this.protein,
      required this.carbs,
      required this.fat,
      this.fiber,
      this.sugar,
      this.sodium,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['serving_size'] = Variable<double>(servingSize);
    map['serving_unit'] = Variable<String>(servingUnit);
    map['calories'] = Variable<int>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    if (!nullToAbsent || fiber != null) {
      map['fiber'] = Variable<double>(fiber);
    }
    if (!nullToAbsent || sugar != null) {
      map['sugar'] = Variable<double>(sugar);
    }
    if (!nullToAbsent || sodium != null) {
      map['sodium'] = Variable<double>(sodium);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomFoodsCompanion toCompanion(bool nullToAbsent) {
    return CustomFoodsCompanion(
      id: Value(id),
      name: Value(name),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      servingSize: Value(servingSize),
      servingUnit: Value(servingUnit),
      calories: Value(calories),
      protein: Value(protein),
      carbs: Value(carbs),
      fat: Value(fat),
      fiber:
          fiber == null && nullToAbsent ? const Value.absent() : Value(fiber),
      sugar:
          sugar == null && nullToAbsent ? const Value.absent() : Value(sugar),
      sodium:
          sodium == null && nullToAbsent ? const Value.absent() : Value(sodium),
      createdAt: Value(createdAt),
    );
  }

  factory CustomFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomFood(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      servingSize: serializer.fromJson<double>(json['servingSize']),
      servingUnit: serializer.fromJson<String>(json['servingUnit']),
      calories: serializer.fromJson<int>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fat: serializer.fromJson<double>(json['fat']),
      fiber: serializer.fromJson<double?>(json['fiber']),
      sugar: serializer.fromJson<double?>(json['sugar']),
      sodium: serializer.fromJson<double?>(json['sodium']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String?>(brand),
      'servingSize': serializer.toJson<double>(servingSize),
      'servingUnit': serializer.toJson<String>(servingUnit),
      'calories': serializer.toJson<int>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
      'fiber': serializer.toJson<double?>(fiber),
      'sugar': serializer.toJson<double?>(sugar),
      'sodium': serializer.toJson<double?>(sodium),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CustomFood copyWith(
          {String? id,
          String? name,
          Value<String?> brand = const Value.absent(),
          double? servingSize,
          String? servingUnit,
          int? calories,
          double? protein,
          double? carbs,
          double? fat,
          Value<double?> fiber = const Value.absent(),
          Value<double?> sugar = const Value.absent(),
          Value<double?> sodium = const Value.absent(),
          DateTime? createdAt}) =>
      CustomFood(
        id: id ?? this.id,
        name: name ?? this.name,
        brand: brand.present ? brand.value : this.brand,
        servingSize: servingSize ?? this.servingSize,
        servingUnit: servingUnit ?? this.servingUnit,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbs: carbs ?? this.carbs,
        fat: fat ?? this.fat,
        fiber: fiber.present ? fiber.value : this.fiber,
        sugar: sugar.present ? sugar.value : this.sugar,
        sodium: sodium.present ? sodium.value : this.sodium,
        createdAt: createdAt ?? this.createdAt,
      );
  CustomFood copyWithCompanion(CustomFoodsCompanion data) {
    return CustomFood(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      servingSize:
          data.servingSize.present ? data.servingSize.value : this.servingSize,
      servingUnit:
          data.servingUnit.present ? data.servingUnit.value : this.servingUnit,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
      fiber: data.fiber.present ? data.fiber.value : this.fiber,
      sugar: data.sugar.present ? data.sugar.value : this.sugar,
      sodium: data.sodium.present ? data.sodium.value : this.sodium,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomFood(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('servingSize: $servingSize, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sugar: $sugar, ')
          ..write('sodium: $sodium, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, brand, servingSize, servingUnit,
      calories, protein, carbs, fat, fiber, sugar, sodium, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomFood &&
          other.id == this.id &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.servingSize == this.servingSize &&
          other.servingUnit == this.servingUnit &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbs == this.carbs &&
          other.fat == this.fat &&
          other.fiber == this.fiber &&
          other.sugar == this.sugar &&
          other.sodium == this.sodium &&
          other.createdAt == this.createdAt);
}

class CustomFoodsCompanion extends UpdateCompanion<CustomFood> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> brand;
  final Value<double> servingSize;
  final Value<String> servingUnit;
  final Value<int> calories;
  final Value<double> protein;
  final Value<double> carbs;
  final Value<double> fat;
  final Value<double?> fiber;
  final Value<double?> sugar;
  final Value<double?> sodium;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CustomFoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
    this.fiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.sodium = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomFoodsCompanion.insert({
    required String id,
    required String name,
    this.brand = const Value.absent(),
    required double servingSize,
    required String servingUnit,
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    this.fiber = const Value.absent(),
    this.sugar = const Value.absent(),
    this.sodium = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        servingSize = Value(servingSize),
        servingUnit = Value(servingUnit),
        calories = Value(calories),
        protein = Value(protein),
        carbs = Value(carbs),
        fat = Value(fat),
        createdAt = Value(createdAt);
  static Insertable<CustomFood> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<double>? servingSize,
    Expression<String>? servingUnit,
    Expression<int>? calories,
    Expression<double>? protein,
    Expression<double>? carbs,
    Expression<double>? fat,
    Expression<double>? fiber,
    Expression<double>? sugar,
    Expression<double>? sodium,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (servingSize != null) 'serving_size': servingSize,
      if (servingUnit != null) 'serving_unit': servingUnit,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
      if (fiber != null) 'fiber': fiber,
      if (sugar != null) 'sugar': sugar,
      if (sodium != null) 'sodium': sodium,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomFoodsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? brand,
      Value<double>? servingSize,
      Value<String>? servingUnit,
      Value<int>? calories,
      Value<double>? protein,
      Value<double>? carbs,
      Value<double>? fat,
      Value<double?>? fiber,
      Value<double?>? sugar,
      Value<double?>? sodium,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return CustomFoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      servingSize: servingSize ?? this.servingSize,
      servingUnit: servingUnit ?? this.servingUnit,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      sugar: sugar ?? this.sugar,
      sodium: sodium ?? this.sodium,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (servingSize.present) {
      map['serving_size'] = Variable<double>(servingSize.value);
    }
    if (servingUnit.present) {
      map['serving_unit'] = Variable<String>(servingUnit.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (sugar.present) {
      map['sugar'] = Variable<double>(sugar.value);
    }
    if (sodium.present) {
      map['sodium'] = Variable<double>(sodium.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomFoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('servingSize: $servingSize, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat, ')
          ..write('fiber: $fiber, ')
          ..write('sugar: $sugar, ')
          ..write('sodium: $sodium, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealItemsTable extends MealItems
    with TableInfo<$MealItemsTable, MealItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<String> mealId = GeneratedColumn<String>(
      'meal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<String> foodId = GeneratedColumn<String>(
      'food_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
      'calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _proteinMeta =
      const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
      'protein', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
      'carbs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
      'fat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mealId, foodId, quantity, calories, protein, carbs, fat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_items';
  @override
  VerificationContext validateIntegrity(Insertable<MealItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta));
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id']!, _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
          _carbsMeta, carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta));
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mealId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal_id'])!,
      foodId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories'])!,
      protein: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}protein'])!,
      carbs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbs'])!,
      fat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fat'])!,
    );
  }

  @override
  $MealItemsTable createAlias(String alias) {
    return $MealItemsTable(attachedDatabase, alias);
  }
}

class MealItem extends DataClass implements Insertable<MealItem> {
  final int id;
  final String mealId;
  final String foodId;
  final double quantity;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  const MealItem(
      {required this.id,
      required this.mealId,
      required this.foodId,
      required this.quantity,
      required this.calories,
      required this.protein,
      required this.carbs,
      required this.fat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meal_id'] = Variable<String>(mealId);
    map['food_id'] = Variable<String>(foodId);
    map['quantity'] = Variable<double>(quantity);
    map['calories'] = Variable<int>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbs'] = Variable<double>(carbs);
    map['fat'] = Variable<double>(fat);
    return map;
  }

  MealItemsCompanion toCompanion(bool nullToAbsent) {
    return MealItemsCompanion(
      id: Value(id),
      mealId: Value(mealId),
      foodId: Value(foodId),
      quantity: Value(quantity),
      calories: Value(calories),
      protein: Value(protein),
      carbs: Value(carbs),
      fat: Value(fat),
    );
  }

  factory MealItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealItem(
      id: serializer.fromJson<int>(json['id']),
      mealId: serializer.fromJson<String>(json['mealId']),
      foodId: serializer.fromJson<String>(json['foodId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      calories: serializer.fromJson<int>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fat: serializer.fromJson<double>(json['fat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mealId': serializer.toJson<String>(mealId),
      'foodId': serializer.toJson<String>(foodId),
      'quantity': serializer.toJson<double>(quantity),
      'calories': serializer.toJson<int>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbs': serializer.toJson<double>(carbs),
      'fat': serializer.toJson<double>(fat),
    };
  }

  MealItem copyWith(
          {int? id,
          String? mealId,
          String? foodId,
          double? quantity,
          int? calories,
          double? protein,
          double? carbs,
          double? fat}) =>
      MealItem(
        id: id ?? this.id,
        mealId: mealId ?? this.mealId,
        foodId: foodId ?? this.foodId,
        quantity: quantity ?? this.quantity,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbs: carbs ?? this.carbs,
        fat: fat ?? this.fat,
      );
  MealItem copyWithCompanion(MealItemsCompanion data) {
    return MealItem(
      id: data.id.present ? data.id.value : this.id,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      foodId: data.foodId.present ? data.foodId.value : this.foodId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fat: data.fat.present ? data.fat.value : this.fat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealItem(')
          ..write('id: $id, ')
          ..write('mealId: $mealId, ')
          ..write('foodId: $foodId, ')
          ..write('quantity: $quantity, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mealId, foodId, quantity, calories, protein, carbs, fat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealItem &&
          other.id == this.id &&
          other.mealId == this.mealId &&
          other.foodId == this.foodId &&
          other.quantity == this.quantity &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbs == this.carbs &&
          other.fat == this.fat);
}

class MealItemsCompanion extends UpdateCompanion<MealItem> {
  final Value<int> id;
  final Value<String> mealId;
  final Value<String> foodId;
  final Value<double> quantity;
  final Value<int> calories;
  final Value<double> protein;
  final Value<double> carbs;
  final Value<double> fat;
  const MealItemsCompanion({
    this.id = const Value.absent(),
    this.mealId = const Value.absent(),
    this.foodId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fat = const Value.absent(),
  });
  MealItemsCompanion.insert({
    this.id = const Value.absent(),
    required String mealId,
    required String foodId,
    required double quantity,
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
  })  : mealId = Value(mealId),
        foodId = Value(foodId),
        quantity = Value(quantity),
        calories = Value(calories),
        protein = Value(protein),
        carbs = Value(carbs),
        fat = Value(fat);
  static Insertable<MealItem> custom({
    Expression<int>? id,
    Expression<String>? mealId,
    Expression<String>? foodId,
    Expression<double>? quantity,
    Expression<int>? calories,
    Expression<double>? protein,
    Expression<double>? carbs,
    Expression<double>? fat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealId != null) 'meal_id': mealId,
      if (foodId != null) 'food_id': foodId,
      if (quantity != null) 'quantity': quantity,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbs != null) 'carbs': carbs,
      if (fat != null) 'fat': fat,
    });
  }

  MealItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? mealId,
      Value<String>? foodId,
      Value<double>? quantity,
      Value<int>? calories,
      Value<double>? protein,
      Value<double>? carbs,
      Value<double>? fat}) {
    return MealItemsCompanion(
      id: id ?? this.id,
      mealId: mealId ?? this.mealId,
      foodId: foodId ?? this.foodId,
      quantity: quantity ?? this.quantity,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<String>(mealId.value);
    }
    if (foodId.present) {
      map['food_id'] = Variable<String>(foodId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealItemsCompanion(')
          ..write('id: $id, ')
          ..write('mealId: $mealId, ')
          ..write('foodId: $foodId, ')
          ..write('quantity: $quantity, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fat: $fat')
          ..write(')'))
        .toString();
  }
}

class $RecentFoodsTable extends RecentFoods
    with TableInfo<$RecentFoodsTable, RecentFood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentFoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<String> foodId = GeneratedColumn<String>(
      'food_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usedAtMeta = const VerificationMeta('usedAt');
  @override
  late final GeneratedColumn<DateTime> usedAt = GeneratedColumn<DateTime>(
      'used_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _useCountMeta =
      const VerificationMeta('useCount');
  @override
  late final GeneratedColumn<int> useCount = GeneratedColumn<int>(
      'use_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [foodId, usedAt, useCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recent_foods';
  @override
  VerificationContext validateIntegrity(Insertable<RecentFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id']!, _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('used_at')) {
      context.handle(_usedAtMeta,
          usedAt.isAcceptableOrUnknown(data['used_at']!, _usedAtMeta));
    } else if (isInserting) {
      context.missing(_usedAtMeta);
    }
    if (data.containsKey('use_count')) {
      context.handle(_useCountMeta,
          useCount.isAcceptableOrUnknown(data['use_count']!, _useCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {foodId};
  @override
  RecentFood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentFood(
      foodId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_id'])!,
      usedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}used_at'])!,
      useCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}use_count'])!,
    );
  }

  @override
  $RecentFoodsTable createAlias(String alias) {
    return $RecentFoodsTable(attachedDatabase, alias);
  }
}

class RecentFood extends DataClass implements Insertable<RecentFood> {
  final String foodId;
  final DateTime usedAt;
  final int useCount;
  const RecentFood(
      {required this.foodId, required this.usedAt, required this.useCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['food_id'] = Variable<String>(foodId);
    map['used_at'] = Variable<DateTime>(usedAt);
    map['use_count'] = Variable<int>(useCount);
    return map;
  }

  RecentFoodsCompanion toCompanion(bool nullToAbsent) {
    return RecentFoodsCompanion(
      foodId: Value(foodId),
      usedAt: Value(usedAt),
      useCount: Value(useCount),
    );
  }

  factory RecentFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentFood(
      foodId: serializer.fromJson<String>(json['foodId']),
      usedAt: serializer.fromJson<DateTime>(json['usedAt']),
      useCount: serializer.fromJson<int>(json['useCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'foodId': serializer.toJson<String>(foodId),
      'usedAt': serializer.toJson<DateTime>(usedAt),
      'useCount': serializer.toJson<int>(useCount),
    };
  }

  RecentFood copyWith({String? foodId, DateTime? usedAt, int? useCount}) =>
      RecentFood(
        foodId: foodId ?? this.foodId,
        usedAt: usedAt ?? this.usedAt,
        useCount: useCount ?? this.useCount,
      );
  RecentFood copyWithCompanion(RecentFoodsCompanion data) {
    return RecentFood(
      foodId: data.foodId.present ? data.foodId.value : this.foodId,
      usedAt: data.usedAt.present ? data.usedAt.value : this.usedAt,
      useCount: data.useCount.present ? data.useCount.value : this.useCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecentFood(')
          ..write('foodId: $foodId, ')
          ..write('usedAt: $usedAt, ')
          ..write('useCount: $useCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(foodId, usedAt, useCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentFood &&
          other.foodId == this.foodId &&
          other.usedAt == this.usedAt &&
          other.useCount == this.useCount);
}

class RecentFoodsCompanion extends UpdateCompanion<RecentFood> {
  final Value<String> foodId;
  final Value<DateTime> usedAt;
  final Value<int> useCount;
  final Value<int> rowid;
  const RecentFoodsCompanion({
    this.foodId = const Value.absent(),
    this.usedAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentFoodsCompanion.insert({
    required String foodId,
    required DateTime usedAt,
    this.useCount = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : foodId = Value(foodId),
        usedAt = Value(usedAt);
  static Insertable<RecentFood> custom({
    Expression<String>? foodId,
    Expression<DateTime>? usedAt,
    Expression<int>? useCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (foodId != null) 'food_id': foodId,
      if (usedAt != null) 'used_at': usedAt,
      if (useCount != null) 'use_count': useCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentFoodsCompanion copyWith(
      {Value<String>? foodId,
      Value<DateTime>? usedAt,
      Value<int>? useCount,
      Value<int>? rowid}) {
    return RecentFoodsCompanion(
      foodId: foodId ?? this.foodId,
      usedAt: usedAt ?? this.usedAt,
      useCount: useCount ?? this.useCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (foodId.present) {
      map['food_id'] = Variable<String>(foodId.value);
    }
    if (usedAt.present) {
      map['used_at'] = Variable<DateTime>(usedAt.value);
    }
    if (useCount.present) {
      map['use_count'] = Variable<int>(useCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentFoodsCompanion(')
          ..write('foodId: $foodId, ')
          ..write('usedAt: $usedAt, ')
          ..write('useCount: $useCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteFoodsTable extends FavoriteFoods
    with TableInfo<$FavoriteFoodsTable, FavoriteFood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteFoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  @override
  late final GeneratedColumn<String> foodId = GeneratedColumn<String>(
      'food_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [foodId, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_foods';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id']!, _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {foodId};
  @override
  FavoriteFood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteFood(
      foodId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_id'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $FavoriteFoodsTable createAlias(String alias) {
    return $FavoriteFoodsTable(attachedDatabase, alias);
  }
}

class FavoriteFood extends DataClass implements Insertable<FavoriteFood> {
  final String foodId;
  final DateTime addedAt;
  const FavoriteFood({required this.foodId, required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['food_id'] = Variable<String>(foodId);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoriteFoodsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteFoodsCompanion(
      foodId: Value(foodId),
      addedAt: Value(addedAt),
    );
  }

  factory FavoriteFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteFood(
      foodId: serializer.fromJson<String>(json['foodId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'foodId': serializer.toJson<String>(foodId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  FavoriteFood copyWith({String? foodId, DateTime? addedAt}) => FavoriteFood(
        foodId: foodId ?? this.foodId,
        addedAt: addedAt ?? this.addedAt,
      );
  FavoriteFood copyWithCompanion(FavoriteFoodsCompanion data) {
    return FavoriteFood(
      foodId: data.foodId.present ? data.foodId.value : this.foodId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteFood(')
          ..write('foodId: $foodId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(foodId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteFood &&
          other.foodId == this.foodId &&
          other.addedAt == this.addedAt);
}

class FavoriteFoodsCompanion extends UpdateCompanion<FavoriteFood> {
  final Value<String> foodId;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const FavoriteFoodsCompanion({
    this.foodId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteFoodsCompanion.insert({
    required String foodId,
    required DateTime addedAt,
    this.rowid = const Value.absent(),
  })  : foodId = Value(foodId),
        addedAt = Value(addedAt);
  static Insertable<FavoriteFood> custom({
    Expression<String>? foodId,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (foodId != null) 'food_id': foodId,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteFoodsCompanion copyWith(
      {Value<String>? foodId, Value<DateTime>? addedAt, Value<int>? rowid}) {
    return FavoriteFoodsCompanion(
      foodId: foodId ?? this.foodId,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (foodId.present) {
      map['food_id'] = Variable<String>(foodId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteFoodsCompanion(')
          ..write('foodId: $foodId, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $DailyProtocolsTable dailyProtocols = $DailyProtocolsTable(this);
  late final $MealEntriesTable mealEntries = $MealEntriesTable(this);
  late final $WorkoutSessionsTable workoutSessions =
      $WorkoutSessionsTable(this);
  late final $SleepSessionsTable sleepSessions = $SleepSessionsTable(this);
  late final $SleepHabitLogsTable sleepHabitLogs = $SleepHabitLogsTable(this);
  late final $DailyProgressEntriesTable dailyProgressEntries =
      $DailyProgressEntriesTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $CachedFoodsTable cachedFoods = $CachedFoodsTable(this);
  late final $CustomFoodsTable customFoods = $CustomFoodsTable(this);
  late final $MealItemsTable mealItems = $MealItemsTable(this);
  late final $RecentFoodsTable recentFoods = $RecentFoodsTable(this);
  late final $FavoriteFoodsTable favoriteFoods = $FavoriteFoodsTable(this);
  late final UserProfileDao userProfileDao =
      UserProfileDao(this as AppDatabase);
  late final DailyProtocolDao dailyProtocolDao =
      DailyProtocolDao(this as AppDatabase);
  late final MealEntryDao mealEntryDao = MealEntryDao(this as AppDatabase);
  late final WorkoutSessionDao workoutSessionDao =
      WorkoutSessionDao(this as AppDatabase);
  late final SleepSessionDao sleepSessionDao =
      SleepSessionDao(this as AppDatabase);
  late final RecipeDao recipeDao = RecipeDao(this as AppDatabase);
  late final WorkoutDao workoutDao = WorkoutDao(this as AppDatabase);
  late final DailyProgressDao dailyProgressDao =
      DailyProgressDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userProfiles,
        dailyProtocols,
        mealEntries,
        workoutSessions,
        sleepSessions,
        sleepHabitLogs,
        dailyProgressEntries,
        recipes,
        workouts,
        cachedFoods,
        customFoods,
        mealItems,
        recentFoods,
        favoriteFoods
      ];
}

typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  required String id,
  required DateTime dateOfBirth,
  required String sex,
  required double heightCm,
  required double weightKg,
  Value<double?> targetWeightKg,
  required String activityLevel,
  required String longevityAmbition,
  required String fitnessLevel,
  required String dietaryRestrictions,
  required String medicalConditions,
  required String equipment,
  required int preferredWorkoutMinutes,
  required String wakeTime,
  required bool healthDisclaimerAccepted,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<String> id,
  Value<DateTime> dateOfBirth,
  Value<String> sex,
  Value<double> heightCm,
  Value<double> weightKg,
  Value<double?> targetWeightKg,
  Value<String> activityLevel,
  Value<String> longevityAmbition,
  Value<String> fitnessLevel,
  Value<String> dietaryRestrictions,
  Value<String> medicalConditions,
  Value<String> equipment,
  Value<int> preferredWorkoutMinutes,
  Value<String> wakeTime,
  Value<bool> healthDisclaimerAccepted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get targetWeightKg => $composableBuilder(
      column: $table.targetWeightKg,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activityLevel => $composableBuilder(
      column: $table.activityLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get longevityAmbition => $composableBuilder(
      column: $table.longevityAmbition,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fitnessLevel => $composableBuilder(
      column: $table.fitnessLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dietaryRestrictions => $composableBuilder(
      column: $table.dietaryRestrictions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get medicalConditions => $composableBuilder(
      column: $table.medicalConditions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get preferredWorkoutMinutes => $composableBuilder(
      column: $table.preferredWorkoutMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wakeTime => $composableBuilder(
      column: $table.wakeTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get healthDisclaimerAccepted => $composableBuilder(
      column: $table.healthDisclaimerAccepted,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get targetWeightKg => $composableBuilder(
      column: $table.targetWeightKg,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activityLevel => $composableBuilder(
      column: $table.activityLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get longevityAmbition => $composableBuilder(
      column: $table.longevityAmbition,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fitnessLevel => $composableBuilder(
      column: $table.fitnessLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dietaryRestrictions => $composableBuilder(
      column: $table.dietaryRestrictions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medicalConditions => $composableBuilder(
      column: $table.medicalConditions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get preferredWorkoutMinutes => $composableBuilder(
      column: $table.preferredWorkoutMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wakeTime => $composableBuilder(
      column: $table.wakeTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get healthDisclaimerAccepted => $composableBuilder(
      column: $table.healthDisclaimerAccepted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get targetWeightKg => $composableBuilder(
      column: $table.targetWeightKg, builder: (column) => column);

  GeneratedColumn<String> get activityLevel => $composableBuilder(
      column: $table.activityLevel, builder: (column) => column);

  GeneratedColumn<String> get longevityAmbition => $composableBuilder(
      column: $table.longevityAmbition, builder: (column) => column);

  GeneratedColumn<String> get fitnessLevel => $composableBuilder(
      column: $table.fitnessLevel, builder: (column) => column);

  GeneratedColumn<String> get dietaryRestrictions => $composableBuilder(
      column: $table.dietaryRestrictions, builder: (column) => column);

  GeneratedColumn<String> get medicalConditions => $composableBuilder(
      column: $table.medicalConditions, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<int> get preferredWorkoutMinutes => $composableBuilder(
      column: $table.preferredWorkoutMinutes, builder: (column) => column);

  GeneratedColumn<String> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<bool> get healthDisclaimerAccepted => $composableBuilder(
      column: $table.healthDisclaimerAccepted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> dateOfBirth = const Value.absent(),
            Value<String> sex = const Value.absent(),
            Value<double> heightCm = const Value.absent(),
            Value<double> weightKg = const Value.absent(),
            Value<double?> targetWeightKg = const Value.absent(),
            Value<String> activityLevel = const Value.absent(),
            Value<String> longevityAmbition = const Value.absent(),
            Value<String> fitnessLevel = const Value.absent(),
            Value<String> dietaryRestrictions = const Value.absent(),
            Value<String> medicalConditions = const Value.absent(),
            Value<String> equipment = const Value.absent(),
            Value<int> preferredWorkoutMinutes = const Value.absent(),
            Value<String> wakeTime = const Value.absent(),
            Value<bool> healthDisclaimerAccepted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            dateOfBirth: dateOfBirth,
            sex: sex,
            heightCm: heightCm,
            weightKg: weightKg,
            targetWeightKg: targetWeightKg,
            activityLevel: activityLevel,
            longevityAmbition: longevityAmbition,
            fitnessLevel: fitnessLevel,
            dietaryRestrictions: dietaryRestrictions,
            medicalConditions: medicalConditions,
            equipment: equipment,
            preferredWorkoutMinutes: preferredWorkoutMinutes,
            wakeTime: wakeTime,
            healthDisclaimerAccepted: healthDisclaimerAccepted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime dateOfBirth,
            required String sex,
            required double heightCm,
            required double weightKg,
            Value<double?> targetWeightKg = const Value.absent(),
            required String activityLevel,
            required String longevityAmbition,
            required String fitnessLevel,
            required String dietaryRestrictions,
            required String medicalConditions,
            required String equipment,
            required int preferredWorkoutMinutes,
            required String wakeTime,
            required bool healthDisclaimerAccepted,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            dateOfBirth: dateOfBirth,
            sex: sex,
            heightCm: heightCm,
            weightKg: weightKg,
            targetWeightKg: targetWeightKg,
            activityLevel: activityLevel,
            longevityAmbition: longevityAmbition,
            fitnessLevel: fitnessLevel,
            dietaryRestrictions: dietaryRestrictions,
            medicalConditions: medicalConditions,
            equipment: equipment,
            preferredWorkoutMinutes: preferredWorkoutMinutes,
            wakeTime: wakeTime,
            healthDisclaimerAccepted: healthDisclaimerAccepted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfile,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfile,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>
    ),
    UserProfile,
    PrefetchHooks Function()>;
typedef $$DailyProtocolsTableCreateCompanionBuilder = DailyProtocolsCompanion
    Function({
  required String id,
  required DateTime date,
  required int targetCalories,
  required int targetProtein,
  required int targetCarbs,
  required int targetFat,
  required String eatingWindowStart,
  required String eatingWindowEnd,
  required int exerciseTargetMinutes,
  Value<String?> scheduledWorkoutId,
  required int estimatedCaloriesBurn,
  required bool isRestDay,
  required String targetBedtime,
  required String targetWakeTime,
  required int targetSleepMinutes,
  required String windDownStart,
  required String lastCaffeineCutoff,
  required String lastMealCutoff,
  required String supplements,
  required DateTime generatedAt,
  Value<int> rowid,
});
typedef $$DailyProtocolsTableUpdateCompanionBuilder = DailyProtocolsCompanion
    Function({
  Value<String> id,
  Value<DateTime> date,
  Value<int> targetCalories,
  Value<int> targetProtein,
  Value<int> targetCarbs,
  Value<int> targetFat,
  Value<String> eatingWindowStart,
  Value<String> eatingWindowEnd,
  Value<int> exerciseTargetMinutes,
  Value<String?> scheduledWorkoutId,
  Value<int> estimatedCaloriesBurn,
  Value<bool> isRestDay,
  Value<String> targetBedtime,
  Value<String> targetWakeTime,
  Value<int> targetSleepMinutes,
  Value<String> windDownStart,
  Value<String> lastCaffeineCutoff,
  Value<String> lastMealCutoff,
  Value<String> supplements,
  Value<DateTime> generatedAt,
  Value<int> rowid,
});

class $$DailyProtocolsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyProtocolsTable> {
  $$DailyProtocolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetCalories => $composableBuilder(
      column: $table.targetCalories,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetProtein => $composableBuilder(
      column: $table.targetProtein, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetCarbs => $composableBuilder(
      column: $table.targetCarbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetFat => $composableBuilder(
      column: $table.targetFat, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eatingWindowStart => $composableBuilder(
      column: $table.eatingWindowStart,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eatingWindowEnd => $composableBuilder(
      column: $table.eatingWindowEnd,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseTargetMinutes => $composableBuilder(
      column: $table.exerciseTargetMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scheduledWorkoutId => $composableBuilder(
      column: $table.scheduledWorkoutId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedCaloriesBurn => $composableBuilder(
      column: $table.estimatedCaloriesBurn,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRestDay => $composableBuilder(
      column: $table.isRestDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetBedtime => $composableBuilder(
      column: $table.targetBedtime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetWakeTime => $composableBuilder(
      column: $table.targetWakeTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetSleepMinutes => $composableBuilder(
      column: $table.targetSleepMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get windDownStart => $composableBuilder(
      column: $table.windDownStart, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastCaffeineCutoff => $composableBuilder(
      column: $table.lastCaffeineCutoff,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastMealCutoff => $composableBuilder(
      column: $table.lastMealCutoff,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplements => $composableBuilder(
      column: $table.supplements, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));
}

class $$DailyProtocolsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyProtocolsTable> {
  $$DailyProtocolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetCalories => $composableBuilder(
      column: $table.targetCalories,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetProtein => $composableBuilder(
      column: $table.targetProtein,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetCarbs => $composableBuilder(
      column: $table.targetCarbs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetFat => $composableBuilder(
      column: $table.targetFat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eatingWindowStart => $composableBuilder(
      column: $table.eatingWindowStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eatingWindowEnd => $composableBuilder(
      column: $table.eatingWindowEnd,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseTargetMinutes => $composableBuilder(
      column: $table.exerciseTargetMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scheduledWorkoutId => $composableBuilder(
      column: $table.scheduledWorkoutId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedCaloriesBurn => $composableBuilder(
      column: $table.estimatedCaloriesBurn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRestDay => $composableBuilder(
      column: $table.isRestDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetBedtime => $composableBuilder(
      column: $table.targetBedtime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetWakeTime => $composableBuilder(
      column: $table.targetWakeTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetSleepMinutes => $composableBuilder(
      column: $table.targetSleepMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get windDownStart => $composableBuilder(
      column: $table.windDownStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastCaffeineCutoff => $composableBuilder(
      column: $table.lastCaffeineCutoff,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastMealCutoff => $composableBuilder(
      column: $table.lastMealCutoff,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplements => $composableBuilder(
      column: $table.supplements, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DailyProtocolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyProtocolsTable> {
  $$DailyProtocolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get targetCalories => $composableBuilder(
      column: $table.targetCalories, builder: (column) => column);

  GeneratedColumn<int> get targetProtein => $composableBuilder(
      column: $table.targetProtein, builder: (column) => column);

  GeneratedColumn<int> get targetCarbs => $composableBuilder(
      column: $table.targetCarbs, builder: (column) => column);

  GeneratedColumn<int> get targetFat =>
      $composableBuilder(column: $table.targetFat, builder: (column) => column);

  GeneratedColumn<String> get eatingWindowStart => $composableBuilder(
      column: $table.eatingWindowStart, builder: (column) => column);

  GeneratedColumn<String> get eatingWindowEnd => $composableBuilder(
      column: $table.eatingWindowEnd, builder: (column) => column);

  GeneratedColumn<int> get exerciseTargetMinutes => $composableBuilder(
      column: $table.exerciseTargetMinutes, builder: (column) => column);

  GeneratedColumn<String> get scheduledWorkoutId => $composableBuilder(
      column: $table.scheduledWorkoutId, builder: (column) => column);

  GeneratedColumn<int> get estimatedCaloriesBurn => $composableBuilder(
      column: $table.estimatedCaloriesBurn, builder: (column) => column);

  GeneratedColumn<bool> get isRestDay =>
      $composableBuilder(column: $table.isRestDay, builder: (column) => column);

  GeneratedColumn<String> get targetBedtime => $composableBuilder(
      column: $table.targetBedtime, builder: (column) => column);

  GeneratedColumn<String> get targetWakeTime => $composableBuilder(
      column: $table.targetWakeTime, builder: (column) => column);

  GeneratedColumn<int> get targetSleepMinutes => $composableBuilder(
      column: $table.targetSleepMinutes, builder: (column) => column);

  GeneratedColumn<String> get windDownStart => $composableBuilder(
      column: $table.windDownStart, builder: (column) => column);

  GeneratedColumn<String> get lastCaffeineCutoff => $composableBuilder(
      column: $table.lastCaffeineCutoff, builder: (column) => column);

  GeneratedColumn<String> get lastMealCutoff => $composableBuilder(
      column: $table.lastMealCutoff, builder: (column) => column);

  GeneratedColumn<String> get supplements => $composableBuilder(
      column: $table.supplements, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);
}

class $$DailyProtocolsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyProtocolsTable,
    DailyProtocol,
    $$DailyProtocolsTableFilterComposer,
    $$DailyProtocolsTableOrderingComposer,
    $$DailyProtocolsTableAnnotationComposer,
    $$DailyProtocolsTableCreateCompanionBuilder,
    $$DailyProtocolsTableUpdateCompanionBuilder,
    (
      DailyProtocol,
      BaseReferences<_$AppDatabase, $DailyProtocolsTable, DailyProtocol>
    ),
    DailyProtocol,
    PrefetchHooks Function()> {
  $$DailyProtocolsTableTableManager(
      _$AppDatabase db, $DailyProtocolsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyProtocolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyProtocolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyProtocolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> targetCalories = const Value.absent(),
            Value<int> targetProtein = const Value.absent(),
            Value<int> targetCarbs = const Value.absent(),
            Value<int> targetFat = const Value.absent(),
            Value<String> eatingWindowStart = const Value.absent(),
            Value<String> eatingWindowEnd = const Value.absent(),
            Value<int> exerciseTargetMinutes = const Value.absent(),
            Value<String?> scheduledWorkoutId = const Value.absent(),
            Value<int> estimatedCaloriesBurn = const Value.absent(),
            Value<bool> isRestDay = const Value.absent(),
            Value<String> targetBedtime = const Value.absent(),
            Value<String> targetWakeTime = const Value.absent(),
            Value<int> targetSleepMinutes = const Value.absent(),
            Value<String> windDownStart = const Value.absent(),
            Value<String> lastCaffeineCutoff = const Value.absent(),
            Value<String> lastMealCutoff = const Value.absent(),
            Value<String> supplements = const Value.absent(),
            Value<DateTime> generatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyProtocolsCompanion(
            id: id,
            date: date,
            targetCalories: targetCalories,
            targetProtein: targetProtein,
            targetCarbs: targetCarbs,
            targetFat: targetFat,
            eatingWindowStart: eatingWindowStart,
            eatingWindowEnd: eatingWindowEnd,
            exerciseTargetMinutes: exerciseTargetMinutes,
            scheduledWorkoutId: scheduledWorkoutId,
            estimatedCaloriesBurn: estimatedCaloriesBurn,
            isRestDay: isRestDay,
            targetBedtime: targetBedtime,
            targetWakeTime: targetWakeTime,
            targetSleepMinutes: targetSleepMinutes,
            windDownStart: windDownStart,
            lastCaffeineCutoff: lastCaffeineCutoff,
            lastMealCutoff: lastMealCutoff,
            supplements: supplements,
            generatedAt: generatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            required int targetCalories,
            required int targetProtein,
            required int targetCarbs,
            required int targetFat,
            required String eatingWindowStart,
            required String eatingWindowEnd,
            required int exerciseTargetMinutes,
            Value<String?> scheduledWorkoutId = const Value.absent(),
            required int estimatedCaloriesBurn,
            required bool isRestDay,
            required String targetBedtime,
            required String targetWakeTime,
            required int targetSleepMinutes,
            required String windDownStart,
            required String lastCaffeineCutoff,
            required String lastMealCutoff,
            required String supplements,
            required DateTime generatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyProtocolsCompanion.insert(
            id: id,
            date: date,
            targetCalories: targetCalories,
            targetProtein: targetProtein,
            targetCarbs: targetCarbs,
            targetFat: targetFat,
            eatingWindowStart: eatingWindowStart,
            eatingWindowEnd: eatingWindowEnd,
            exerciseTargetMinutes: exerciseTargetMinutes,
            scheduledWorkoutId: scheduledWorkoutId,
            estimatedCaloriesBurn: estimatedCaloriesBurn,
            isRestDay: isRestDay,
            targetBedtime: targetBedtime,
            targetWakeTime: targetWakeTime,
            targetSleepMinutes: targetSleepMinutes,
            windDownStart: windDownStart,
            lastCaffeineCutoff: lastCaffeineCutoff,
            lastMealCutoff: lastMealCutoff,
            supplements: supplements,
            generatedAt: generatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyProtocolsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyProtocolsTable,
    DailyProtocol,
    $$DailyProtocolsTableFilterComposer,
    $$DailyProtocolsTableOrderingComposer,
    $$DailyProtocolsTableAnnotationComposer,
    $$DailyProtocolsTableCreateCompanionBuilder,
    $$DailyProtocolsTableUpdateCompanionBuilder,
    (
      DailyProtocol,
      BaseReferences<_$AppDatabase, $DailyProtocolsTable, DailyProtocol>
    ),
    DailyProtocol,
    PrefetchHooks Function()>;
typedef $$MealEntriesTableCreateCompanionBuilder = MealEntriesCompanion
    Function({
  required String id,
  required String oderId,
  required DateTime timestamp,
  required String mealType,
  required String itemsJson,
  required int totalCalories,
  required double totalProtein,
  required double totalCarbs,
  required double totalFat,
  required String source,
  Value<int> rowid,
});
typedef $$MealEntriesTableUpdateCompanionBuilder = MealEntriesCompanion
    Function({
  Value<String> id,
  Value<String> oderId,
  Value<DateTime> timestamp,
  Value<String> mealType,
  Value<String> itemsJson,
  Value<int> totalCalories,
  Value<double> totalProtein,
  Value<double> totalCarbs,
  Value<double> totalFat,
  Value<String> source,
  Value<int> rowid,
});

class $$MealEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealType => $composableBuilder(
      column: $table.mealType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemsJson => $composableBuilder(
      column: $table.itemsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCalories => $composableBuilder(
      column: $table.totalCalories, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalProtein => $composableBuilder(
      column: $table.totalProtein, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalCarbs => $composableBuilder(
      column: $table.totalCarbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalFat => $composableBuilder(
      column: $table.totalFat, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));
}

class $$MealEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealType => $composableBuilder(
      column: $table.mealType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemsJson => $composableBuilder(
      column: $table.itemsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCalories => $composableBuilder(
      column: $table.totalCalories,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalProtein => $composableBuilder(
      column: $table.totalProtein,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalCarbs => $composableBuilder(
      column: $table.totalCarbs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalFat => $composableBuilder(
      column: $table.totalFat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));
}

class $$MealEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oderId =>
      $composableBuilder(column: $table.oderId, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<String> get itemsJson =>
      $composableBuilder(column: $table.itemsJson, builder: (column) => column);

  GeneratedColumn<int> get totalCalories => $composableBuilder(
      column: $table.totalCalories, builder: (column) => column);

  GeneratedColumn<double> get totalProtein => $composableBuilder(
      column: $table.totalProtein, builder: (column) => column);

  GeneratedColumn<double> get totalCarbs => $composableBuilder(
      column: $table.totalCarbs, builder: (column) => column);

  GeneratedColumn<double> get totalFat =>
      $composableBuilder(column: $table.totalFat, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$MealEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealEntriesTable,
    MealEntry,
    $$MealEntriesTableFilterComposer,
    $$MealEntriesTableOrderingComposer,
    $$MealEntriesTableAnnotationComposer,
    $$MealEntriesTableCreateCompanionBuilder,
    $$MealEntriesTableUpdateCompanionBuilder,
    (MealEntry, BaseReferences<_$AppDatabase, $MealEntriesTable, MealEntry>),
    MealEntry,
    PrefetchHooks Function()> {
  $$MealEntriesTableTableManager(_$AppDatabase db, $MealEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> oderId = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> mealType = const Value.absent(),
            Value<String> itemsJson = const Value.absent(),
            Value<int> totalCalories = const Value.absent(),
            Value<double> totalProtein = const Value.absent(),
            Value<double> totalCarbs = const Value.absent(),
            Value<double> totalFat = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealEntriesCompanion(
            id: id,
            oderId: oderId,
            timestamp: timestamp,
            mealType: mealType,
            itemsJson: itemsJson,
            totalCalories: totalCalories,
            totalProtein: totalProtein,
            totalCarbs: totalCarbs,
            totalFat: totalFat,
            source: source,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String oderId,
            required DateTime timestamp,
            required String mealType,
            required String itemsJson,
            required int totalCalories,
            required double totalProtein,
            required double totalCarbs,
            required double totalFat,
            required String source,
            Value<int> rowid = const Value.absent(),
          }) =>
              MealEntriesCompanion.insert(
            id: id,
            oderId: oderId,
            timestamp: timestamp,
            mealType: mealType,
            itemsJson: itemsJson,
            totalCalories: totalCalories,
            totalProtein: totalProtein,
            totalCarbs: totalCarbs,
            totalFat: totalFat,
            source: source,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MealEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealEntriesTable,
    MealEntry,
    $$MealEntriesTableFilterComposer,
    $$MealEntriesTableOrderingComposer,
    $$MealEntriesTableAnnotationComposer,
    $$MealEntriesTableCreateCompanionBuilder,
    $$MealEntriesTableUpdateCompanionBuilder,
    (MealEntry, BaseReferences<_$AppDatabase, $MealEntriesTable, MealEntry>),
    MealEntry,
    PrefetchHooks Function()>;
typedef $$WorkoutSessionsTableCreateCompanionBuilder = WorkoutSessionsCompanion
    Function({
  required String id,
  required String oderId,
  Value<String?> workoutId,
  required DateTime startTime,
  required DateTime endTime,
  required int durationMinutes,
  required int caloriesBurned,
  required String category,
  Value<double?> averageHeartRate,
  Value<double?> maxHeartRate,
  Value<double?> distanceMeters,
  required String source,
  Value<String?> externalId,
  Value<int> rowid,
});
typedef $$WorkoutSessionsTableUpdateCompanionBuilder = WorkoutSessionsCompanion
    Function({
  Value<String> id,
  Value<String> oderId,
  Value<String?> workoutId,
  Value<DateTime> startTime,
  Value<DateTime> endTime,
  Value<int> durationMinutes,
  Value<int> caloriesBurned,
  Value<String> category,
  Value<double?> averageHeartRate,
  Value<double?> maxHeartRate,
  Value<double?> distanceMeters,
  Value<String> source,
  Value<String?> externalId,
  Value<int> rowid,
});

class $$WorkoutSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workoutId => $composableBuilder(
      column: $table.workoutId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get averageHeartRate => $composableBuilder(
      column: $table.averageHeartRate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxHeartRate => $composableBuilder(
      column: $table.maxHeartRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get distanceMeters => $composableBuilder(
      column: $table.distanceMeters,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));
}

class $$WorkoutSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workoutId => $composableBuilder(
      column: $table.workoutId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get averageHeartRate => $composableBuilder(
      column: $table.averageHeartRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxHeartRate => $composableBuilder(
      column: $table.maxHeartRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get distanceMeters => $composableBuilder(
      column: $table.distanceMeters,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oderId =>
      $composableBuilder(column: $table.oderId, builder: (column) => column);

  GeneratedColumn<String> get workoutId =>
      $composableBuilder(column: $table.workoutId, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<int> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get averageHeartRate => $composableBuilder(
      column: $table.averageHeartRate, builder: (column) => column);

  GeneratedColumn<double> get maxHeartRate => $composableBuilder(
      column: $table.maxHeartRate, builder: (column) => column);

  GeneratedColumn<double> get distanceMeters => $composableBuilder(
      column: $table.distanceMeters, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);
}

class $$WorkoutSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutSessionsTable,
    WorkoutSession,
    $$WorkoutSessionsTableFilterComposer,
    $$WorkoutSessionsTableOrderingComposer,
    $$WorkoutSessionsTableAnnotationComposer,
    $$WorkoutSessionsTableCreateCompanionBuilder,
    $$WorkoutSessionsTableUpdateCompanionBuilder,
    (
      WorkoutSession,
      BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSession>
    ),
    WorkoutSession,
    PrefetchHooks Function()> {
  $$WorkoutSessionsTableTableManager(
      _$AppDatabase db, $WorkoutSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> oderId = const Value.absent(),
            Value<String?> workoutId = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime> endTime = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<int> caloriesBurned = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double?> averageHeartRate = const Value.absent(),
            Value<double?> maxHeartRate = const Value.absent(),
            Value<double?> distanceMeters = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String?> externalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutSessionsCompanion(
            id: id,
            oderId: oderId,
            workoutId: workoutId,
            startTime: startTime,
            endTime: endTime,
            durationMinutes: durationMinutes,
            caloriesBurned: caloriesBurned,
            category: category,
            averageHeartRate: averageHeartRate,
            maxHeartRate: maxHeartRate,
            distanceMeters: distanceMeters,
            source: source,
            externalId: externalId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String oderId,
            Value<String?> workoutId = const Value.absent(),
            required DateTime startTime,
            required DateTime endTime,
            required int durationMinutes,
            required int caloriesBurned,
            required String category,
            Value<double?> averageHeartRate = const Value.absent(),
            Value<double?> maxHeartRate = const Value.absent(),
            Value<double?> distanceMeters = const Value.absent(),
            required String source,
            Value<String?> externalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutSessionsCompanion.insert(
            id: id,
            oderId: oderId,
            workoutId: workoutId,
            startTime: startTime,
            endTime: endTime,
            durationMinutes: durationMinutes,
            caloriesBurned: caloriesBurned,
            category: category,
            averageHeartRate: averageHeartRate,
            maxHeartRate: maxHeartRate,
            distanceMeters: distanceMeters,
            source: source,
            externalId: externalId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutSessionsTable,
    WorkoutSession,
    $$WorkoutSessionsTableFilterComposer,
    $$WorkoutSessionsTableOrderingComposer,
    $$WorkoutSessionsTableAnnotationComposer,
    $$WorkoutSessionsTableCreateCompanionBuilder,
    $$WorkoutSessionsTableUpdateCompanionBuilder,
    (
      WorkoutSession,
      BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSession>
    ),
    WorkoutSession,
    PrefetchHooks Function()>;
typedef $$SleepSessionsTableCreateCompanionBuilder = SleepSessionsCompanion
    Function({
  required String id,
  required String oderId,
  required DateTime bedTime,
  required DateTime wakeTime,
  required int totalMinutes,
  required int deepSleepMinutes,
  required int lightSleepMinutes,
  required int remSleepMinutes,
  required int awakeMinutes,
  required double efficiency,
  required int latencyMinutes,
  required int sleepScore,
  required String source,
  Value<String?> externalId,
  Value<int> rowid,
});
typedef $$SleepSessionsTableUpdateCompanionBuilder = SleepSessionsCompanion
    Function({
  Value<String> id,
  Value<String> oderId,
  Value<DateTime> bedTime,
  Value<DateTime> wakeTime,
  Value<int> totalMinutes,
  Value<int> deepSleepMinutes,
  Value<int> lightSleepMinutes,
  Value<int> remSleepMinutes,
  Value<int> awakeMinutes,
  Value<double> efficiency,
  Value<int> latencyMinutes,
  Value<int> sleepScore,
  Value<String> source,
  Value<String?> externalId,
  Value<int> rowid,
});

class $$SleepSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SleepSessionsTable> {
  $$SleepSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get bedTime => $composableBuilder(
      column: $table.bedTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get wakeTime => $composableBuilder(
      column: $table.wakeTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalMinutes => $composableBuilder(
      column: $table.totalMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deepSleepMinutes => $composableBuilder(
      column: $table.deepSleepMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lightSleepMinutes => $composableBuilder(
      column: $table.lightSleepMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remSleepMinutes => $composableBuilder(
      column: $table.remSleepMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get awakeMinutes => $composableBuilder(
      column: $table.awakeMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get efficiency => $composableBuilder(
      column: $table.efficiency, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get latencyMinutes => $composableBuilder(
      column: $table.latencyMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepScore => $composableBuilder(
      column: $table.sleepScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));
}

class $$SleepSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SleepSessionsTable> {
  $$SleepSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get bedTime => $composableBuilder(
      column: $table.bedTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get wakeTime => $composableBuilder(
      column: $table.wakeTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalMinutes => $composableBuilder(
      column: $table.totalMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deepSleepMinutes => $composableBuilder(
      column: $table.deepSleepMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lightSleepMinutes => $composableBuilder(
      column: $table.lightSleepMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remSleepMinutes => $composableBuilder(
      column: $table.remSleepMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get awakeMinutes => $composableBuilder(
      column: $table.awakeMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get efficiency => $composableBuilder(
      column: $table.efficiency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get latencyMinutes => $composableBuilder(
      column: $table.latencyMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepScore => $composableBuilder(
      column: $table.sleepScore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));
}

class $$SleepSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SleepSessionsTable> {
  $$SleepSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oderId =>
      $composableBuilder(column: $table.oderId, builder: (column) => column);

  GeneratedColumn<DateTime> get bedTime =>
      $composableBuilder(column: $table.bedTime, builder: (column) => column);

  GeneratedColumn<DateTime> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<int> get totalMinutes => $composableBuilder(
      column: $table.totalMinutes, builder: (column) => column);

  GeneratedColumn<int> get deepSleepMinutes => $composableBuilder(
      column: $table.deepSleepMinutes, builder: (column) => column);

  GeneratedColumn<int> get lightSleepMinutes => $composableBuilder(
      column: $table.lightSleepMinutes, builder: (column) => column);

  GeneratedColumn<int> get remSleepMinutes => $composableBuilder(
      column: $table.remSleepMinutes, builder: (column) => column);

  GeneratedColumn<int> get awakeMinutes => $composableBuilder(
      column: $table.awakeMinutes, builder: (column) => column);

  GeneratedColumn<double> get efficiency => $composableBuilder(
      column: $table.efficiency, builder: (column) => column);

  GeneratedColumn<int> get latencyMinutes => $composableBuilder(
      column: $table.latencyMinutes, builder: (column) => column);

  GeneratedColumn<int> get sleepScore => $composableBuilder(
      column: $table.sleepScore, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);
}

class $$SleepSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SleepSessionsTable,
    SleepSession,
    $$SleepSessionsTableFilterComposer,
    $$SleepSessionsTableOrderingComposer,
    $$SleepSessionsTableAnnotationComposer,
    $$SleepSessionsTableCreateCompanionBuilder,
    $$SleepSessionsTableUpdateCompanionBuilder,
    (
      SleepSession,
      BaseReferences<_$AppDatabase, $SleepSessionsTable, SleepSession>
    ),
    SleepSession,
    PrefetchHooks Function()> {
  $$SleepSessionsTableTableManager(_$AppDatabase db, $SleepSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SleepSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SleepSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SleepSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> oderId = const Value.absent(),
            Value<DateTime> bedTime = const Value.absent(),
            Value<DateTime> wakeTime = const Value.absent(),
            Value<int> totalMinutes = const Value.absent(),
            Value<int> deepSleepMinutes = const Value.absent(),
            Value<int> lightSleepMinutes = const Value.absent(),
            Value<int> remSleepMinutes = const Value.absent(),
            Value<int> awakeMinutes = const Value.absent(),
            Value<double> efficiency = const Value.absent(),
            Value<int> latencyMinutes = const Value.absent(),
            Value<int> sleepScore = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String?> externalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SleepSessionsCompanion(
            id: id,
            oderId: oderId,
            bedTime: bedTime,
            wakeTime: wakeTime,
            totalMinutes: totalMinutes,
            deepSleepMinutes: deepSleepMinutes,
            lightSleepMinutes: lightSleepMinutes,
            remSleepMinutes: remSleepMinutes,
            awakeMinutes: awakeMinutes,
            efficiency: efficiency,
            latencyMinutes: latencyMinutes,
            sleepScore: sleepScore,
            source: source,
            externalId: externalId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String oderId,
            required DateTime bedTime,
            required DateTime wakeTime,
            required int totalMinutes,
            required int deepSleepMinutes,
            required int lightSleepMinutes,
            required int remSleepMinutes,
            required int awakeMinutes,
            required double efficiency,
            required int latencyMinutes,
            required int sleepScore,
            required String source,
            Value<String?> externalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SleepSessionsCompanion.insert(
            id: id,
            oderId: oderId,
            bedTime: bedTime,
            wakeTime: wakeTime,
            totalMinutes: totalMinutes,
            deepSleepMinutes: deepSleepMinutes,
            lightSleepMinutes: lightSleepMinutes,
            remSleepMinutes: remSleepMinutes,
            awakeMinutes: awakeMinutes,
            efficiency: efficiency,
            latencyMinutes: latencyMinutes,
            sleepScore: sleepScore,
            source: source,
            externalId: externalId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SleepSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SleepSessionsTable,
    SleepSession,
    $$SleepSessionsTableFilterComposer,
    $$SleepSessionsTableOrderingComposer,
    $$SleepSessionsTableAnnotationComposer,
    $$SleepSessionsTableCreateCompanionBuilder,
    $$SleepSessionsTableUpdateCompanionBuilder,
    (
      SleepSession,
      BaseReferences<_$AppDatabase, $SleepSessionsTable, SleepSession>
    ),
    SleepSession,
    PrefetchHooks Function()>;
typedef $$SleepHabitLogsTableCreateCompanionBuilder = SleepHabitLogsCompanion
    Function({
  required String id,
  required String oderId,
  required DateTime date,
  required bool noCaffeineAfterCutoff,
  required bool lastMealOnTime,
  required bool screenFreeBeforeBed,
  required bool roomTempOptimal,
  required bool meditationCompleted,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$SleepHabitLogsTableUpdateCompanionBuilder = SleepHabitLogsCompanion
    Function({
  Value<String> id,
  Value<String> oderId,
  Value<DateTime> date,
  Value<bool> noCaffeineAfterCutoff,
  Value<bool> lastMealOnTime,
  Value<bool> screenFreeBeforeBed,
  Value<bool> roomTempOptimal,
  Value<bool> meditationCompleted,
  Value<String?> notes,
  Value<int> rowid,
});

class $$SleepHabitLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SleepHabitLogsTable> {
  $$SleepHabitLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get noCaffeineAfterCutoff => $composableBuilder(
      column: $table.noCaffeineAfterCutoff,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get lastMealOnTime => $composableBuilder(
      column: $table.lastMealOnTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get screenFreeBeforeBed => $composableBuilder(
      column: $table.screenFreeBeforeBed,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get roomTempOptimal => $composableBuilder(
      column: $table.roomTempOptimal,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get meditationCompleted => $composableBuilder(
      column: $table.meditationCompleted,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$SleepHabitLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SleepHabitLogsTable> {
  $$SleepHabitLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get oderId => $composableBuilder(
      column: $table.oderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get noCaffeineAfterCutoff => $composableBuilder(
      column: $table.noCaffeineAfterCutoff,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get lastMealOnTime => $composableBuilder(
      column: $table.lastMealOnTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get screenFreeBeforeBed => $composableBuilder(
      column: $table.screenFreeBeforeBed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get roomTempOptimal => $composableBuilder(
      column: $table.roomTempOptimal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get meditationCompleted => $composableBuilder(
      column: $table.meditationCompleted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$SleepHabitLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SleepHabitLogsTable> {
  $$SleepHabitLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oderId =>
      $composableBuilder(column: $table.oderId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get noCaffeineAfterCutoff => $composableBuilder(
      column: $table.noCaffeineAfterCutoff, builder: (column) => column);

  GeneratedColumn<bool> get lastMealOnTime => $composableBuilder(
      column: $table.lastMealOnTime, builder: (column) => column);

  GeneratedColumn<bool> get screenFreeBeforeBed => $composableBuilder(
      column: $table.screenFreeBeforeBed, builder: (column) => column);

  GeneratedColumn<bool> get roomTempOptimal => $composableBuilder(
      column: $table.roomTempOptimal, builder: (column) => column);

  GeneratedColumn<bool> get meditationCompleted => $composableBuilder(
      column: $table.meditationCompleted, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SleepHabitLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SleepHabitLogsTable,
    SleepHabitLog,
    $$SleepHabitLogsTableFilterComposer,
    $$SleepHabitLogsTableOrderingComposer,
    $$SleepHabitLogsTableAnnotationComposer,
    $$SleepHabitLogsTableCreateCompanionBuilder,
    $$SleepHabitLogsTableUpdateCompanionBuilder,
    (
      SleepHabitLog,
      BaseReferences<_$AppDatabase, $SleepHabitLogsTable, SleepHabitLog>
    ),
    SleepHabitLog,
    PrefetchHooks Function()> {
  $$SleepHabitLogsTableTableManager(
      _$AppDatabase db, $SleepHabitLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SleepHabitLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SleepHabitLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SleepHabitLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> oderId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<bool> noCaffeineAfterCutoff = const Value.absent(),
            Value<bool> lastMealOnTime = const Value.absent(),
            Value<bool> screenFreeBeforeBed = const Value.absent(),
            Value<bool> roomTempOptimal = const Value.absent(),
            Value<bool> meditationCompleted = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SleepHabitLogsCompanion(
            id: id,
            oderId: oderId,
            date: date,
            noCaffeineAfterCutoff: noCaffeineAfterCutoff,
            lastMealOnTime: lastMealOnTime,
            screenFreeBeforeBed: screenFreeBeforeBed,
            roomTempOptimal: roomTempOptimal,
            meditationCompleted: meditationCompleted,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String oderId,
            required DateTime date,
            required bool noCaffeineAfterCutoff,
            required bool lastMealOnTime,
            required bool screenFreeBeforeBed,
            required bool roomTempOptimal,
            required bool meditationCompleted,
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SleepHabitLogsCompanion.insert(
            id: id,
            oderId: oderId,
            date: date,
            noCaffeineAfterCutoff: noCaffeineAfterCutoff,
            lastMealOnTime: lastMealOnTime,
            screenFreeBeforeBed: screenFreeBeforeBed,
            roomTempOptimal: roomTempOptimal,
            meditationCompleted: meditationCompleted,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SleepHabitLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SleepHabitLogsTable,
    SleepHabitLog,
    $$SleepHabitLogsTableFilterComposer,
    $$SleepHabitLogsTableOrderingComposer,
    $$SleepHabitLogsTableAnnotationComposer,
    $$SleepHabitLogsTableCreateCompanionBuilder,
    $$SleepHabitLogsTableUpdateCompanionBuilder,
    (
      SleepHabitLog,
      BaseReferences<_$AppDatabase, $SleepHabitLogsTable, SleepHabitLog>
    ),
    SleepHabitLog,
    PrefetchHooks Function()>;
typedef $$DailyProgressEntriesTableCreateCompanionBuilder
    = DailyProgressEntriesCompanion Function({
  required String id,
  required DateTime date,
  required int caloriesConsumed,
  required int caloriesBurned,
  required int exerciseMinutes,
  required int sleepMinutes,
  required double proteinGrams,
  required double carbsGrams,
  required double fatGrams,
  required int stepsCount,
  Value<double?> weightKg,
  Value<int> rowid,
});
typedef $$DailyProgressEntriesTableUpdateCompanionBuilder
    = DailyProgressEntriesCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<int> caloriesConsumed,
  Value<int> caloriesBurned,
  Value<int> exerciseMinutes,
  Value<int> sleepMinutes,
  Value<double> proteinGrams,
  Value<double> carbsGrams,
  Value<double> fatGrams,
  Value<int> stepsCount,
  Value<double?> weightKg,
  Value<int> rowid,
});

class $$DailyProgressEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DailyProgressEntriesTable> {
  $$DailyProgressEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get caloriesConsumed => $composableBuilder(
      column: $table.caloriesConsumed,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseMinutes => $composableBuilder(
      column: $table.exerciseMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepMinutes => $composableBuilder(
      column: $table.sleepMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get proteinGrams => $composableBuilder(
      column: $table.proteinGrams, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbsGrams => $composableBuilder(
      column: $table.carbsGrams, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fatGrams => $composableBuilder(
      column: $table.fatGrams, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stepsCount => $composableBuilder(
      column: $table.stepsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));
}

class $$DailyProgressEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyProgressEntriesTable> {
  $$DailyProgressEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get caloriesConsumed => $composableBuilder(
      column: $table.caloriesConsumed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseMinutes => $composableBuilder(
      column: $table.exerciseMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepMinutes => $composableBuilder(
      column: $table.sleepMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get proteinGrams => $composableBuilder(
      column: $table.proteinGrams,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbsGrams => $composableBuilder(
      column: $table.carbsGrams, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fatGrams => $composableBuilder(
      column: $table.fatGrams, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stepsCount => $composableBuilder(
      column: $table.stepsCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));
}

class $$DailyProgressEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyProgressEntriesTable> {
  $$DailyProgressEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get caloriesConsumed => $composableBuilder(
      column: $table.caloriesConsumed, builder: (column) => column);

  GeneratedColumn<int> get caloriesBurned => $composableBuilder(
      column: $table.caloriesBurned, builder: (column) => column);

  GeneratedColumn<int> get exerciseMinutes => $composableBuilder(
      column: $table.exerciseMinutes, builder: (column) => column);

  GeneratedColumn<int> get sleepMinutes => $composableBuilder(
      column: $table.sleepMinutes, builder: (column) => column);

  GeneratedColumn<double> get proteinGrams => $composableBuilder(
      column: $table.proteinGrams, builder: (column) => column);

  GeneratedColumn<double> get carbsGrams => $composableBuilder(
      column: $table.carbsGrams, builder: (column) => column);

  GeneratedColumn<double> get fatGrams =>
      $composableBuilder(column: $table.fatGrams, builder: (column) => column);

  GeneratedColumn<int> get stepsCount => $composableBuilder(
      column: $table.stepsCount, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);
}

class $$DailyProgressEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyProgressEntriesTable,
    DailyProgressEntry,
    $$DailyProgressEntriesTableFilterComposer,
    $$DailyProgressEntriesTableOrderingComposer,
    $$DailyProgressEntriesTableAnnotationComposer,
    $$DailyProgressEntriesTableCreateCompanionBuilder,
    $$DailyProgressEntriesTableUpdateCompanionBuilder,
    (
      DailyProgressEntry,
      BaseReferences<_$AppDatabase, $DailyProgressEntriesTable,
          DailyProgressEntry>
    ),
    DailyProgressEntry,
    PrefetchHooks Function()> {
  $$DailyProgressEntriesTableTableManager(
      _$AppDatabase db, $DailyProgressEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyProgressEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyProgressEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyProgressEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> caloriesConsumed = const Value.absent(),
            Value<int> caloriesBurned = const Value.absent(),
            Value<int> exerciseMinutes = const Value.absent(),
            Value<int> sleepMinutes = const Value.absent(),
            Value<double> proteinGrams = const Value.absent(),
            Value<double> carbsGrams = const Value.absent(),
            Value<double> fatGrams = const Value.absent(),
            Value<int> stepsCount = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyProgressEntriesCompanion(
            id: id,
            date: date,
            caloriesConsumed: caloriesConsumed,
            caloriesBurned: caloriesBurned,
            exerciseMinutes: exerciseMinutes,
            sleepMinutes: sleepMinutes,
            proteinGrams: proteinGrams,
            carbsGrams: carbsGrams,
            fatGrams: fatGrams,
            stepsCount: stepsCount,
            weightKg: weightKg,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            required int caloriesConsumed,
            required int caloriesBurned,
            required int exerciseMinutes,
            required int sleepMinutes,
            required double proteinGrams,
            required double carbsGrams,
            required double fatGrams,
            required int stepsCount,
            Value<double?> weightKg = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyProgressEntriesCompanion.insert(
            id: id,
            date: date,
            caloriesConsumed: caloriesConsumed,
            caloriesBurned: caloriesBurned,
            exerciseMinutes: exerciseMinutes,
            sleepMinutes: sleepMinutes,
            proteinGrams: proteinGrams,
            carbsGrams: carbsGrams,
            fatGrams: fatGrams,
            stepsCount: stepsCount,
            weightKg: weightKg,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyProgressEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $DailyProgressEntriesTable,
        DailyProgressEntry,
        $$DailyProgressEntriesTableFilterComposer,
        $$DailyProgressEntriesTableOrderingComposer,
        $$DailyProgressEntriesTableAnnotationComposer,
        $$DailyProgressEntriesTableCreateCompanionBuilder,
        $$DailyProgressEntriesTableUpdateCompanionBuilder,
        (
          DailyProgressEntry,
          BaseReferences<_$AppDatabase, $DailyProgressEntriesTable,
              DailyProgressEntry>
        ),
        DailyProgressEntry,
        PrefetchHooks Function()>;
typedef $$RecipesTableCreateCompanionBuilder = RecipesCompanion Function({
  required String id,
  required String name,
  required String description,
  required String imageUrl,
  required int prepTimeMinutes,
  required int cookTimeMinutes,
  required int servings,
  required String ingredientsJson,
  required String instructionsJson,
  required int calories,
  required double protein,
  required double carbs,
  required double fat,
  Value<double?> fiber,
  Value<double?> sugar,
  required String dietaryTags,
  required String allergens,
  required String longevityRationale,
  required bool isBlueprintRecipe,
  Value<int> rowid,
});
typedef $$RecipesTableUpdateCompanionBuilder = RecipesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<String> imageUrl,
  Value<int> prepTimeMinutes,
  Value<int> cookTimeMinutes,
  Value<int> servings,
  Value<String> ingredientsJson,
  Value<String> instructionsJson,
  Value<int> calories,
  Value<double> protein,
  Value<double> carbs,
  Value<double> fat,
  Value<double?> fiber,
  Value<double?> sugar,
  Value<String> dietaryTags,
  Value<String> allergens,
  Value<String> longevityRationale,
  Value<bool> isBlueprintRecipe,
  Value<int> rowid,
});

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get prepTimeMinutes => $composableBuilder(
      column: $table.prepTimeMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cookTimeMinutes => $composableBuilder(
      column: $table.cookTimeMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructionsJson => $composableBuilder(
      column: $table.instructionsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fiber => $composableBuilder(
      column: $table.fiber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sugar => $composableBuilder(
      column: $table.sugar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dietaryTags => $composableBuilder(
      column: $table.dietaryTags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get allergens => $composableBuilder(
      column: $table.allergens, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get longevityRationale => $composableBuilder(
      column: $table.longevityRationale,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBlueprintRecipe => $composableBuilder(
      column: $table.isBlueprintRecipe,
      builder: (column) => ColumnFilters(column));
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get prepTimeMinutes => $composableBuilder(
      column: $table.prepTimeMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cookTimeMinutes => $composableBuilder(
      column: $table.cookTimeMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructionsJson => $composableBuilder(
      column: $table.instructionsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fiber => $composableBuilder(
      column: $table.fiber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sugar => $composableBuilder(
      column: $table.sugar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dietaryTags => $composableBuilder(
      column: $table.dietaryTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get allergens => $composableBuilder(
      column: $table.allergens, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get longevityRationale => $composableBuilder(
      column: $table.longevityRationale,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBlueprintRecipe => $composableBuilder(
      column: $table.isBlueprintRecipe,
      builder: (column) => ColumnOrderings(column));
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get prepTimeMinutes => $composableBuilder(
      column: $table.prepTimeMinutes, builder: (column) => column);

  GeneratedColumn<int> get cookTimeMinutes => $composableBuilder(
      column: $table.cookTimeMinutes, builder: (column) => column);

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
      column: $table.ingredientsJson, builder: (column) => column);

  GeneratedColumn<String> get instructionsJson => $composableBuilder(
      column: $table.instructionsJson, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get fiber =>
      $composableBuilder(column: $table.fiber, builder: (column) => column);

  GeneratedColumn<double> get sugar =>
      $composableBuilder(column: $table.sugar, builder: (column) => column);

  GeneratedColumn<String> get dietaryTags => $composableBuilder(
      column: $table.dietaryTags, builder: (column) => column);

  GeneratedColumn<String> get allergens =>
      $composableBuilder(column: $table.allergens, builder: (column) => column);

  GeneratedColumn<String> get longevityRationale => $composableBuilder(
      column: $table.longevityRationale, builder: (column) => column);

  GeneratedColumn<bool> get isBlueprintRecipe => $composableBuilder(
      column: $table.isBlueprintRecipe, builder: (column) => column);
}

class $$RecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
    Recipe,
    PrefetchHooks Function()> {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<int> prepTimeMinutes = const Value.absent(),
            Value<int> cookTimeMinutes = const Value.absent(),
            Value<int> servings = const Value.absent(),
            Value<String> ingredientsJson = const Value.absent(),
            Value<String> instructionsJson = const Value.absent(),
            Value<int> calories = const Value.absent(),
            Value<double> protein = const Value.absent(),
            Value<double> carbs = const Value.absent(),
            Value<double> fat = const Value.absent(),
            Value<double?> fiber = const Value.absent(),
            Value<double?> sugar = const Value.absent(),
            Value<String> dietaryTags = const Value.absent(),
            Value<String> allergens = const Value.absent(),
            Value<String> longevityRationale = const Value.absent(),
            Value<bool> isBlueprintRecipe = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipesCompanion(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            prepTimeMinutes: prepTimeMinutes,
            cookTimeMinutes: cookTimeMinutes,
            servings: servings,
            ingredientsJson: ingredientsJson,
            instructionsJson: instructionsJson,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            fiber: fiber,
            sugar: sugar,
            dietaryTags: dietaryTags,
            allergens: allergens,
            longevityRationale: longevityRationale,
            isBlueprintRecipe: isBlueprintRecipe,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String description,
            required String imageUrl,
            required int prepTimeMinutes,
            required int cookTimeMinutes,
            required int servings,
            required String ingredientsJson,
            required String instructionsJson,
            required int calories,
            required double protein,
            required double carbs,
            required double fat,
            Value<double?> fiber = const Value.absent(),
            Value<double?> sugar = const Value.absent(),
            required String dietaryTags,
            required String allergens,
            required String longevityRationale,
            required bool isBlueprintRecipe,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipesCompanion.insert(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            prepTimeMinutes: prepTimeMinutes,
            cookTimeMinutes: cookTimeMinutes,
            servings: servings,
            ingredientsJson: ingredientsJson,
            instructionsJson: instructionsJson,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            fiber: fiber,
            sugar: sugar,
            dietaryTags: dietaryTags,
            allergens: allergens,
            longevityRationale: longevityRationale,
            isBlueprintRecipe: isBlueprintRecipe,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
    Recipe,
    PrefetchHooks Function()>;
typedef $$WorkoutsTableCreateCompanionBuilder = WorkoutsCompanion Function({
  required String id,
  required String name,
  required String category,
  required int durationMinutes,
  required String difficulty,
  required String equipmentRequired,
  required int estimatedCalories,
  required String exercisesJson,
  Value<String?> videoUrl,
  Value<String?> thumbnailUrl,
  Value<int> rowid,
});
typedef $$WorkoutsTableUpdateCompanionBuilder = WorkoutsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> category,
  Value<int> durationMinutes,
  Value<String> difficulty,
  Value<String> equipmentRequired,
  Value<int> estimatedCalories,
  Value<String> exercisesJson,
  Value<String?> videoUrl,
  Value<String?> thumbnailUrl,
  Value<int> rowid,
});

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get equipmentRequired => $composableBuilder(
      column: $table.equipmentRequired,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get estimatedCalories => $composableBuilder(
      column: $table.estimatedCalories,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exercisesJson => $composableBuilder(
      column: $table.exercisesJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl, builder: (column) => ColumnFilters(column));
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get equipmentRequired => $composableBuilder(
      column: $table.equipmentRequired,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedCalories => $composableBuilder(
      column: $table.estimatedCalories,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exercisesJson => $composableBuilder(
      column: $table.exercisesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl,
      builder: (column) => ColumnOrderings(column));
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<String> get equipmentRequired => $composableBuilder(
      column: $table.equipmentRequired, builder: (column) => column);

  GeneratedColumn<int> get estimatedCalories => $composableBuilder(
      column: $table.estimatedCalories, builder: (column) => column);

  GeneratedColumn<String> get exercisesJson => $composableBuilder(
      column: $table.exercisesJson, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl, builder: (column) => column);
}

class $$WorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    Workout,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (Workout, BaseReferences<_$AppDatabase, $WorkoutsTable, Workout>),
    Workout,
    PrefetchHooks Function()> {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<String> difficulty = const Value.absent(),
            Value<String> equipmentRequired = const Value.absent(),
            Value<int> estimatedCalories = const Value.absent(),
            Value<String> exercisesJson = const Value.absent(),
            Value<String?> videoUrl = const Value.absent(),
            Value<String?> thumbnailUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsCompanion(
            id: id,
            name: name,
            category: category,
            durationMinutes: durationMinutes,
            difficulty: difficulty,
            equipmentRequired: equipmentRequired,
            estimatedCalories: estimatedCalories,
            exercisesJson: exercisesJson,
            videoUrl: videoUrl,
            thumbnailUrl: thumbnailUrl,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String category,
            required int durationMinutes,
            required String difficulty,
            required String equipmentRequired,
            required int estimatedCalories,
            required String exercisesJson,
            Value<String?> videoUrl = const Value.absent(),
            Value<String?> thumbnailUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsCompanion.insert(
            id: id,
            name: name,
            category: category,
            durationMinutes: durationMinutes,
            difficulty: difficulty,
            equipmentRequired: equipmentRequired,
            estimatedCalories: estimatedCalories,
            exercisesJson: exercisesJson,
            videoUrl: videoUrl,
            thumbnailUrl: thumbnailUrl,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    Workout,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (Workout, BaseReferences<_$AppDatabase, $WorkoutsTable, Workout>),
    Workout,
    PrefetchHooks Function()>;
typedef $$CachedFoodsTableCreateCompanionBuilder = CachedFoodsCompanion
    Function({
  required String id,
  required String name,
  Value<String?> brand,
  required double servingSize,
  required String servingUnit,
  required int calories,
  required double protein,
  required double carbs,
  required double fat,
  Value<double?> fiber,
  Value<double?> sugar,
  Value<double?> sodium,
  Value<String?> barcode,
  required String databaseSource,
  required DateTime cachedAt,
  Value<int> rowid,
});
typedef $$CachedFoodsTableUpdateCompanionBuilder = CachedFoodsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> brand,
  Value<double> servingSize,
  Value<String> servingUnit,
  Value<int> calories,
  Value<double> protein,
  Value<double> carbs,
  Value<double> fat,
  Value<double?> fiber,
  Value<double?> sugar,
  Value<double?> sodium,
  Value<String?> barcode,
  Value<String> databaseSource,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$CachedFoodsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedFoodsTable> {
  $$CachedFoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fiber => $composableBuilder(
      column: $table.fiber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sugar => $composableBuilder(
      column: $table.sugar, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sodium => $composableBuilder(
      column: $table.sodium, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get databaseSource => $composableBuilder(
      column: $table.databaseSource,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedFoodsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedFoodsTable> {
  $$CachedFoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fiber => $composableBuilder(
      column: $table.fiber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sugar => $composableBuilder(
      column: $table.sugar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sodium => $composableBuilder(
      column: $table.sodium, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get databaseSource => $composableBuilder(
      column: $table.databaseSource,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedFoodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedFoodsTable> {
  $$CachedFoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<double> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => column);

  GeneratedColumn<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get fiber =>
      $composableBuilder(column: $table.fiber, builder: (column) => column);

  GeneratedColumn<double> get sugar =>
      $composableBuilder(column: $table.sugar, builder: (column) => column);

  GeneratedColumn<double> get sodium =>
      $composableBuilder(column: $table.sodium, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get databaseSource => $composableBuilder(
      column: $table.databaseSource, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedFoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedFoodsTable,
    CachedFood,
    $$CachedFoodsTableFilterComposer,
    $$CachedFoodsTableOrderingComposer,
    $$CachedFoodsTableAnnotationComposer,
    $$CachedFoodsTableCreateCompanionBuilder,
    $$CachedFoodsTableUpdateCompanionBuilder,
    (CachedFood, BaseReferences<_$AppDatabase, $CachedFoodsTable, CachedFood>),
    CachedFood,
    PrefetchHooks Function()> {
  $$CachedFoodsTableTableManager(_$AppDatabase db, $CachedFoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedFoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedFoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedFoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<double> servingSize = const Value.absent(),
            Value<String> servingUnit = const Value.absent(),
            Value<int> calories = const Value.absent(),
            Value<double> protein = const Value.absent(),
            Value<double> carbs = const Value.absent(),
            Value<double> fat = const Value.absent(),
            Value<double?> fiber = const Value.absent(),
            Value<double?> sugar = const Value.absent(),
            Value<double?> sodium = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String> databaseSource = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedFoodsCompanion(
            id: id,
            name: name,
            brand: brand,
            servingSize: servingSize,
            servingUnit: servingUnit,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            fiber: fiber,
            sugar: sugar,
            sodium: sodium,
            barcode: barcode,
            databaseSource: databaseSource,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> brand = const Value.absent(),
            required double servingSize,
            required String servingUnit,
            required int calories,
            required double protein,
            required double carbs,
            required double fat,
            Value<double?> fiber = const Value.absent(),
            Value<double?> sugar = const Value.absent(),
            Value<double?> sodium = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            required String databaseSource,
            required DateTime cachedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedFoodsCompanion.insert(
            id: id,
            name: name,
            brand: brand,
            servingSize: servingSize,
            servingUnit: servingUnit,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            fiber: fiber,
            sugar: sugar,
            sodium: sodium,
            barcode: barcode,
            databaseSource: databaseSource,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedFoodsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedFoodsTable,
    CachedFood,
    $$CachedFoodsTableFilterComposer,
    $$CachedFoodsTableOrderingComposer,
    $$CachedFoodsTableAnnotationComposer,
    $$CachedFoodsTableCreateCompanionBuilder,
    $$CachedFoodsTableUpdateCompanionBuilder,
    (CachedFood, BaseReferences<_$AppDatabase, $CachedFoodsTable, CachedFood>),
    CachedFood,
    PrefetchHooks Function()>;
typedef $$CustomFoodsTableCreateCompanionBuilder = CustomFoodsCompanion
    Function({
  required String id,
  required String name,
  Value<String?> brand,
  required double servingSize,
  required String servingUnit,
  required int calories,
  required double protein,
  required double carbs,
  required double fat,
  Value<double?> fiber,
  Value<double?> sugar,
  Value<double?> sodium,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$CustomFoodsTableUpdateCompanionBuilder = CustomFoodsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> brand,
  Value<double> servingSize,
  Value<String> servingUnit,
  Value<int> calories,
  Value<double> protein,
  Value<double> carbs,
  Value<double> fat,
  Value<double?> fiber,
  Value<double?> sugar,
  Value<double?> sodium,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$CustomFoodsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomFoodsTable> {
  $$CustomFoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fiber => $composableBuilder(
      column: $table.fiber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sugar => $composableBuilder(
      column: $table.sugar, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sodium => $composableBuilder(
      column: $table.sodium, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$CustomFoodsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomFoodsTable> {
  $$CustomFoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fiber => $composableBuilder(
      column: $table.fiber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sugar => $composableBuilder(
      column: $table.sugar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sodium => $composableBuilder(
      column: $table.sodium, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CustomFoodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomFoodsTable> {
  $$CustomFoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<double> get servingSize => $composableBuilder(
      column: $table.servingSize, builder: (column) => column);

  GeneratedColumn<String> get servingUnit => $composableBuilder(
      column: $table.servingUnit, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get fiber =>
      $composableBuilder(column: $table.fiber, builder: (column) => column);

  GeneratedColumn<double> get sugar =>
      $composableBuilder(column: $table.sugar, builder: (column) => column);

  GeneratedColumn<double> get sodium =>
      $composableBuilder(column: $table.sodium, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomFoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomFoodsTable,
    CustomFood,
    $$CustomFoodsTableFilterComposer,
    $$CustomFoodsTableOrderingComposer,
    $$CustomFoodsTableAnnotationComposer,
    $$CustomFoodsTableCreateCompanionBuilder,
    $$CustomFoodsTableUpdateCompanionBuilder,
    (CustomFood, BaseReferences<_$AppDatabase, $CustomFoodsTable, CustomFood>),
    CustomFood,
    PrefetchHooks Function()> {
  $$CustomFoodsTableTableManager(_$AppDatabase db, $CustomFoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomFoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomFoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomFoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<double> servingSize = const Value.absent(),
            Value<String> servingUnit = const Value.absent(),
            Value<int> calories = const Value.absent(),
            Value<double> protein = const Value.absent(),
            Value<double> carbs = const Value.absent(),
            Value<double> fat = const Value.absent(),
            Value<double?> fiber = const Value.absent(),
            Value<double?> sugar = const Value.absent(),
            Value<double?> sodium = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomFoodsCompanion(
            id: id,
            name: name,
            brand: brand,
            servingSize: servingSize,
            servingUnit: servingUnit,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            fiber: fiber,
            sugar: sugar,
            sodium: sodium,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> brand = const Value.absent(),
            required double servingSize,
            required String servingUnit,
            required int calories,
            required double protein,
            required double carbs,
            required double fat,
            Value<double?> fiber = const Value.absent(),
            Value<double?> sugar = const Value.absent(),
            Value<double?> sodium = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomFoodsCompanion.insert(
            id: id,
            name: name,
            brand: brand,
            servingSize: servingSize,
            servingUnit: servingUnit,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            fiber: fiber,
            sugar: sugar,
            sodium: sodium,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomFoodsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomFoodsTable,
    CustomFood,
    $$CustomFoodsTableFilterComposer,
    $$CustomFoodsTableOrderingComposer,
    $$CustomFoodsTableAnnotationComposer,
    $$CustomFoodsTableCreateCompanionBuilder,
    $$CustomFoodsTableUpdateCompanionBuilder,
    (CustomFood, BaseReferences<_$AppDatabase, $CustomFoodsTable, CustomFood>),
    CustomFood,
    PrefetchHooks Function()>;
typedef $$MealItemsTableCreateCompanionBuilder = MealItemsCompanion Function({
  Value<int> id,
  required String mealId,
  required String foodId,
  required double quantity,
  required int calories,
  required double protein,
  required double carbs,
  required double fat,
});
typedef $$MealItemsTableUpdateCompanionBuilder = MealItemsCompanion Function({
  Value<int> id,
  Value<String> mealId,
  Value<String> foodId,
  Value<double> quantity,
  Value<int> calories,
  Value<double> protein,
  Value<double> carbs,
  Value<double> fat,
});

class $$MealItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MealItemsTable> {
  $$MealItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get foodId => $composableBuilder(
      column: $table.foodId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnFilters(column));
}

class $$MealItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealItemsTable> {
  $$MealItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mealId => $composableBuilder(
      column: $table.mealId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get foodId => $composableBuilder(
      column: $table.foodId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calories => $composableBuilder(
      column: $table.calories, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get protein => $composableBuilder(
      column: $table.protein, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carbs => $composableBuilder(
      column: $table.carbs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fat => $composableBuilder(
      column: $table.fat, builder: (column) => ColumnOrderings(column));
}

class $$MealItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealItemsTable> {
  $$MealItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mealId =>
      $composableBuilder(column: $table.mealId, builder: (column) => column);

  GeneratedColumn<String> get foodId =>
      $composableBuilder(column: $table.foodId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);
}

class $$MealItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealItemsTable,
    MealItem,
    $$MealItemsTableFilterComposer,
    $$MealItemsTableOrderingComposer,
    $$MealItemsTableAnnotationComposer,
    $$MealItemsTableCreateCompanionBuilder,
    $$MealItemsTableUpdateCompanionBuilder,
    (MealItem, BaseReferences<_$AppDatabase, $MealItemsTable, MealItem>),
    MealItem,
    PrefetchHooks Function()> {
  $$MealItemsTableTableManager(_$AppDatabase db, $MealItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> mealId = const Value.absent(),
            Value<String> foodId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<int> calories = const Value.absent(),
            Value<double> protein = const Value.absent(),
            Value<double> carbs = const Value.absent(),
            Value<double> fat = const Value.absent(),
          }) =>
              MealItemsCompanion(
            id: id,
            mealId: mealId,
            foodId: foodId,
            quantity: quantity,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String mealId,
            required String foodId,
            required double quantity,
            required int calories,
            required double protein,
            required double carbs,
            required double fat,
          }) =>
              MealItemsCompanion.insert(
            id: id,
            mealId: mealId,
            foodId: foodId,
            quantity: quantity,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MealItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealItemsTable,
    MealItem,
    $$MealItemsTableFilterComposer,
    $$MealItemsTableOrderingComposer,
    $$MealItemsTableAnnotationComposer,
    $$MealItemsTableCreateCompanionBuilder,
    $$MealItemsTableUpdateCompanionBuilder,
    (MealItem, BaseReferences<_$AppDatabase, $MealItemsTable, MealItem>),
    MealItem,
    PrefetchHooks Function()>;
typedef $$RecentFoodsTableCreateCompanionBuilder = RecentFoodsCompanion
    Function({
  required String foodId,
  required DateTime usedAt,
  Value<int> useCount,
  Value<int> rowid,
});
typedef $$RecentFoodsTableUpdateCompanionBuilder = RecentFoodsCompanion
    Function({
  Value<String> foodId,
  Value<DateTime> usedAt,
  Value<int> useCount,
  Value<int> rowid,
});

class $$RecentFoodsTableFilterComposer
    extends Composer<_$AppDatabase, $RecentFoodsTable> {
  $$RecentFoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get foodId => $composableBuilder(
      column: $table.foodId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get useCount => $composableBuilder(
      column: $table.useCount, builder: (column) => ColumnFilters(column));
}

class $$RecentFoodsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecentFoodsTable> {
  $$RecentFoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get foodId => $composableBuilder(
      column: $table.foodId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get usedAt => $composableBuilder(
      column: $table.usedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get useCount => $composableBuilder(
      column: $table.useCount, builder: (column) => ColumnOrderings(column));
}

class $$RecentFoodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecentFoodsTable> {
  $$RecentFoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get foodId =>
      $composableBuilder(column: $table.foodId, builder: (column) => column);

  GeneratedColumn<DateTime> get usedAt =>
      $composableBuilder(column: $table.usedAt, builder: (column) => column);

  GeneratedColumn<int> get useCount =>
      $composableBuilder(column: $table.useCount, builder: (column) => column);
}

class $$RecentFoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecentFoodsTable,
    RecentFood,
    $$RecentFoodsTableFilterComposer,
    $$RecentFoodsTableOrderingComposer,
    $$RecentFoodsTableAnnotationComposer,
    $$RecentFoodsTableCreateCompanionBuilder,
    $$RecentFoodsTableUpdateCompanionBuilder,
    (RecentFood, BaseReferences<_$AppDatabase, $RecentFoodsTable, RecentFood>),
    RecentFood,
    PrefetchHooks Function()> {
  $$RecentFoodsTableTableManager(_$AppDatabase db, $RecentFoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecentFoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecentFoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecentFoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> foodId = const Value.absent(),
            Value<DateTime> usedAt = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecentFoodsCompanion(
            foodId: foodId,
            usedAt: usedAt,
            useCount: useCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String foodId,
            required DateTime usedAt,
            Value<int> useCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecentFoodsCompanion.insert(
            foodId: foodId,
            usedAt: usedAt,
            useCount: useCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecentFoodsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecentFoodsTable,
    RecentFood,
    $$RecentFoodsTableFilterComposer,
    $$RecentFoodsTableOrderingComposer,
    $$RecentFoodsTableAnnotationComposer,
    $$RecentFoodsTableCreateCompanionBuilder,
    $$RecentFoodsTableUpdateCompanionBuilder,
    (RecentFood, BaseReferences<_$AppDatabase, $RecentFoodsTable, RecentFood>),
    RecentFood,
    PrefetchHooks Function()>;
typedef $$FavoriteFoodsTableCreateCompanionBuilder = FavoriteFoodsCompanion
    Function({
  required String foodId,
  required DateTime addedAt,
  Value<int> rowid,
});
typedef $$FavoriteFoodsTableUpdateCompanionBuilder = FavoriteFoodsCompanion
    Function({
  Value<String> foodId,
  Value<DateTime> addedAt,
  Value<int> rowid,
});

class $$FavoriteFoodsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteFoodsTable> {
  $$FavoriteFoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get foodId => $composableBuilder(
      column: $table.foodId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));
}

class $$FavoriteFoodsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteFoodsTable> {
  $$FavoriteFoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get foodId => $composableBuilder(
      column: $table.foodId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteFoodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteFoodsTable> {
  $$FavoriteFoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get foodId =>
      $composableBuilder(column: $table.foodId, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoriteFoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteFoodsTable,
    FavoriteFood,
    $$FavoriteFoodsTableFilterComposer,
    $$FavoriteFoodsTableOrderingComposer,
    $$FavoriteFoodsTableAnnotationComposer,
    $$FavoriteFoodsTableCreateCompanionBuilder,
    $$FavoriteFoodsTableUpdateCompanionBuilder,
    (
      FavoriteFood,
      BaseReferences<_$AppDatabase, $FavoriteFoodsTable, FavoriteFood>
    ),
    FavoriteFood,
    PrefetchHooks Function()> {
  $$FavoriteFoodsTableTableManager(_$AppDatabase db, $FavoriteFoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteFoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteFoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteFoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> foodId = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoriteFoodsCompanion(
            foodId: foodId,
            addedAt: addedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String foodId,
            required DateTime addedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoriteFoodsCompanion.insert(
            foodId: foodId,
            addedAt: addedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteFoodsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteFoodsTable,
    FavoriteFood,
    $$FavoriteFoodsTableFilterComposer,
    $$FavoriteFoodsTableOrderingComposer,
    $$FavoriteFoodsTableAnnotationComposer,
    $$FavoriteFoodsTableCreateCompanionBuilder,
    $$FavoriteFoodsTableUpdateCompanionBuilder,
    (
      FavoriteFood,
      BaseReferences<_$AppDatabase, $FavoriteFoodsTable, FavoriteFood>
    ),
    FavoriteFood,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$DailyProtocolsTableTableManager get dailyProtocols =>
      $$DailyProtocolsTableTableManager(_db, _db.dailyProtocols);
  $$MealEntriesTableTableManager get mealEntries =>
      $$MealEntriesTableTableManager(_db, _db.mealEntries);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$SleepSessionsTableTableManager get sleepSessions =>
      $$SleepSessionsTableTableManager(_db, _db.sleepSessions);
  $$SleepHabitLogsTableTableManager get sleepHabitLogs =>
      $$SleepHabitLogsTableTableManager(_db, _db.sleepHabitLogs);
  $$DailyProgressEntriesTableTableManager get dailyProgressEntries =>
      $$DailyProgressEntriesTableTableManager(_db, _db.dailyProgressEntries);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$CachedFoodsTableTableManager get cachedFoods =>
      $$CachedFoodsTableTableManager(_db, _db.cachedFoods);
  $$CustomFoodsTableTableManager get customFoods =>
      $$CustomFoodsTableTableManager(_db, _db.customFoods);
  $$MealItemsTableTableManager get mealItems =>
      $$MealItemsTableTableManager(_db, _db.mealItems);
  $$RecentFoodsTableTableManager get recentFoods =>
      $$RecentFoodsTableTableManager(_db, _db.recentFoods);
  $$FavoriteFoodsTableTableManager get favoriteFoods =>
      $$FavoriteFoodsTableTableManager(_db, _db.favoriteFoods);
}
