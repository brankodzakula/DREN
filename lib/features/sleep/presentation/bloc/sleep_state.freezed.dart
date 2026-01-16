// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SleepInitial value) initial,
    required TResult Function(SleepLoading value) loading,
    required TResult Function(SleepLoaded value) loaded,
    required TResult Function(SleepError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SleepInitial value)? initial,
    TResult? Function(SleepLoading value)? loading,
    TResult? Function(SleepLoaded value)? loaded,
    TResult? Function(SleepError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SleepInitial value)? initial,
    TResult Function(SleepLoading value)? loading,
    TResult Function(SleepLoaded value)? loaded,
    TResult Function(SleepError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepStateCopyWith<$Res> {
  factory $SleepStateCopyWith(
          SleepState value, $Res Function(SleepState) then) =
      _$SleepStateCopyWithImpl<$Res, SleepState>;
}

/// @nodoc
class _$SleepStateCopyWithImpl<$Res, $Val extends SleepState>
    implements $SleepStateCopyWith<$Res> {
  _$SleepStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SleepInitialImplCopyWith<$Res> {
  factory _$$SleepInitialImplCopyWith(
          _$SleepInitialImpl value, $Res Function(_$SleepInitialImpl) then) =
      __$$SleepInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SleepInitialImplCopyWithImpl<$Res>
    extends _$SleepStateCopyWithImpl<$Res, _$SleepInitialImpl>
    implements _$$SleepInitialImplCopyWith<$Res> {
  __$$SleepInitialImplCopyWithImpl(
      _$SleepInitialImpl _value, $Res Function(_$SleepInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SleepInitialImpl implements SleepInitial {
  const _$SleepInitialImpl();

  @override
  String toString() {
    return 'SleepState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SleepInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(SleepInitial value) initial,
    required TResult Function(SleepLoading value) loading,
    required TResult Function(SleepLoaded value) loaded,
    required TResult Function(SleepError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SleepInitial value)? initial,
    TResult? Function(SleepLoading value)? loading,
    TResult? Function(SleepLoaded value)? loaded,
    TResult? Function(SleepError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SleepInitial value)? initial,
    TResult Function(SleepLoading value)? loading,
    TResult Function(SleepLoaded value)? loaded,
    TResult Function(SleepError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SleepInitial implements SleepState {
  const factory SleepInitial() = _$SleepInitialImpl;
}

/// @nodoc
abstract class _$$SleepLoadingImplCopyWith<$Res> {
  factory _$$SleepLoadingImplCopyWith(
          _$SleepLoadingImpl value, $Res Function(_$SleepLoadingImpl) then) =
      __$$SleepLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SleepLoadingImplCopyWithImpl<$Res>
    extends _$SleepStateCopyWithImpl<$Res, _$SleepLoadingImpl>
    implements _$$SleepLoadingImplCopyWith<$Res> {
  __$$SleepLoadingImplCopyWithImpl(
      _$SleepLoadingImpl _value, $Res Function(_$SleepLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SleepLoadingImpl implements SleepLoading {
  const _$SleepLoadingImpl();

  @override
  String toString() {
    return 'SleepState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SleepLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(SleepInitial value) initial,
    required TResult Function(SleepLoading value) loading,
    required TResult Function(SleepLoaded value) loaded,
    required TResult Function(SleepError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SleepInitial value)? initial,
    TResult? Function(SleepLoading value)? loading,
    TResult? Function(SleepLoaded value)? loaded,
    TResult? Function(SleepError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SleepInitial value)? initial,
    TResult Function(SleepLoading value)? loading,
    TResult Function(SleepLoaded value)? loaded,
    TResult Function(SleepError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SleepLoading implements SleepState {
  const factory SleepLoading() = _$SleepLoadingImpl;
}

/// @nodoc
abstract class _$$SleepLoadedImplCopyWith<$Res> {
  factory _$$SleepLoadedImplCopyWith(
          _$SleepLoadedImpl value, $Res Function(_$SleepLoadedImpl) then) =
      __$$SleepLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SleepSession? lastNight,
      SleepSchedule schedule,
      SleepHabitLog? todayHabits,
      List<Meditation> meditations,
      String? selectedCategory,
      Meditation? playingMeditation,
      double averageSleepScore,
      int? minutesToBedtime,
      bool isWindDownActive});

  $SleepSessionCopyWith<$Res>? get lastNight;
  $SleepScheduleCopyWith<$Res> get schedule;
  $SleepHabitLogCopyWith<$Res>? get todayHabits;
  $MeditationCopyWith<$Res>? get playingMeditation;
}

/// @nodoc
class __$$SleepLoadedImplCopyWithImpl<$Res>
    extends _$SleepStateCopyWithImpl<$Res, _$SleepLoadedImpl>
    implements _$$SleepLoadedImplCopyWith<$Res> {
  __$$SleepLoadedImplCopyWithImpl(
      _$SleepLoadedImpl _value, $Res Function(_$SleepLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastNight = freezed,
    Object? schedule = null,
    Object? todayHabits = freezed,
    Object? meditations = null,
    Object? selectedCategory = freezed,
    Object? playingMeditation = freezed,
    Object? averageSleepScore = null,
    Object? minutesToBedtime = freezed,
    Object? isWindDownActive = null,
  }) {
    return _then(_$SleepLoadedImpl(
      lastNight: freezed == lastNight
          ? _value.lastNight
          : lastNight // ignore: cast_nullable_to_non_nullable
              as SleepSession?,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as SleepSchedule,
      todayHabits: freezed == todayHabits
          ? _value.todayHabits
          : todayHabits // ignore: cast_nullable_to_non_nullable
              as SleepHabitLog?,
      meditations: null == meditations
          ? _value._meditations
          : meditations // ignore: cast_nullable_to_non_nullable
              as List<Meditation>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      playingMeditation: freezed == playingMeditation
          ? _value.playingMeditation
          : playingMeditation // ignore: cast_nullable_to_non_nullable
              as Meditation?,
      averageSleepScore: null == averageSleepScore
          ? _value.averageSleepScore
          : averageSleepScore // ignore: cast_nullable_to_non_nullable
              as double,
      minutesToBedtime: freezed == minutesToBedtime
          ? _value.minutesToBedtime
          : minutesToBedtime // ignore: cast_nullable_to_non_nullable
              as int?,
      isWindDownActive: null == isWindDownActive
          ? _value.isWindDownActive
          : isWindDownActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepSessionCopyWith<$Res>? get lastNight {
    if (_value.lastNight == null) {
      return null;
    }

    return $SleepSessionCopyWith<$Res>(_value.lastNight!, (value) {
      return _then(_value.copyWith(lastNight: value));
    });
  }

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepScheduleCopyWith<$Res> get schedule {
    return $SleepScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepHabitLogCopyWith<$Res>? get todayHabits {
    if (_value.todayHabits == null) {
      return null;
    }

    return $SleepHabitLogCopyWith<$Res>(_value.todayHabits!, (value) {
      return _then(_value.copyWith(todayHabits: value));
    });
  }

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MeditationCopyWith<$Res>? get playingMeditation {
    if (_value.playingMeditation == null) {
      return null;
    }

    return $MeditationCopyWith<$Res>(_value.playingMeditation!, (value) {
      return _then(_value.copyWith(playingMeditation: value));
    });
  }
}

/// @nodoc

class _$SleepLoadedImpl implements SleepLoaded {
  const _$SleepLoadedImpl(
      {this.lastNight,
      required this.schedule,
      this.todayHabits,
      required final List<Meditation> meditations,
      this.selectedCategory,
      this.playingMeditation,
      this.averageSleepScore = 0.0,
      this.minutesToBedtime,
      this.isWindDownActive = false})
      : _meditations = meditations;

  /// Last night's sleep session (may be null if no data)
  @override
  final SleepSession? lastNight;

  /// User's sleep schedule from protocol
  @override
  final SleepSchedule schedule;

  /// Tonight's sleep habit checklist
  @override
  final SleepHabitLog? todayHabits;

  /// Available meditations grouped by category
  final List<Meditation> _meditations;

  /// Available meditations grouped by category
  @override
  List<Meditation> get meditations {
    if (_meditations is EqualUnmodifiableListView) return _meditations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meditations);
  }

  /// Currently selected meditation category filter
  @override
  final String? selectedCategory;

  /// Currently playing meditation (if any)
  @override
  final Meditation? playingMeditation;

  /// Average sleep score for last 7 days
  @override
  @JsonKey()
  final double averageSleepScore;

  /// Time until bedtime in minutes (null if past bedtime)
  @override
  final int? minutesToBedtime;

  /// Whether wind-down period has started
  @override
  @JsonKey()
  final bool isWindDownActive;

  @override
  String toString() {
    return 'SleepState.loaded(lastNight: $lastNight, schedule: $schedule, todayHabits: $todayHabits, meditations: $meditations, selectedCategory: $selectedCategory, playingMeditation: $playingMeditation, averageSleepScore: $averageSleepScore, minutesToBedtime: $minutesToBedtime, isWindDownActive: $isWindDownActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepLoadedImpl &&
            (identical(other.lastNight, lastNight) ||
                other.lastNight == lastNight) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.todayHabits, todayHabits) ||
                other.todayHabits == todayHabits) &&
            const DeepCollectionEquality()
                .equals(other._meditations, _meditations) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.playingMeditation, playingMeditation) ||
                other.playingMeditation == playingMeditation) &&
            (identical(other.averageSleepScore, averageSleepScore) ||
                other.averageSleepScore == averageSleepScore) &&
            (identical(other.minutesToBedtime, minutesToBedtime) ||
                other.minutesToBedtime == minutesToBedtime) &&
            (identical(other.isWindDownActive, isWindDownActive) ||
                other.isWindDownActive == isWindDownActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastNight,
      schedule,
      todayHabits,
      const DeepCollectionEquality().hash(_meditations),
      selectedCategory,
      playingMeditation,
      averageSleepScore,
      minutesToBedtime,
      isWindDownActive);

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepLoadedImplCopyWith<_$SleepLoadedImpl> get copyWith =>
      __$$SleepLoadedImplCopyWithImpl<_$SleepLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        lastNight,
        schedule,
        todayHabits,
        meditations,
        selectedCategory,
        playingMeditation,
        averageSleepScore,
        minutesToBedtime,
        isWindDownActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        lastNight,
        schedule,
        todayHabits,
        meditations,
        selectedCategory,
        playingMeditation,
        averageSleepScore,
        minutesToBedtime,
        isWindDownActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          lastNight,
          schedule,
          todayHabits,
          meditations,
          selectedCategory,
          playingMeditation,
          averageSleepScore,
          minutesToBedtime,
          isWindDownActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SleepInitial value) initial,
    required TResult Function(SleepLoading value) loading,
    required TResult Function(SleepLoaded value) loaded,
    required TResult Function(SleepError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SleepInitial value)? initial,
    TResult? Function(SleepLoading value)? loading,
    TResult? Function(SleepLoaded value)? loaded,
    TResult? Function(SleepError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SleepInitial value)? initial,
    TResult Function(SleepLoading value)? loading,
    TResult Function(SleepLoaded value)? loaded,
    TResult Function(SleepError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SleepLoaded implements SleepState {
  const factory SleepLoaded(
      {final SleepSession? lastNight,
      required final SleepSchedule schedule,
      final SleepHabitLog? todayHabits,
      required final List<Meditation> meditations,
      final String? selectedCategory,
      final Meditation? playingMeditation,
      final double averageSleepScore,
      final int? minutesToBedtime,
      final bool isWindDownActive}) = _$SleepLoadedImpl;

  /// Last night's sleep session (may be null if no data)
  SleepSession? get lastNight;

  /// User's sleep schedule from protocol
  SleepSchedule get schedule;

  /// Tonight's sleep habit checklist
  SleepHabitLog? get todayHabits;

  /// Available meditations grouped by category
  List<Meditation> get meditations;

  /// Currently selected meditation category filter
  String? get selectedCategory;

  /// Currently playing meditation (if any)
  Meditation? get playingMeditation;

  /// Average sleep score for last 7 days
  double get averageSleepScore;

  /// Time until bedtime in minutes (null if past bedtime)
  int? get minutesToBedtime;

  /// Whether wind-down period has started
  bool get isWindDownActive;

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepLoadedImplCopyWith<_$SleepLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SleepErrorImplCopyWith<$Res> {
  factory _$$SleepErrorImplCopyWith(
          _$SleepErrorImpl value, $Res Function(_$SleepErrorImpl) then) =
      __$$SleepErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SleepErrorImplCopyWithImpl<$Res>
    extends _$SleepStateCopyWithImpl<$Res, _$SleepErrorImpl>
    implements _$$SleepErrorImplCopyWith<$Res> {
  __$$SleepErrorImplCopyWithImpl(
      _$SleepErrorImpl _value, $Res Function(_$SleepErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SleepErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SleepErrorImpl implements SleepError {
  const _$SleepErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SleepState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepErrorImplCopyWith<_$SleepErrorImpl> get copyWith =>
      __$$SleepErrorImplCopyWithImpl<_$SleepErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SleepSession? lastNight,
            SleepSchedule schedule,
            SleepHabitLog? todayHabits,
            List<Meditation> meditations,
            String? selectedCategory,
            Meditation? playingMeditation,
            double averageSleepScore,
            int? minutesToBedtime,
            bool isWindDownActive)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SleepInitial value) initial,
    required TResult Function(SleepLoading value) loading,
    required TResult Function(SleepLoaded value) loaded,
    required TResult Function(SleepError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SleepInitial value)? initial,
    TResult? Function(SleepLoading value)? loading,
    TResult? Function(SleepLoaded value)? loaded,
    TResult? Function(SleepError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SleepInitial value)? initial,
    TResult Function(SleepLoading value)? loading,
    TResult Function(SleepLoaded value)? loaded,
    TResult Function(SleepError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SleepError implements SleepState {
  const factory SleepError({required final String message}) = _$SleepErrorImpl;

  String get message;

  /// Create a copy of SleepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepErrorImplCopyWith<_$SleepErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
