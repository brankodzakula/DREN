// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodayState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)
        loaded,
    required TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult? Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayInitial value) initial,
    required TResult Function(TodayLoading value) loading,
    required TResult Function(TodayLoaded value) loaded,
    required TResult Function(TodayError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayInitial value)? initial,
    TResult? Function(TodayLoading value)? loading,
    TResult? Function(TodayLoaded value)? loaded,
    TResult? Function(TodayError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayInitial value)? initial,
    TResult Function(TodayLoading value)? loading,
    TResult Function(TodayLoaded value)? loaded,
    TResult Function(TodayError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayStateCopyWith<$Res> {
  factory $TodayStateCopyWith(
          TodayState value, $Res Function(TodayState) then) =
      _$TodayStateCopyWithImpl<$Res, TodayState>;
}

/// @nodoc
class _$TodayStateCopyWithImpl<$Res, $Val extends TodayState>
    implements $TodayStateCopyWith<$Res> {
  _$TodayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TodayInitialImplCopyWith<$Res> {
  factory _$$TodayInitialImplCopyWith(
          _$TodayInitialImpl value, $Res Function(_$TodayInitialImpl) then) =
      __$$TodayInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodayInitialImplCopyWithImpl<$Res>
    extends _$TodayStateCopyWithImpl<$Res, _$TodayInitialImpl>
    implements _$$TodayInitialImplCopyWith<$Res> {
  __$$TodayInitialImplCopyWithImpl(
      _$TodayInitialImpl _value, $Res Function(_$TodayInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodayInitialImpl implements TodayInitial {
  const _$TodayInitialImpl();

  @override
  String toString() {
    return 'TodayState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodayInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)
        loaded,
    required TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult? Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayInitial value) initial,
    required TResult Function(TodayLoading value) loading,
    required TResult Function(TodayLoaded value) loaded,
    required TResult Function(TodayError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayInitial value)? initial,
    TResult? Function(TodayLoading value)? loading,
    TResult? Function(TodayLoaded value)? loaded,
    TResult? Function(TodayError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayInitial value)? initial,
    TResult Function(TodayLoading value)? loading,
    TResult Function(TodayLoaded value)? loaded,
    TResult Function(TodayError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TodayInitial implements TodayState {
  const factory TodayInitial() = _$TodayInitialImpl;
}

/// @nodoc
abstract class _$$TodayLoadingImplCopyWith<$Res> {
  factory _$$TodayLoadingImplCopyWith(
          _$TodayLoadingImpl value, $Res Function(_$TodayLoadingImpl) then) =
      __$$TodayLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodayLoadingImplCopyWithImpl<$Res>
    extends _$TodayStateCopyWithImpl<$Res, _$TodayLoadingImpl>
    implements _$$TodayLoadingImplCopyWith<$Res> {
  __$$TodayLoadingImplCopyWithImpl(
      _$TodayLoadingImpl _value, $Res Function(_$TodayLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodayLoadingImpl implements TodayLoading {
  const _$TodayLoadingImpl();

  @override
  String toString() {
    return 'TodayState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodayLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)
        loaded,
    required TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult? Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayInitial value) initial,
    required TResult Function(TodayLoading value) loading,
    required TResult Function(TodayLoaded value) loaded,
    required TResult Function(TodayError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayInitial value)? initial,
    TResult? Function(TodayLoading value)? loading,
    TResult? Function(TodayLoaded value)? loaded,
    TResult? Function(TodayError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayInitial value)? initial,
    TResult Function(TodayLoading value)? loading,
    TResult Function(TodayLoaded value)? loaded,
    TResult Function(TodayError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodayLoading implements TodayState {
  const factory TodayLoading() = _$TodayLoadingImpl;
}

/// @nodoc
abstract class _$$TodayLoadedImplCopyWith<$Res> {
  factory _$$TodayLoadedImplCopyWith(
          _$TodayLoadedImpl value, $Res Function(_$TodayLoadedImpl) then) =
      __$$TodayLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DailyProgress progress,
      RingSummary rings,
      DailyProtocol? protocol,
      DateTime lastUpdated});

  $DailyProgressCopyWith<$Res> get progress;
  $RingSummaryCopyWith<$Res> get rings;
  $DailyProtocolCopyWith<$Res>? get protocol;
}

/// @nodoc
class __$$TodayLoadedImplCopyWithImpl<$Res>
    extends _$TodayStateCopyWithImpl<$Res, _$TodayLoadedImpl>
    implements _$$TodayLoadedImplCopyWith<$Res> {
  __$$TodayLoadedImplCopyWithImpl(
      _$TodayLoadedImpl _value, $Res Function(_$TodayLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? rings = null,
    Object? protocol = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_$TodayLoadedImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as DailyProgress,
      rings: null == rings
          ? _value.rings
          : rings // ignore: cast_nullable_to_non_nullable
              as RingSummary,
      protocol: freezed == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as DailyProtocol?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyProgressCopyWith<$Res> get progress {
    return $DailyProgressCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value));
    });
  }

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RingSummaryCopyWith<$Res> get rings {
    return $RingSummaryCopyWith<$Res>(_value.rings, (value) {
      return _then(_value.copyWith(rings: value));
    });
  }

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyProtocolCopyWith<$Res>? get protocol {
    if (_value.protocol == null) {
      return null;
    }

    return $DailyProtocolCopyWith<$Res>(_value.protocol!, (value) {
      return _then(_value.copyWith(protocol: value));
    });
  }
}

/// @nodoc

class _$TodayLoadedImpl implements TodayLoaded {
  const _$TodayLoadedImpl(
      {required this.progress,
      required this.rings,
      this.protocol,
      required this.lastUpdated});

  @override
  final DailyProgress progress;
  @override
  final RingSummary rings;
  @override
  final DailyProtocol? protocol;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'TodayState.loaded(progress: $progress, rings: $rings, protocol: $protocol, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayLoadedImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.rings, rings) || other.rings == rings) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, progress, rings, protocol, lastUpdated);

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayLoadedImplCopyWith<_$TodayLoadedImpl> get copyWith =>
      __$$TodayLoadedImplCopyWithImpl<_$TodayLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)
        loaded,
    required TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)
        error,
  }) {
    return loaded(progress, rings, protocol, lastUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult? Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
  }) {
    return loaded?.call(progress, rings, protocol, lastUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(progress, rings, protocol, lastUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayInitial value) initial,
    required TResult Function(TodayLoading value) loading,
    required TResult Function(TodayLoaded value) loaded,
    required TResult Function(TodayError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayInitial value)? initial,
    TResult? Function(TodayLoading value)? loading,
    TResult? Function(TodayLoaded value)? loaded,
    TResult? Function(TodayError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayInitial value)? initial,
    TResult Function(TodayLoading value)? loading,
    TResult Function(TodayLoaded value)? loaded,
    TResult Function(TodayError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TodayLoaded implements TodayState {
  const factory TodayLoaded(
      {required final DailyProgress progress,
      required final RingSummary rings,
      final DailyProtocol? protocol,
      required final DateTime lastUpdated}) = _$TodayLoadedImpl;

  DailyProgress get progress;
  RingSummary get rings;
  DailyProtocol? get protocol;
  DateTime get lastUpdated;

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayLoadedImplCopyWith<_$TodayLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodayErrorImplCopyWith<$Res> {
  factory _$$TodayErrorImplCopyWith(
          _$TodayErrorImpl value, $Res Function(_$TodayErrorImpl) then) =
      __$$TodayErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String message,
      DailyProgress? previousProgress,
      RingSummary? previousRings});

  $DailyProgressCopyWith<$Res>? get previousProgress;
  $RingSummaryCopyWith<$Res>? get previousRings;
}

/// @nodoc
class __$$TodayErrorImplCopyWithImpl<$Res>
    extends _$TodayStateCopyWithImpl<$Res, _$TodayErrorImpl>
    implements _$$TodayErrorImplCopyWith<$Res> {
  __$$TodayErrorImplCopyWithImpl(
      _$TodayErrorImpl _value, $Res Function(_$TodayErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? previousProgress = freezed,
    Object? previousRings = freezed,
  }) {
    return _then(_$TodayErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      previousProgress: freezed == previousProgress
          ? _value.previousProgress
          : previousProgress // ignore: cast_nullable_to_non_nullable
              as DailyProgress?,
      previousRings: freezed == previousRings
          ? _value.previousRings
          : previousRings // ignore: cast_nullable_to_non_nullable
              as RingSummary?,
    ));
  }

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyProgressCopyWith<$Res>? get previousProgress {
    if (_value.previousProgress == null) {
      return null;
    }

    return $DailyProgressCopyWith<$Res>(_value.previousProgress!, (value) {
      return _then(_value.copyWith(previousProgress: value));
    });
  }

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RingSummaryCopyWith<$Res>? get previousRings {
    if (_value.previousRings == null) {
      return null;
    }

    return $RingSummaryCopyWith<$Res>(_value.previousRings!, (value) {
      return _then(_value.copyWith(previousRings: value));
    });
  }
}

/// @nodoc

class _$TodayErrorImpl implements TodayError {
  const _$TodayErrorImpl(
      {required this.message, this.previousProgress, this.previousRings});

  @override
  final String message;
  @override
  final DailyProgress? previousProgress;
  @override
  final RingSummary? previousRings;

  @override
  String toString() {
    return 'TodayState.error(message: $message, previousProgress: $previousProgress, previousRings: $previousRings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.previousProgress, previousProgress) ||
                other.previousProgress == previousProgress) &&
            (identical(other.previousRings, previousRings) ||
                other.previousRings == previousRings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, previousProgress, previousRings);

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayErrorImplCopyWith<_$TodayErrorImpl> get copyWith =>
      __$$TodayErrorImplCopyWithImpl<_$TodayErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)
        loaded,
    required TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)
        error,
  }) {
    return error(message, previousProgress, previousRings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult? Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
  }) {
    return error?.call(message, previousProgress, previousRings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DailyProgress progress, RingSummary rings,
            DailyProtocol? protocol, DateTime lastUpdated)?
        loaded,
    TResult Function(String message, DailyProgress? previousProgress,
            RingSummary? previousRings)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, previousProgress, previousRings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayInitial value) initial,
    required TResult Function(TodayLoading value) loading,
    required TResult Function(TodayLoaded value) loaded,
    required TResult Function(TodayError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayInitial value)? initial,
    TResult? Function(TodayLoading value)? loading,
    TResult? Function(TodayLoaded value)? loaded,
    TResult? Function(TodayError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayInitial value)? initial,
    TResult Function(TodayLoading value)? loading,
    TResult Function(TodayLoaded value)? loaded,
    TResult Function(TodayError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TodayError implements TodayState {
  const factory TodayError(
      {required final String message,
      final DailyProgress? previousProgress,
      final RingSummary? previousRings}) = _$TodayErrorImpl;

  String get message;
  DailyProgress? get previousProgress;
  RingSummary? get previousRings;

  /// Create a copy of TodayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayErrorImplCopyWith<_$TodayErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
