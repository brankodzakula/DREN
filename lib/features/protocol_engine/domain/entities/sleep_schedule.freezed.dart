// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SleepSchedule _$SleepScheduleFromJson(Map<String, dynamic> json) {
  return _SleepSchedule.fromJson(json);
}

/// @nodoc
mixin _$SleepSchedule {
  /// Target bedtime
  @TimeOfDayConverter()
  TimeOfDay get targetBedtime => throw _privateConstructorUsedError;

  /// Target wake time
  @TimeOfDayConverter()
  TimeOfDay get targetWakeTime => throw _privateConstructorUsedError;

  /// When to start wind-down routine (60 min before bed)
  @TimeOfDayConverter()
  TimeOfDay get windDownStart => throw _privateConstructorUsedError;

  /// Last caffeine cutoff (9 hours after wake)
  @TimeOfDayConverter()
  TimeOfDay get lastCaffeineCutoff => throw _privateConstructorUsedError;

  /// Last meal cutoff (3 hours before bed)
  @TimeOfDayConverter()
  TimeOfDay get lastMealCutoff => throw _privateConstructorUsedError;

  /// Stop fluids time (2.5 hours before bed)
  @TimeOfDayConverter()
  TimeOfDay get stopFluidsTime => throw _privateConstructorUsedError;

  /// Target sleep duration in hours
  int get targetSleepHours => throw _privateConstructorUsedError;

  /// Serializes this SleepSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepScheduleCopyWith<SleepSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepScheduleCopyWith<$Res> {
  factory $SleepScheduleCopyWith(
          SleepSchedule value, $Res Function(SleepSchedule) then) =
      _$SleepScheduleCopyWithImpl<$Res, SleepSchedule>;
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay targetBedtime,
      @TimeOfDayConverter() TimeOfDay targetWakeTime,
      @TimeOfDayConverter() TimeOfDay windDownStart,
      @TimeOfDayConverter() TimeOfDay lastCaffeineCutoff,
      @TimeOfDayConverter() TimeOfDay lastMealCutoff,
      @TimeOfDayConverter() TimeOfDay stopFluidsTime,
      int targetSleepHours});
}

/// @nodoc
class _$SleepScheduleCopyWithImpl<$Res, $Val extends SleepSchedule>
    implements $SleepScheduleCopyWith<$Res> {
  _$SleepScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetBedtime = null,
    Object? targetWakeTime = null,
    Object? windDownStart = null,
    Object? lastCaffeineCutoff = null,
    Object? lastMealCutoff = null,
    Object? stopFluidsTime = null,
    Object? targetSleepHours = null,
  }) {
    return _then(_value.copyWith(
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
      lastCaffeineCutoff: null == lastCaffeineCutoff
          ? _value.lastCaffeineCutoff
          : lastCaffeineCutoff // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      lastMealCutoff: null == lastMealCutoff
          ? _value.lastMealCutoff
          : lastMealCutoff // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      stopFluidsTime: null == stopFluidsTime
          ? _value.stopFluidsTime
          : stopFluidsTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      targetSleepHours: null == targetSleepHours
          ? _value.targetSleepHours
          : targetSleepHours // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepScheduleImplCopyWith<$Res>
    implements $SleepScheduleCopyWith<$Res> {
  factory _$$SleepScheduleImplCopyWith(
          _$SleepScheduleImpl value, $Res Function(_$SleepScheduleImpl) then) =
      __$$SleepScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay targetBedtime,
      @TimeOfDayConverter() TimeOfDay targetWakeTime,
      @TimeOfDayConverter() TimeOfDay windDownStart,
      @TimeOfDayConverter() TimeOfDay lastCaffeineCutoff,
      @TimeOfDayConverter() TimeOfDay lastMealCutoff,
      @TimeOfDayConverter() TimeOfDay stopFluidsTime,
      int targetSleepHours});
}

/// @nodoc
class __$$SleepScheduleImplCopyWithImpl<$Res>
    extends _$SleepScheduleCopyWithImpl<$Res, _$SleepScheduleImpl>
    implements _$$SleepScheduleImplCopyWith<$Res> {
  __$$SleepScheduleImplCopyWithImpl(
      _$SleepScheduleImpl _value, $Res Function(_$SleepScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetBedtime = null,
    Object? targetWakeTime = null,
    Object? windDownStart = null,
    Object? lastCaffeineCutoff = null,
    Object? lastMealCutoff = null,
    Object? stopFluidsTime = null,
    Object? targetSleepHours = null,
  }) {
    return _then(_$SleepScheduleImpl(
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
      lastCaffeineCutoff: null == lastCaffeineCutoff
          ? _value.lastCaffeineCutoff
          : lastCaffeineCutoff // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      lastMealCutoff: null == lastMealCutoff
          ? _value.lastMealCutoff
          : lastMealCutoff // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      stopFluidsTime: null == stopFluidsTime
          ? _value.stopFluidsTime
          : stopFluidsTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      targetSleepHours: null == targetSleepHours
          ? _value.targetSleepHours
          : targetSleepHours // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepScheduleImpl implements _SleepSchedule {
  const _$SleepScheduleImpl(
      {@TimeOfDayConverter() required this.targetBedtime,
      @TimeOfDayConverter() required this.targetWakeTime,
      @TimeOfDayConverter() required this.windDownStart,
      @TimeOfDayConverter() required this.lastCaffeineCutoff,
      @TimeOfDayConverter() required this.lastMealCutoff,
      @TimeOfDayConverter() required this.stopFluidsTime,
      this.targetSleepHours = 8});

  factory _$SleepScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepScheduleImplFromJson(json);

  /// Target bedtime
  @override
  @TimeOfDayConverter()
  final TimeOfDay targetBedtime;

  /// Target wake time
  @override
  @TimeOfDayConverter()
  final TimeOfDay targetWakeTime;

  /// When to start wind-down routine (60 min before bed)
  @override
  @TimeOfDayConverter()
  final TimeOfDay windDownStart;

  /// Last caffeine cutoff (9 hours after wake)
  @override
  @TimeOfDayConverter()
  final TimeOfDay lastCaffeineCutoff;

  /// Last meal cutoff (3 hours before bed)
  @override
  @TimeOfDayConverter()
  final TimeOfDay lastMealCutoff;

  /// Stop fluids time (2.5 hours before bed)
  @override
  @TimeOfDayConverter()
  final TimeOfDay stopFluidsTime;

  /// Target sleep duration in hours
  @override
  @JsonKey()
  final int targetSleepHours;

  @override
  String toString() {
    return 'SleepSchedule(targetBedtime: $targetBedtime, targetWakeTime: $targetWakeTime, windDownStart: $windDownStart, lastCaffeineCutoff: $lastCaffeineCutoff, lastMealCutoff: $lastMealCutoff, stopFluidsTime: $stopFluidsTime, targetSleepHours: $targetSleepHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepScheduleImpl &&
            (identical(other.targetBedtime, targetBedtime) ||
                other.targetBedtime == targetBedtime) &&
            (identical(other.targetWakeTime, targetWakeTime) ||
                other.targetWakeTime == targetWakeTime) &&
            (identical(other.windDownStart, windDownStart) ||
                other.windDownStart == windDownStart) &&
            (identical(other.lastCaffeineCutoff, lastCaffeineCutoff) ||
                other.lastCaffeineCutoff == lastCaffeineCutoff) &&
            (identical(other.lastMealCutoff, lastMealCutoff) ||
                other.lastMealCutoff == lastMealCutoff) &&
            (identical(other.stopFluidsTime, stopFluidsTime) ||
                other.stopFluidsTime == stopFluidsTime) &&
            (identical(other.targetSleepHours, targetSleepHours) ||
                other.targetSleepHours == targetSleepHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      targetBedtime,
      targetWakeTime,
      windDownStart,
      lastCaffeineCutoff,
      lastMealCutoff,
      stopFluidsTime,
      targetSleepHours);

  /// Create a copy of SleepSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepScheduleImplCopyWith<_$SleepScheduleImpl> get copyWith =>
      __$$SleepScheduleImplCopyWithImpl<_$SleepScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepScheduleImplToJson(
      this,
    );
  }
}

abstract class _SleepSchedule implements SleepSchedule {
  const factory _SleepSchedule(
      {@TimeOfDayConverter() required final TimeOfDay targetBedtime,
      @TimeOfDayConverter() required final TimeOfDay targetWakeTime,
      @TimeOfDayConverter() required final TimeOfDay windDownStart,
      @TimeOfDayConverter() required final TimeOfDay lastCaffeineCutoff,
      @TimeOfDayConverter() required final TimeOfDay lastMealCutoff,
      @TimeOfDayConverter() required final TimeOfDay stopFluidsTime,
      final int targetSleepHours}) = _$SleepScheduleImpl;

  factory _SleepSchedule.fromJson(Map<String, dynamic> json) =
      _$SleepScheduleImpl.fromJson;

  /// Target bedtime
  @override
  @TimeOfDayConverter()
  TimeOfDay get targetBedtime;

  /// Target wake time
  @override
  @TimeOfDayConverter()
  TimeOfDay get targetWakeTime;

  /// When to start wind-down routine (60 min before bed)
  @override
  @TimeOfDayConverter()
  TimeOfDay get windDownStart;

  /// Last caffeine cutoff (9 hours after wake)
  @override
  @TimeOfDayConverter()
  TimeOfDay get lastCaffeineCutoff;

  /// Last meal cutoff (3 hours before bed)
  @override
  @TimeOfDayConverter()
  TimeOfDay get lastMealCutoff;

  /// Stop fluids time (2.5 hours before bed)
  @override
  @TimeOfDayConverter()
  TimeOfDay get stopFluidsTime;

  /// Target sleep duration in hours
  @override
  int get targetSleepHours;

  /// Create a copy of SleepSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepScheduleImplCopyWith<_$SleepScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
