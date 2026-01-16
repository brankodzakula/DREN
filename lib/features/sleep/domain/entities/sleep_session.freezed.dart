// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SleepSession _$SleepSessionFromJson(Map<String, dynamic> json) {
  return _SleepSession.fromJson(json);
}

/// @nodoc
mixin _$SleepSession {
  String get id => throw _privateConstructorUsedError;
  String get oderId => throw _privateConstructorUsedError;
  DateTime get bedTime => throw _privateConstructorUsedError;
  DateTime get wakeTime => throw _privateConstructorUsedError;
  int get totalMinutes => throw _privateConstructorUsedError;
  int get deepSleepMinutes => throw _privateConstructorUsedError;
  int get lightSleepMinutes => throw _privateConstructorUsedError;
  int get remSleepMinutes => throw _privateConstructorUsedError;
  int get awakeMinutes => throw _privateConstructorUsedError;
  double get efficiency => throw _privateConstructorUsedError; // 0.0 - 1.0
  int get latencyMinutes =>
      throw _privateConstructorUsedError; // Time to fall asleep
  int get sleepScore => throw _privateConstructorUsedError; // 0-100
  String get source =>
      throw _privateConstructorUsedError; // app, healthkit, health_connect
  String? get externalId => throw _privateConstructorUsedError;

  /// Serializes this SleepSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepSessionCopyWith<SleepSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepSessionCopyWith<$Res> {
  factory $SleepSessionCopyWith(
          SleepSession value, $Res Function(SleepSession) then) =
      _$SleepSessionCopyWithImpl<$Res, SleepSession>;
  @useResult
  $Res call(
      {String id,
      String oderId,
      DateTime bedTime,
      DateTime wakeTime,
      int totalMinutes,
      int deepSleepMinutes,
      int lightSleepMinutes,
      int remSleepMinutes,
      int awakeMinutes,
      double efficiency,
      int latencyMinutes,
      int sleepScore,
      String source,
      String? externalId});
}

/// @nodoc
class _$SleepSessionCopyWithImpl<$Res, $Val extends SleepSession>
    implements $SleepSessionCopyWith<$Res> {
  _$SleepSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oderId = null,
    Object? bedTime = null,
    Object? wakeTime = null,
    Object? totalMinutes = null,
    Object? deepSleepMinutes = null,
    Object? lightSleepMinutes = null,
    Object? remSleepMinutes = null,
    Object? awakeMinutes = null,
    Object? efficiency = null,
    Object? latencyMinutes = null,
    Object? sleepScore = null,
    Object? source = null,
    Object? externalId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      oderId: null == oderId
          ? _value.oderId
          : oderId // ignore: cast_nullable_to_non_nullable
              as String,
      bedTime: null == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wakeTime: null == wakeTime
          ? _value.wakeTime
          : wakeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalMinutes: null == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      deepSleepMinutes: null == deepSleepMinutes
          ? _value.deepSleepMinutes
          : deepSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      lightSleepMinutes: null == lightSleepMinutes
          ? _value.lightSleepMinutes
          : lightSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      remSleepMinutes: null == remSleepMinutes
          ? _value.remSleepMinutes
          : remSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      awakeMinutes: null == awakeMinutes
          ? _value.awakeMinutes
          : awakeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      efficiency: null == efficiency
          ? _value.efficiency
          : efficiency // ignore: cast_nullable_to_non_nullable
              as double,
      latencyMinutes: null == latencyMinutes
          ? _value.latencyMinutes
          : latencyMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      sleepScore: null == sleepScore
          ? _value.sleepScore
          : sleepScore // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepSessionImplCopyWith<$Res>
    implements $SleepSessionCopyWith<$Res> {
  factory _$$SleepSessionImplCopyWith(
          _$SleepSessionImpl value, $Res Function(_$SleepSessionImpl) then) =
      __$$SleepSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String oderId,
      DateTime bedTime,
      DateTime wakeTime,
      int totalMinutes,
      int deepSleepMinutes,
      int lightSleepMinutes,
      int remSleepMinutes,
      int awakeMinutes,
      double efficiency,
      int latencyMinutes,
      int sleepScore,
      String source,
      String? externalId});
}

/// @nodoc
class __$$SleepSessionImplCopyWithImpl<$Res>
    extends _$SleepSessionCopyWithImpl<$Res, _$SleepSessionImpl>
    implements _$$SleepSessionImplCopyWith<$Res> {
  __$$SleepSessionImplCopyWithImpl(
      _$SleepSessionImpl _value, $Res Function(_$SleepSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oderId = null,
    Object? bedTime = null,
    Object? wakeTime = null,
    Object? totalMinutes = null,
    Object? deepSleepMinutes = null,
    Object? lightSleepMinutes = null,
    Object? remSleepMinutes = null,
    Object? awakeMinutes = null,
    Object? efficiency = null,
    Object? latencyMinutes = null,
    Object? sleepScore = null,
    Object? source = null,
    Object? externalId = freezed,
  }) {
    return _then(_$SleepSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      oderId: null == oderId
          ? _value.oderId
          : oderId // ignore: cast_nullable_to_non_nullable
              as String,
      bedTime: null == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wakeTime: null == wakeTime
          ? _value.wakeTime
          : wakeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalMinutes: null == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      deepSleepMinutes: null == deepSleepMinutes
          ? _value.deepSleepMinutes
          : deepSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      lightSleepMinutes: null == lightSleepMinutes
          ? _value.lightSleepMinutes
          : lightSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      remSleepMinutes: null == remSleepMinutes
          ? _value.remSleepMinutes
          : remSleepMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      awakeMinutes: null == awakeMinutes
          ? _value.awakeMinutes
          : awakeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      efficiency: null == efficiency
          ? _value.efficiency
          : efficiency // ignore: cast_nullable_to_non_nullable
              as double,
      latencyMinutes: null == latencyMinutes
          ? _value.latencyMinutes
          : latencyMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      sleepScore: null == sleepScore
          ? _value.sleepScore
          : sleepScore // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepSessionImpl implements _SleepSession {
  const _$SleepSessionImpl(
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

  factory _$SleepSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String oderId;
  @override
  final DateTime bedTime;
  @override
  final DateTime wakeTime;
  @override
  final int totalMinutes;
  @override
  final int deepSleepMinutes;
  @override
  final int lightSleepMinutes;
  @override
  final int remSleepMinutes;
  @override
  final int awakeMinutes;
  @override
  final double efficiency;
// 0.0 - 1.0
  @override
  final int latencyMinutes;
// Time to fall asleep
  @override
  final int sleepScore;
// 0-100
  @override
  final String source;
// app, healthkit, health_connect
  @override
  final String? externalId;

  @override
  String toString() {
    return 'SleepSession(id: $id, oderId: $oderId, bedTime: $bedTime, wakeTime: $wakeTime, totalMinutes: $totalMinutes, deepSleepMinutes: $deepSleepMinutes, lightSleepMinutes: $lightSleepMinutes, remSleepMinutes: $remSleepMinutes, awakeMinutes: $awakeMinutes, efficiency: $efficiency, latencyMinutes: $latencyMinutes, sleepScore: $sleepScore, source: $source, externalId: $externalId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.oderId, oderId) || other.oderId == oderId) &&
            (identical(other.bedTime, bedTime) || other.bedTime == bedTime) &&
            (identical(other.wakeTime, wakeTime) ||
                other.wakeTime == wakeTime) &&
            (identical(other.totalMinutes, totalMinutes) ||
                other.totalMinutes == totalMinutes) &&
            (identical(other.deepSleepMinutes, deepSleepMinutes) ||
                other.deepSleepMinutes == deepSleepMinutes) &&
            (identical(other.lightSleepMinutes, lightSleepMinutes) ||
                other.lightSleepMinutes == lightSleepMinutes) &&
            (identical(other.remSleepMinutes, remSleepMinutes) ||
                other.remSleepMinutes == remSleepMinutes) &&
            (identical(other.awakeMinutes, awakeMinutes) ||
                other.awakeMinutes == awakeMinutes) &&
            (identical(other.efficiency, efficiency) ||
                other.efficiency == efficiency) &&
            (identical(other.latencyMinutes, latencyMinutes) ||
                other.latencyMinutes == latencyMinutes) &&
            (identical(other.sleepScore, sleepScore) ||
                other.sleepScore == sleepScore) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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

  /// Create a copy of SleepSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepSessionImplCopyWith<_$SleepSessionImpl> get copyWith =>
      __$$SleepSessionImplCopyWithImpl<_$SleepSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepSessionImplToJson(
      this,
    );
  }
}

abstract class _SleepSession implements SleepSession {
  const factory _SleepSession(
      {required final String id,
      required final String oderId,
      required final DateTime bedTime,
      required final DateTime wakeTime,
      required final int totalMinutes,
      required final int deepSleepMinutes,
      required final int lightSleepMinutes,
      required final int remSleepMinutes,
      required final int awakeMinutes,
      required final double efficiency,
      required final int latencyMinutes,
      required final int sleepScore,
      required final String source,
      final String? externalId}) = _$SleepSessionImpl;

  factory _SleepSession.fromJson(Map<String, dynamic> json) =
      _$SleepSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get oderId;
  @override
  DateTime get bedTime;
  @override
  DateTime get wakeTime;
  @override
  int get totalMinutes;
  @override
  int get deepSleepMinutes;
  @override
  int get lightSleepMinutes;
  @override
  int get remSleepMinutes;
  @override
  int get awakeMinutes;
  @override
  double get efficiency; // 0.0 - 1.0
  @override
  int get latencyMinutes; // Time to fall asleep
  @override
  int get sleepScore; // 0-100
  @override
  String get source; // app, healthkit, health_connect
  @override
  String? get externalId;

  /// Create a copy of SleepSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepSessionImplCopyWith<_$SleepSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
