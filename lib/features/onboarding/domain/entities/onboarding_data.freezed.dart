// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) {
  return _OnboardingData.fromJson(json);
}

/// @nodoc
mixin _$OnboardingData {
// Step 2: Birth date
  DateTime? get dateOfBirth =>
      throw _privateConstructorUsedError; // Step 3: Sex selection
  String? get sex => throw _privateConstructorUsedError; // 'male' or 'female'
// Step 4: Measurements
  double? get heightCm => throw _privateConstructorUsedError;
  double? get weightKg =>
      throw _privateConstructorUsedError; // Step 5: Target weight
  double? get targetWeightKg =>
      throw _privateConstructorUsedError; // null = maintain current weight
// Step 6: Activity level
  String? get activityLevel =>
      throw _privateConstructorUsedError; // sedentary, lightly_active, moderately_active, very_active, extra_active
// Step 7: Goals
  List<String> get goals =>
      throw _privateConstructorUsedError; // Step 8: Wake time
  @TimeOfDayConverter()
  TimeOfDay? get wakeTime =>
      throw _privateConstructorUsedError; // Step 9: Ambition level
  String? get longevityAmbition =>
      throw _privateConstructorUsedError; // moderate, aggressive
// Step 10: Health permissions granted
  bool get healthPermissionsGranted =>
      throw _privateConstructorUsedError; // Step 11: Disclaimer accepted
  bool get disclaimerAccepted =>
      throw _privateConstructorUsedError; // Additional data that can be set
  String get fitnessLevel =>
      throw _privateConstructorUsedError; // beginner, intermediate, advanced
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;
  List<String> get medicalConditions => throw _privateConstructorUsedError;
  List<String> get equipment => throw _privateConstructorUsedError;
  int get preferredWorkoutMinutes => throw _privateConstructorUsedError;

  /// Serializes this OnboardingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingDataCopyWith<OnboardingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingDataCopyWith<$Res> {
  factory $OnboardingDataCopyWith(
          OnboardingData value, $Res Function(OnboardingData) then) =
      _$OnboardingDataCopyWithImpl<$Res, OnboardingData>;
  @useResult
  $Res call(
      {DateTime? dateOfBirth,
      String? sex,
      double? heightCm,
      double? weightKg,
      double? targetWeightKg,
      String? activityLevel,
      List<String> goals,
      @TimeOfDayConverter() TimeOfDay? wakeTime,
      String? longevityAmbition,
      bool healthPermissionsGranted,
      bool disclaimerAccepted,
      String fitnessLevel,
      List<String> dietaryRestrictions,
      List<String> medicalConditions,
      List<String> equipment,
      int preferredWorkoutMinutes});
}

/// @nodoc
class _$OnboardingDataCopyWithImpl<$Res, $Val extends OnboardingData>
    implements $OnboardingDataCopyWith<$Res> {
  _$OnboardingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfBirth = freezed,
    Object? sex = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? targetWeightKg = freezed,
    Object? activityLevel = freezed,
    Object? goals = null,
    Object? wakeTime = freezed,
    Object? longevityAmbition = freezed,
    Object? healthPermissionsGranted = null,
    Object? disclaimerAccepted = null,
    Object? fitnessLevel = null,
    Object? dietaryRestrictions = null,
    Object? medicalConditions = null,
    Object? equipment = null,
    Object? preferredWorkoutMinutes = null,
  }) {
    return _then(_value.copyWith(
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      heightCm: freezed == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      weightKg: freezed == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      targetWeightKg: freezed == targetWeightKg
          ? _value.targetWeightKg
          : targetWeightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      activityLevel: freezed == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wakeTime: freezed == wakeTime
          ? _value.wakeTime
          : wakeTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      longevityAmbition: freezed == longevityAmbition
          ? _value.longevityAmbition
          : longevityAmbition // ignore: cast_nullable_to_non_nullable
              as String?,
      healthPermissionsGranted: null == healthPermissionsGranted
          ? _value.healthPermissionsGranted
          : healthPermissionsGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      disclaimerAccepted: null == disclaimerAccepted
          ? _value.disclaimerAccepted
          : disclaimerAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      fitnessLevel: null == fitnessLevel
          ? _value.fitnessLevel
          : fitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      dietaryRestrictions: null == dietaryRestrictions
          ? _value.dietaryRestrictions
          : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      medicalConditions: null == medicalConditions
          ? _value.medicalConditions
          : medicalConditions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredWorkoutMinutes: null == preferredWorkoutMinutes
          ? _value.preferredWorkoutMinutes
          : preferredWorkoutMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingDataImplCopyWith<$Res>
    implements $OnboardingDataCopyWith<$Res> {
  factory _$$OnboardingDataImplCopyWith(_$OnboardingDataImpl value,
          $Res Function(_$OnboardingDataImpl) then) =
      __$$OnboardingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dateOfBirth,
      String? sex,
      double? heightCm,
      double? weightKg,
      double? targetWeightKg,
      String? activityLevel,
      List<String> goals,
      @TimeOfDayConverter() TimeOfDay? wakeTime,
      String? longevityAmbition,
      bool healthPermissionsGranted,
      bool disclaimerAccepted,
      String fitnessLevel,
      List<String> dietaryRestrictions,
      List<String> medicalConditions,
      List<String> equipment,
      int preferredWorkoutMinutes});
}

/// @nodoc
class __$$OnboardingDataImplCopyWithImpl<$Res>
    extends _$OnboardingDataCopyWithImpl<$Res, _$OnboardingDataImpl>
    implements _$$OnboardingDataImplCopyWith<$Res> {
  __$$OnboardingDataImplCopyWithImpl(
      _$OnboardingDataImpl _value, $Res Function(_$OnboardingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfBirth = freezed,
    Object? sex = freezed,
    Object? heightCm = freezed,
    Object? weightKg = freezed,
    Object? targetWeightKg = freezed,
    Object? activityLevel = freezed,
    Object? goals = null,
    Object? wakeTime = freezed,
    Object? longevityAmbition = freezed,
    Object? healthPermissionsGranted = null,
    Object? disclaimerAccepted = null,
    Object? fitnessLevel = null,
    Object? dietaryRestrictions = null,
    Object? medicalConditions = null,
    Object? equipment = null,
    Object? preferredWorkoutMinutes = null,
  }) {
    return _then(_$OnboardingDataImpl(
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      heightCm: freezed == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      weightKg: freezed == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      targetWeightKg: freezed == targetWeightKg
          ? _value.targetWeightKg
          : targetWeightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      activityLevel: freezed == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wakeTime: freezed == wakeTime
          ? _value.wakeTime
          : wakeTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      longevityAmbition: freezed == longevityAmbition
          ? _value.longevityAmbition
          : longevityAmbition // ignore: cast_nullable_to_non_nullable
              as String?,
      healthPermissionsGranted: null == healthPermissionsGranted
          ? _value.healthPermissionsGranted
          : healthPermissionsGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      disclaimerAccepted: null == disclaimerAccepted
          ? _value.disclaimerAccepted
          : disclaimerAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      fitnessLevel: null == fitnessLevel
          ? _value.fitnessLevel
          : fitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      dietaryRestrictions: null == dietaryRestrictions
          ? _value._dietaryRestrictions
          : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      medicalConditions: null == medicalConditions
          ? _value._medicalConditions
          : medicalConditions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredWorkoutMinutes: null == preferredWorkoutMinutes
          ? _value.preferredWorkoutMinutes
          : preferredWorkoutMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingDataImpl implements _OnboardingData {
  const _$OnboardingDataImpl(
      {this.dateOfBirth,
      this.sex,
      this.heightCm,
      this.weightKg,
      this.targetWeightKg,
      this.activityLevel,
      final List<String> goals = const [],
      @TimeOfDayConverter() this.wakeTime,
      this.longevityAmbition,
      this.healthPermissionsGranted = false,
      this.disclaimerAccepted = false,
      this.fitnessLevel = 'intermediate',
      final List<String> dietaryRestrictions = const [],
      final List<String> medicalConditions = const [],
      final List<String> equipment = const [],
      this.preferredWorkoutMinutes = 45})
      : _goals = goals,
        _dietaryRestrictions = dietaryRestrictions,
        _medicalConditions = medicalConditions,
        _equipment = equipment;

  factory _$OnboardingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingDataImplFromJson(json);

// Step 2: Birth date
  @override
  final DateTime? dateOfBirth;
// Step 3: Sex selection
  @override
  final String? sex;
// 'male' or 'female'
// Step 4: Measurements
  @override
  final double? heightCm;
  @override
  final double? weightKg;
// Step 5: Target weight
  @override
  final double? targetWeightKg;
// null = maintain current weight
// Step 6: Activity level
  @override
  final String? activityLevel;
// sedentary, lightly_active, moderately_active, very_active, extra_active
// Step 7: Goals
  final List<String> _goals;
// sedentary, lightly_active, moderately_active, very_active, extra_active
// Step 7: Goals
  @override
  @JsonKey()
  List<String> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

// Step 8: Wake time
  @override
  @TimeOfDayConverter()
  final TimeOfDay? wakeTime;
// Step 9: Ambition level
  @override
  final String? longevityAmbition;
// moderate, aggressive
// Step 10: Health permissions granted
  @override
  @JsonKey()
  final bool healthPermissionsGranted;
// Step 11: Disclaimer accepted
  @override
  @JsonKey()
  final bool disclaimerAccepted;
// Additional data that can be set
  @override
  @JsonKey()
  final String fitnessLevel;
// beginner, intermediate, advanced
  final List<String> _dietaryRestrictions;
// beginner, intermediate, advanced
  @override
  @JsonKey()
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  final List<String> _medicalConditions;
  @override
  @JsonKey()
  List<String> get medicalConditions {
    if (_medicalConditions is EqualUnmodifiableListView)
      return _medicalConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalConditions);
  }

  final List<String> _equipment;
  @override
  @JsonKey()
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  @override
  @JsonKey()
  final int preferredWorkoutMinutes;

  @override
  String toString() {
    return 'OnboardingData(dateOfBirth: $dateOfBirth, sex: $sex, heightCm: $heightCm, weightKg: $weightKg, targetWeightKg: $targetWeightKg, activityLevel: $activityLevel, goals: $goals, wakeTime: $wakeTime, longevityAmbition: $longevityAmbition, healthPermissionsGranted: $healthPermissionsGranted, disclaimerAccepted: $disclaimerAccepted, fitnessLevel: $fitnessLevel, dietaryRestrictions: $dietaryRestrictions, medicalConditions: $medicalConditions, equipment: $equipment, preferredWorkoutMinutes: $preferredWorkoutMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingDataImpl &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.targetWeightKg, targetWeightKg) ||
                other.targetWeightKg == targetWeightKg) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.wakeTime, wakeTime) ||
                other.wakeTime == wakeTime) &&
            (identical(other.longevityAmbition, longevityAmbition) ||
                other.longevityAmbition == longevityAmbition) &&
            (identical(
                    other.healthPermissionsGranted, healthPermissionsGranted) ||
                other.healthPermissionsGranted == healthPermissionsGranted) &&
            (identical(other.disclaimerAccepted, disclaimerAccepted) ||
                other.disclaimerAccepted == disclaimerAccepted) &&
            (identical(other.fitnessLevel, fitnessLevel) ||
                other.fitnessLevel == fitnessLevel) &&
            const DeepCollectionEquality()
                .equals(other._dietaryRestrictions, _dietaryRestrictions) &&
            const DeepCollectionEquality()
                .equals(other._medicalConditions, _medicalConditions) &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment) &&
            (identical(
                    other.preferredWorkoutMinutes, preferredWorkoutMinutes) ||
                other.preferredWorkoutMinutes == preferredWorkoutMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateOfBirth,
      sex,
      heightCm,
      weightKg,
      targetWeightKg,
      activityLevel,
      const DeepCollectionEquality().hash(_goals),
      wakeTime,
      longevityAmbition,
      healthPermissionsGranted,
      disclaimerAccepted,
      fitnessLevel,
      const DeepCollectionEquality().hash(_dietaryRestrictions),
      const DeepCollectionEquality().hash(_medicalConditions),
      const DeepCollectionEquality().hash(_equipment),
      preferredWorkoutMinutes);

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      __$$OnboardingDataImplCopyWithImpl<_$OnboardingDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingDataImplToJson(
      this,
    );
  }
}

abstract class _OnboardingData implements OnboardingData {
  const factory _OnboardingData(
      {final DateTime? dateOfBirth,
      final String? sex,
      final double? heightCm,
      final double? weightKg,
      final double? targetWeightKg,
      final String? activityLevel,
      final List<String> goals,
      @TimeOfDayConverter() final TimeOfDay? wakeTime,
      final String? longevityAmbition,
      final bool healthPermissionsGranted,
      final bool disclaimerAccepted,
      final String fitnessLevel,
      final List<String> dietaryRestrictions,
      final List<String> medicalConditions,
      final List<String> equipment,
      final int preferredWorkoutMinutes}) = _$OnboardingDataImpl;

  factory _OnboardingData.fromJson(Map<String, dynamic> json) =
      _$OnboardingDataImpl.fromJson;

// Step 2: Birth date
  @override
  DateTime? get dateOfBirth; // Step 3: Sex selection
  @override
  String? get sex; // 'male' or 'female'
// Step 4: Measurements
  @override
  double? get heightCm;
  @override
  double? get weightKg; // Step 5: Target weight
  @override
  double? get targetWeightKg; // null = maintain current weight
// Step 6: Activity level
  @override
  String?
      get activityLevel; // sedentary, lightly_active, moderately_active, very_active, extra_active
// Step 7: Goals
  @override
  List<String> get goals; // Step 8: Wake time
  @override
  @TimeOfDayConverter()
  TimeOfDay? get wakeTime; // Step 9: Ambition level
  @override
  String? get longevityAmbition; // moderate, aggressive
// Step 10: Health permissions granted
  @override
  bool get healthPermissionsGranted; // Step 11: Disclaimer accepted
  @override
  bool get disclaimerAccepted; // Additional data that can be set
  @override
  String get fitnessLevel; // beginner, intermediate, advanced
  @override
  List<String> get dietaryRestrictions;
  @override
  List<String> get medicalConditions;
  @override
  List<String> get equipment;
  @override
  int get preferredWorkoutMinutes;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
