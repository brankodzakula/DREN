// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ring_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RingSummary _$RingSummaryFromJson(Map<String, dynamic> json) {
  return _RingSummary.fromJson(json);
}

/// @nodoc
mixin _$RingSummary {
  /// Calories In ring (green) - calories consumed vs target
  RingData get caloriesIn => throw _privateConstructorUsedError;

  /// Calories Out ring (red) - calories burned vs target
  RingData get caloriesOut => throw _privateConstructorUsedError;

  /// Exercise ring (blue) - minutes exercised vs target
  RingData get exercise => throw _privateConstructorUsedError;

  /// Sleep ring (purple) - hours slept vs target
  RingData get sleep => throw _privateConstructorUsedError;

  /// Serializes this RingSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RingSummaryCopyWith<RingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RingSummaryCopyWith<$Res> {
  factory $RingSummaryCopyWith(
          RingSummary value, $Res Function(RingSummary) then) =
      _$RingSummaryCopyWithImpl<$Res, RingSummary>;
  @useResult
  $Res call(
      {RingData caloriesIn,
      RingData caloriesOut,
      RingData exercise,
      RingData sleep});

  $RingDataCopyWith<$Res> get caloriesIn;
  $RingDataCopyWith<$Res> get caloriesOut;
  $RingDataCopyWith<$Res> get exercise;
  $RingDataCopyWith<$Res> get sleep;
}

/// @nodoc
class _$RingSummaryCopyWithImpl<$Res, $Val extends RingSummary>
    implements $RingSummaryCopyWith<$Res> {
  _$RingSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caloriesIn = null,
    Object? caloriesOut = null,
    Object? exercise = null,
    Object? sleep = null,
  }) {
    return _then(_value.copyWith(
      caloriesIn: null == caloriesIn
          ? _value.caloriesIn
          : caloriesIn // ignore: cast_nullable_to_non_nullable
              as RingData,
      caloriesOut: null == caloriesOut
          ? _value.caloriesOut
          : caloriesOut // ignore: cast_nullable_to_non_nullable
              as RingData,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as RingData,
      sleep: null == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as RingData,
    ) as $Val);
  }

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RingDataCopyWith<$Res> get caloriesIn {
    return $RingDataCopyWith<$Res>(_value.caloriesIn, (value) {
      return _then(_value.copyWith(caloriesIn: value) as $Val);
    });
  }

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RingDataCopyWith<$Res> get caloriesOut {
    return $RingDataCopyWith<$Res>(_value.caloriesOut, (value) {
      return _then(_value.copyWith(caloriesOut: value) as $Val);
    });
  }

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RingDataCopyWith<$Res> get exercise {
    return $RingDataCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RingDataCopyWith<$Res> get sleep {
    return $RingDataCopyWith<$Res>(_value.sleep, (value) {
      return _then(_value.copyWith(sleep: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RingSummaryImplCopyWith<$Res>
    implements $RingSummaryCopyWith<$Res> {
  factory _$$RingSummaryImplCopyWith(
          _$RingSummaryImpl value, $Res Function(_$RingSummaryImpl) then) =
      __$$RingSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RingData caloriesIn,
      RingData caloriesOut,
      RingData exercise,
      RingData sleep});

  @override
  $RingDataCopyWith<$Res> get caloriesIn;
  @override
  $RingDataCopyWith<$Res> get caloriesOut;
  @override
  $RingDataCopyWith<$Res> get exercise;
  @override
  $RingDataCopyWith<$Res> get sleep;
}

/// @nodoc
class __$$RingSummaryImplCopyWithImpl<$Res>
    extends _$RingSummaryCopyWithImpl<$Res, _$RingSummaryImpl>
    implements _$$RingSummaryImplCopyWith<$Res> {
  __$$RingSummaryImplCopyWithImpl(
      _$RingSummaryImpl _value, $Res Function(_$RingSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caloriesIn = null,
    Object? caloriesOut = null,
    Object? exercise = null,
    Object? sleep = null,
  }) {
    return _then(_$RingSummaryImpl(
      caloriesIn: null == caloriesIn
          ? _value.caloriesIn
          : caloriesIn // ignore: cast_nullable_to_non_nullable
              as RingData,
      caloriesOut: null == caloriesOut
          ? _value.caloriesOut
          : caloriesOut // ignore: cast_nullable_to_non_nullable
              as RingData,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as RingData,
      sleep: null == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as RingData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RingSummaryImpl implements _RingSummary {
  const _$RingSummaryImpl(
      {required this.caloriesIn,
      required this.caloriesOut,
      required this.exercise,
      required this.sleep});

  factory _$RingSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RingSummaryImplFromJson(json);

  /// Calories In ring (green) - calories consumed vs target
  @override
  final RingData caloriesIn;

  /// Calories Out ring (red) - calories burned vs target
  @override
  final RingData caloriesOut;

  /// Exercise ring (blue) - minutes exercised vs target
  @override
  final RingData exercise;

  /// Sleep ring (purple) - hours slept vs target
  @override
  final RingData sleep;

  @override
  String toString() {
    return 'RingSummary(caloriesIn: $caloriesIn, caloriesOut: $caloriesOut, exercise: $exercise, sleep: $sleep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RingSummaryImpl &&
            (identical(other.caloriesIn, caloriesIn) ||
                other.caloriesIn == caloriesIn) &&
            (identical(other.caloriesOut, caloriesOut) ||
                other.caloriesOut == caloriesOut) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.sleep, sleep) || other.sleep == sleep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, caloriesIn, caloriesOut, exercise, sleep);

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RingSummaryImplCopyWith<_$RingSummaryImpl> get copyWith =>
      __$$RingSummaryImplCopyWithImpl<_$RingSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RingSummaryImplToJson(
      this,
    );
  }
}

abstract class _RingSummary implements RingSummary {
  const factory _RingSummary(
      {required final RingData caloriesIn,
      required final RingData caloriesOut,
      required final RingData exercise,
      required final RingData sleep}) = _$RingSummaryImpl;

  factory _RingSummary.fromJson(Map<String, dynamic> json) =
      _$RingSummaryImpl.fromJson;

  /// Calories In ring (green) - calories consumed vs target
  @override
  RingData get caloriesIn;

  /// Calories Out ring (red) - calories burned vs target
  @override
  RingData get caloriesOut;

  /// Exercise ring (blue) - minutes exercised vs target
  @override
  RingData get exercise;

  /// Sleep ring (purple) - hours slept vs target
  @override
  RingData get sleep;

  /// Create a copy of RingSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RingSummaryImplCopyWith<_$RingSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RingData _$RingDataFromJson(Map<String, dynamic> json) {
  return _RingData.fromJson(json);
}

/// @nodoc
mixin _$RingData {
  int get current => throw _privateConstructorUsedError;
  int get target => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Serializes this RingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RingDataCopyWith<RingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RingDataCopyWith<$Res> {
  factory $RingDataCopyWith(RingData value, $Res Function(RingData) then) =
      _$RingDataCopyWithImpl<$Res, RingData>;
  @useResult
  $Res call({int current, int target, String label, String unit});
}

/// @nodoc
class _$RingDataCopyWithImpl<$Res, $Val extends RingData>
    implements $RingDataCopyWith<$Res> {
  _$RingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? target = null,
    Object? label = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RingDataImplCopyWith<$Res>
    implements $RingDataCopyWith<$Res> {
  factory _$$RingDataImplCopyWith(
          _$RingDataImpl value, $Res Function(_$RingDataImpl) then) =
      __$$RingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current, int target, String label, String unit});
}

/// @nodoc
class __$$RingDataImplCopyWithImpl<$Res>
    extends _$RingDataCopyWithImpl<$Res, _$RingDataImpl>
    implements _$$RingDataImplCopyWith<$Res> {
  __$$RingDataImplCopyWithImpl(
      _$RingDataImpl _value, $Res Function(_$RingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? target = null,
    Object? label = null,
    Object? unit = null,
  }) {
    return _then(_$RingDataImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RingDataImpl extends _RingData {
  const _$RingDataImpl(
      {required this.current,
      required this.target,
      required this.label,
      required this.unit})
      : super._();

  factory _$RingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RingDataImplFromJson(json);

  @override
  final int current;
  @override
  final int target;
  @override
  final String label;
  @override
  final String unit;

  @override
  String toString() {
    return 'RingData(current: $current, target: $target, label: $label, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RingDataImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current, target, label, unit);

  /// Create a copy of RingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RingDataImplCopyWith<_$RingDataImpl> get copyWith =>
      __$$RingDataImplCopyWithImpl<_$RingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RingDataImplToJson(
      this,
    );
  }
}

abstract class _RingData extends RingData {
  const factory _RingData(
      {required final int current,
      required final int target,
      required final String label,
      required final String unit}) = _$RingDataImpl;
  const _RingData._() : super._();

  factory _RingData.fromJson(Map<String, dynamic> json) =
      _$RingDataImpl.fromJson;

  @override
  int get current;
  @override
  int get target;
  @override
  String get label;
  @override
  String get unit;

  /// Create a copy of RingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RingDataImplCopyWith<_$RingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
