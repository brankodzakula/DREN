// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyProtocol _$DailyProtocolFromJson(Map<String, dynamic> json) {
  return _DailyProtocol.fromJson(json);
}

/// @nodoc
mixin _$DailyProtocol {
  /// Date this protocol is for
  DateTime get date => throw _privateConstructorUsedError;

  /// Caloric targets
  int get targetCalories => throw _privateConstructorUsedError;
  int get proteinGrams => throw _privateConstructorUsedError;
  int get carbsGrams => throw _privateConstructorUsedError;
  int get fatGrams => throw _privateConstructorUsedError;

  /// Exercise targets
  int get exerciseMinutes => throw _privateConstructorUsedError;
  String get workoutType => throw _privateConstructorUsedError;
  int get estimatedCaloriesBurn => throw _privateConstructorUsedError;

  /// Sleep targets
  @TimeOfDayConverter()
  TimeOfDay get targetBedtime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get targetWakeTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get windDownStart => throw _privateConstructorUsedError;

  /// Eating window
  @TimeOfDayConverter()
  TimeOfDay? get eatingWindowStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get eatingWindowEnd => throw _privateConstructorUsedError;

  /// User's ambition level this was generated for
  String get ambitionLevel => throw _privateConstructorUsedError;

  /// User's fitness level
  String get fitnessLevel => throw _privateConstructorUsedError;

  /// Serializes this DailyProtocol to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyProtocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyProtocolCopyWith<DailyProtocol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyProtocolCopyWith<$Res> {
  factory $DailyProtocolCopyWith(
          DailyProtocol value, $Res Function(DailyProtocol) then) =
      _$DailyProtocolCopyWithImpl<$Res, DailyProtocol>;
  @useResult
  $Res call(
      {DateTime date,
      int targetCalories,
      int proteinGrams,
      int carbsGrams,
      int fatGrams,
      int exerciseMinutes,
      String workoutType,
      int estimatedCaloriesBurn,
      @TimeOfDayConverter() TimeOfDay targetBedtime,
      @TimeOfDayConverter() TimeOfDay targetWakeTime,
      @TimeOfDayConverter() TimeOfDay windDownStart,
      @TimeOfDayConverter() TimeOfDay? eatingWindowStart,
      @TimeOfDayConverter() TimeOfDay? eatingWindowEnd,
      String ambitionLevel,
      String fitnessLevel});
}

/// @nodoc
class _$DailyProtocolCopyWithImpl<$Res, $Val extends DailyProtocol>
    implements $DailyProtocolCopyWith<$Res> {
  _$DailyProtocolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyProtocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? targetCalories = null,
    Object? proteinGrams = null,
    Object? carbsGrams = null,
    Object? fatGrams = null,
    Object? exerciseMinutes = null,
    Object? workoutType = null,
    Object? estimatedCaloriesBurn = null,
    Object? targetBedtime = null,
    Object? targetWakeTime = null,
    Object? windDownStart = null,
    Object? eatingWindowStart = freezed,
    Object? eatingWindowEnd = freezed,
    Object? ambitionLevel = null,
    Object? fitnessLevel = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetCalories: null == targetCalories
          ? _value.targetCalories
          : targetCalories // ignore: cast_nullable_to_non_nullable
              as int,
      proteinGrams: null == proteinGrams
          ? _value.proteinGrams
          : proteinGrams // ignore: cast_nullable_to_non_nullable
              as int,
      carbsGrams: null == carbsGrams
          ? _value.carbsGrams
          : carbsGrams // ignore: cast_nullable_to_non_nullable
              as int,
      fatGrams: null == fatGrams
          ? _value.fatGrams
          : fatGrams // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseMinutes: null == exerciseMinutes
          ? _value.exerciseMinutes
          : exerciseMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      workoutType: null == workoutType
          ? _value.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedCaloriesBurn: null == estimatedCaloriesBurn
          ? _value.estimatedCaloriesBurn
          : estimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
              as int,
      targetBedtime: null == targetBedtime
          ? _value.targetBedtime
          : targetBedtime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      targetWakeTime: null == targetWakeTime
          ? _value.targetWakeTime
          : targetWakeTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      windDownStart: null == windDownStart
          ? _value.windDownStart
          : windDownStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      eatingWindowStart: freezed == eatingWindowStart
          ? _value.eatingWindowStart
          : eatingWindowStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      eatingWindowEnd: freezed == eatingWindowEnd
          ? _value.eatingWindowEnd
          : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      ambitionLevel: null == ambitionLevel
          ? _value.ambitionLevel
          : ambitionLevel // ignore: cast_nullable_to_non_nullable
              as String,
      fitnessLevel: null == fitnessLevel
          ? _value.fitnessLevel
          : fitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyProtocolImplCopyWith<$Res>
    implements $DailyProtocolCopyWith<$Res> {
  factory _$$DailyProtocolImplCopyWith(
          _$DailyProtocolImpl value, $Res Function(_$DailyProtocolImpl) then) =
      __$$DailyProtocolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int targetCalories,
      int proteinGrams,
      int carbsGrams,
      int fatGrams,
      int exerciseMinutes,
      String workoutType,
      int estimatedCaloriesBurn,
      @TimeOfDayConverter() TimeOfDay targetBedtime,
      @TimeOfDayConverter() TimeOfDay targetWakeTime,
      @TimeOfDayConverter() TimeOfDay windDownStart,
      @TimeOfDayConverter() TimeOfDay? eatingWindowStart,
      @TimeOfDayConverter() TimeOfDay? eatingWindowEnd,
      String ambitionLevel,
      String fitnessLevel});
}

/// @nodoc
class __$$DailyProtocolImplCopyWithImpl<$Res>
    extends _$DailyProtocolCopyWithImpl<$Res, _$DailyProtocolImpl>
    implements _$$DailyProtocolImplCopyWith<$Res> {
  __$$DailyProtocolImplCopyWithImpl(
      _$DailyProtocolImpl _value, $Res Function(_$DailyProtocolImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyProtocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? targetCalories = null,
    Object? proteinGrams = null,
    Object? carbsGrams = null,
    Object? fatGrams = null,
    Object? exerciseMinutes = null,
    Object? workoutType = null,
    Object? estimatedCaloriesBurn = null,
    Object? targetBedtime = null,
    Object? targetWakeTime = null,
    Object? windDownStart = null,
    Object? eatingWindowStart = freezed,
    Object? eatingWindowEnd = freezed,
    Object? ambitionLevel = null,
    Object? fitnessLevel = null,
  }) {
    return _then(_$DailyProtocolImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetCalories: null == targetCalories
          ? _value.targetCalories
          : targetCalories // ignore: cast_nullable_to_non_nullable
              as int,
      proteinGrams: null == proteinGrams
          ? _value.proteinGrams
          : proteinGrams // ignore: cast_nullable_to_non_nullable
              as int,
      carbsGrams: null == carbsGrams
          ? _value.carbsGrams
          : carbsGrams // ignore: cast_nullable_to_non_nullable
              as int,
      fatGrams: null == fatGrams
          ? _value.fatGrams
          : fatGrams // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseMinutes: null == exerciseMinutes
          ? _value.exerciseMinutes
          : exerciseMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      workoutType: null == workoutType
          ? _value.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedCaloriesBurn: null == estimatedCaloriesBurn
          ? _value.estimatedCaloriesBurn
          : estimatedCaloriesBurn // ignore: cast_nullable_to_non_nullable
              as int,
      targetBedtime: null == targetBedtime
          ? _value.targetBedtime
          : targetBedtime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      targetWakeTime: null == targetWakeTime
          ? _value.targetWakeTime
          : targetWakeTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      windDownStart: null == windDownStart
          ? _value.windDownStart
          : windDownStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      eatingWindowStart: freezed == eatingWindowStart
          ? _value.eatingWindowStart
          : eatingWindowStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      eatingWindowEnd: freezed == eatingWindowEnd
          ? _value.eatingWindowEnd
          : eatingWindowEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      ambitionLevel: null == ambitionLevel
          ? _value.ambitionLevel
          : ambitionLevel // ignore: cast_nullable_to_non_nullable
              as String,
      fitnessLevel: null == fitnessLevel
          ? _value.fitnessLevel
          : fitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyProtocolImpl implements _DailyProtocol {
  const _$DailyProtocolImpl(
      {required this.date,
      required this.targetCalories,
      required this.proteinGrams,
      required this.carbsGrams,
      required this.fatGrams,
      required this.exerciseMinutes,
      required this.workoutType,
      required this.estimatedCaloriesBurn,
      @TimeOfDayConverter() required this.targetBedtime,
      @TimeOfDayConverter() required this.targetWakeTime,
      @TimeOfDayConverter() required this.windDownStart,
      @TimeOfDayConverter() this.eatingWindowStart,
      @TimeOfDayConverter() this.eatingWindowEnd,
      required this.ambitionLevel,
      required this.fitnessLevel});

  factory _$DailyProtocolImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyProtocolImplFromJson(json);

  /// Date this protocol is for
  @override
  final DateTime date;

  /// Caloric targets
  @override
  final int targetCalories;
  @override
  final int proteinGrams;
  @override
  final int carbsGrams;
  @override
  final int fatGrams;

  /// Exercise targets
  @override
  final int exerciseMinutes;
  @override
  final String workoutType;
  @override
  final int estimatedCaloriesBurn;

  /// Sleep targets
  @override
  @TimeOfDayConverter()
  final TimeOfDay targetBedtime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay targetWakeTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay windDownStart;

  /// Eating window
  @override
  @TimeOfDayConverter()
  final TimeOfDay? eatingWindowStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? eatingWindowEnd;

  /// User's ambition level this was generated for
  @override
  final String ambitionLevel;

  /// User's fitness level
  @override
  final String fitnessLevel;

  @override
  String toString() {
    return 'DailyProtocol(date: $date, targetCalories: $targetCalories, proteinGrams: $proteinGrams, carbsGrams: $carbsGrams, fatGrams: $fatGrams, exerciseMinutes: $exerciseMinutes, workoutType: $workoutType, estimatedCaloriesBurn: $estimatedCaloriesBurn, targetBedtime: $targetBedtime, targetWakeTime: $targetWakeTime, windDownStart: $windDownStart, eatingWindowStart: $eatingWindowStart, eatingWindowEnd: $eatingWindowEnd, ambitionLevel: $ambitionLevel, fitnessLevel: $fitnessLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyProtocolImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetCalories, targetCalories) ||
                other.targetCalories == targetCalories) &&
            (identical(other.proteinGrams, proteinGrams) ||
                other.proteinGrams == proteinGrams) &&
            (identical(other.carbsGrams, carbsGrams) ||
                other.carbsGrams == carbsGrams) &&
            (identical(other.fatGrams, fatGrams) ||
                other.fatGrams == fatGrams) &&
            (identical(other.exerciseMinutes, exerciseMinutes) ||
                other.exerciseMinutes == exerciseMinutes) &&
            (identical(other.workoutType, workoutType) ||
                other.workoutType == workoutType) &&
            (identical(other.estimatedCaloriesBurn, estimatedCaloriesBurn) ||
                other.estimatedCaloriesBurn == estimatedCaloriesBurn) &&
            (identical(other.targetBedtime, targetBedtime) ||
                other.targetBedtime == targetBedtime) &&
            (identical(other.targetWakeTime, targetWakeTime) ||
                other.targetWakeTime == targetWakeTime) &&
            (identical(other.windDownStart, windDownStart) ||
                other.windDownStart == windDownStart) &&
            (identical(other.eatingWindowStart, eatingWindowStart) ||
                other.eatingWindowStart == eatingWindowStart) &&
            (identical(other.eatingWindowEnd, eatingWindowEnd) ||
                other.eatingWindowEnd == eatingWindowEnd) &&
            (identical(other.ambitionLevel, ambitionLevel) ||
                other.ambitionLevel == ambitionLevel) &&
            (identical(other.fitnessLevel, fitnessLevel) ||
                other.fitnessLevel == fitnessLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      targetCalories,
      proteinGrams,
      carbsGrams,
      fatGrams,
      exerciseMinutes,
      workoutType,
      estimatedCaloriesBurn,
      targetBedtime,
      targetWakeTime,
      windDownStart,
      eatingWindowStart,
      eatingWindowEnd,
      ambitionLevel,
      fitnessLevel);

  /// Create a copy of DailyProtocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyProtocolImplCopyWith<_$DailyProtocolImpl> get copyWith =>
      __$$DailyProtocolImplCopyWithImpl<_$DailyProtocolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyProtocolImplToJson(
      this,
    );
  }
}

abstract class _DailyProtocol implements DailyProtocol {
  const factory _DailyProtocol(
      {required final DateTime date,
      required final int targetCalories,
      required final int proteinGrams,
      required final int carbsGrams,
      required final int fatGrams,
      required final int exerciseMinutes,
      required final String workoutType,
      required final int estimatedCaloriesBurn,
      @TimeOfDayConverter() required final TimeOfDay targetBedtime,
      @TimeOfDayConverter() required final TimeOfDay targetWakeTime,
      @TimeOfDayConverter() required final TimeOfDay windDownStart,
      @TimeOfDayConverter() final TimeOfDay? eatingWindowStart,
      @TimeOfDayConverter() final TimeOfDay? eatingWindowEnd,
      required final String ambitionLevel,
      required final String fitnessLevel}) = _$DailyProtocolImpl;

  factory _DailyProtocol.fromJson(Map<String, dynamic> json) =
      _$DailyProtocolImpl.fromJson;

  /// Date this protocol is for
  @override
  DateTime get date;

  /// Caloric targets
  @override
  int get targetCalories;
  @override
  int get proteinGrams;
  @override
  int get carbsGrams;
  @override
  int get fatGrams;

  /// Exercise targets
  @override
  int get exerciseMinutes;
  @override
  String get workoutType;
  @override
  int get estimatedCaloriesBurn;

  /// Sleep targets
  @override
  @TimeOfDayConverter()
  TimeOfDay get targetBedtime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get targetWakeTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get windDownStart;

  /// Eating window
  @override
  @TimeOfDayConverter()
  TimeOfDay? get eatingWindowStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get eatingWindowEnd;

  /// User's ambition level this was generated for
  @override
  String get ambitionLevel;

  /// User's fitness level
  @override
  String get fitnessLevel;

  /// Create a copy of DailyProtocol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyProtocolImplCopyWith<_$DailyProtocolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
