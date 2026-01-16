// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnboardingInitialImplCopyWith<$Res> {
  factory _$$OnboardingInitialImplCopyWith(_$OnboardingInitialImpl value,
          $Res Function(_$OnboardingInitialImpl) then) =
      __$$OnboardingInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingInitialImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingInitialImpl>
    implements _$$OnboardingInitialImplCopyWith<$Res> {
  __$$OnboardingInitialImplCopyWithImpl(_$OnboardingInitialImpl _value,
      $Res Function(_$OnboardingInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnboardingInitialImpl implements OnboardingInitial {
  const _$OnboardingInitialImpl();

  @override
  String toString() {
    return 'OnboardingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
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
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OnboardingInitial implements OnboardingState {
  const factory OnboardingInitial() = _$OnboardingInitialImpl;
}

/// @nodoc
abstract class _$$OnboardingLoadingImplCopyWith<$Res> {
  factory _$$OnboardingLoadingImplCopyWith(_$OnboardingLoadingImpl value,
          $Res Function(_$OnboardingLoadingImpl) then) =
      __$$OnboardingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingLoadingImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingLoadingImpl>
    implements _$$OnboardingLoadingImplCopyWith<$Res> {
  __$$OnboardingLoadingImplCopyWithImpl(_$OnboardingLoadingImpl _value,
      $Res Function(_$OnboardingLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnboardingLoadingImpl implements OnboardingLoading {
  const _$OnboardingLoadingImpl();

  @override
  String toString() {
    return 'OnboardingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
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
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OnboardingLoading implements OnboardingState {
  const factory OnboardingLoading() = _$OnboardingLoadingImpl;
}

/// @nodoc
abstract class _$$OnboardingCollectingImplCopyWith<$Res> {
  factory _$$OnboardingCollectingImplCopyWith(_$OnboardingCollectingImpl value,
          $Res Function(_$OnboardingCollectingImpl) then) =
      __$$OnboardingCollectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {OnboardingStep currentStep,
      OnboardingData data,
      bool isStepValid,
      String? stepError});

  $OnboardingDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$OnboardingCollectingImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingCollectingImpl>
    implements _$$OnboardingCollectingImplCopyWith<$Res> {
  __$$OnboardingCollectingImplCopyWithImpl(_$OnboardingCollectingImpl _value,
      $Res Function(_$OnboardingCollectingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? data = null,
    Object? isStepValid = null,
    Object? stepError = freezed,
  }) {
    return _then(_$OnboardingCollectingImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as OnboardingStep,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OnboardingData,
      isStepValid: null == isStepValid
          ? _value.isStepValid
          : isStepValid // ignore: cast_nullable_to_non_nullable
              as bool,
      stepError: freezed == stepError
          ? _value.stepError
          : stepError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OnboardingDataCopyWith<$Res> get data {
    return $OnboardingDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$OnboardingCollectingImpl implements OnboardingCollecting {
  const _$OnboardingCollectingImpl(
      {required this.currentStep,
      required this.data,
      this.isStepValid = false,
      this.stepError});

  @override
  final OnboardingStep currentStep;
  @override
  final OnboardingData data;
  @override
  @JsonKey()
  final bool isStepValid;
  @override
  final String? stepError;

  @override
  String toString() {
    return 'OnboardingState.collecting(currentStep: $currentStep, data: $data, isStepValid: $isStepValid, stepError: $stepError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingCollectingImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isStepValid, isStepValid) ||
                other.isStepValid == isStepValid) &&
            (identical(other.stepError, stepError) ||
                other.stepError == stepError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentStep, data, isStepValid, stepError);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingCollectingImplCopyWith<_$OnboardingCollectingImpl>
      get copyWith =>
          __$$OnboardingCollectingImplCopyWithImpl<_$OnboardingCollectingImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return collecting(currentStep, data, isStepValid, stepError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return collecting?.call(currentStep, data, isStepValid, stepError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
    required TResult orElse(),
  }) {
    if (collecting != null) {
      return collecting(currentStep, data, isStepValid, stepError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return collecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return collecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (collecting != null) {
      return collecting(this);
    }
    return orElse();
  }
}

abstract class OnboardingCollecting implements OnboardingState {
  const factory OnboardingCollecting(
      {required final OnboardingStep currentStep,
      required final OnboardingData data,
      final bool isStepValid,
      final String? stepError}) = _$OnboardingCollectingImpl;

  OnboardingStep get currentStep;
  OnboardingData get data;
  bool get isStepValid;
  String? get stepError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingCollectingImplCopyWith<_$OnboardingCollectingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnboardingValidatingImplCopyWith<$Res> {
  factory _$$OnboardingValidatingImplCopyWith(_$OnboardingValidatingImpl value,
          $Res Function(_$OnboardingValidatingImpl) then) =
      __$$OnboardingValidatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OnboardingStep currentStep, OnboardingData data});

  $OnboardingDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$OnboardingValidatingImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingValidatingImpl>
    implements _$$OnboardingValidatingImplCopyWith<$Res> {
  __$$OnboardingValidatingImplCopyWithImpl(_$OnboardingValidatingImpl _value,
      $Res Function(_$OnboardingValidatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? data = null,
  }) {
    return _then(_$OnboardingValidatingImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as OnboardingStep,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OnboardingData,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OnboardingDataCopyWith<$Res> get data {
    return $OnboardingDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$OnboardingValidatingImpl implements OnboardingValidating {
  const _$OnboardingValidatingImpl(
      {required this.currentStep, required this.data});

  @override
  final OnboardingStep currentStep;
  @override
  final OnboardingData data;

  @override
  String toString() {
    return 'OnboardingState.validating(currentStep: $currentStep, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingValidatingImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, data);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingValidatingImplCopyWith<_$OnboardingValidatingImpl>
      get copyWith =>
          __$$OnboardingValidatingImplCopyWithImpl<_$OnboardingValidatingImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return validating(currentStep, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return validating?.call(currentStep, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating(currentStep, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return validating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return validating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating(this);
    }
    return orElse();
  }
}

abstract class OnboardingValidating implements OnboardingState {
  const factory OnboardingValidating(
      {required final OnboardingStep currentStep,
      required final OnboardingData data}) = _$OnboardingValidatingImpl;

  OnboardingStep get currentStep;
  OnboardingData get data;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingValidatingImplCopyWith<_$OnboardingValidatingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnboardingSavingImplCopyWith<$Res> {
  factory _$$OnboardingSavingImplCopyWith(_$OnboardingSavingImpl value,
          $Res Function(_$OnboardingSavingImpl) then) =
      __$$OnboardingSavingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OnboardingData data});

  $OnboardingDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$OnboardingSavingImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingSavingImpl>
    implements _$$OnboardingSavingImplCopyWith<$Res> {
  __$$OnboardingSavingImplCopyWithImpl(_$OnboardingSavingImpl _value,
      $Res Function(_$OnboardingSavingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$OnboardingSavingImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OnboardingData,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OnboardingDataCopyWith<$Res> get data {
    return $OnboardingDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$OnboardingSavingImpl implements OnboardingSaving {
  const _$OnboardingSavingImpl({required this.data});

  @override
  final OnboardingData data;

  @override
  String toString() {
    return 'OnboardingState.saving(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingSavingImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingSavingImplCopyWith<_$OnboardingSavingImpl> get copyWith =>
      __$$OnboardingSavingImplCopyWithImpl<_$OnboardingSavingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return saving(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return saving?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class OnboardingSaving implements OnboardingState {
  const factory OnboardingSaving({required final OnboardingData data}) =
      _$OnboardingSavingImpl;

  OnboardingData get data;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingSavingImplCopyWith<_$OnboardingSavingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnboardingCompleteImplCopyWith<$Res> {
  factory _$$OnboardingCompleteImplCopyWith(_$OnboardingCompleteImpl value,
          $Res Function(_$OnboardingCompleteImpl) then) =
      __$$OnboardingCompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$OnboardingCompleteImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingCompleteImpl>
    implements _$$OnboardingCompleteImplCopyWith<$Res> {
  __$$OnboardingCompleteImplCopyWithImpl(_$OnboardingCompleteImpl _value,
      $Res Function(_$OnboardingCompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$OnboardingCompleteImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnboardingCompleteImpl implements OnboardingComplete {
  const _$OnboardingCompleteImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'OnboardingState.complete(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingCompleteImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingCompleteImplCopyWith<_$OnboardingCompleteImpl> get copyWith =>
      __$$OnboardingCompleteImplCopyWithImpl<_$OnboardingCompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return complete(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return complete?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class OnboardingComplete implements OnboardingState {
  const factory OnboardingComplete({required final String userId}) =
      _$OnboardingCompleteImpl;

  String get userId;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingCompleteImplCopyWith<_$OnboardingCompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnboardingErrorImplCopyWith<$Res> {
  factory _$$OnboardingErrorImplCopyWith(_$OnboardingErrorImpl value,
          $Res Function(_$OnboardingErrorImpl) then) =
      __$$OnboardingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, OnboardingData? data, OnboardingStep? lastStep});

  $OnboardingDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$OnboardingErrorImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingErrorImpl>
    implements _$$OnboardingErrorImplCopyWith<$Res> {
  __$$OnboardingErrorImplCopyWithImpl(
      _$OnboardingErrorImpl _value, $Res Function(_$OnboardingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? lastStep = freezed,
  }) {
    return _then(_$OnboardingErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OnboardingData?,
      lastStep: freezed == lastStep
          ? _value.lastStep
          : lastStep // ignore: cast_nullable_to_non_nullable
              as OnboardingStep?,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OnboardingDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OnboardingDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$OnboardingErrorImpl implements OnboardingError {
  const _$OnboardingErrorImpl(
      {required this.message, this.data, this.lastStep});

  @override
  final String message;
  @override
  final OnboardingData? data;
  @override
  final OnboardingStep? lastStep;

  @override
  String toString() {
    return 'OnboardingState.error(message: $message, data: $data, lastStep: $lastStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.lastStep, lastStep) ||
                other.lastStep == lastStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, data, lastStep);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingErrorImplCopyWith<_$OnboardingErrorImpl> get copyWith =>
      __$$OnboardingErrorImplCopyWithImpl<_$OnboardingErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)
        collecting,
    required TResult Function(OnboardingStep currentStep, OnboardingData data)
        validating,
    required TResult Function(OnboardingData data) saving,
    required TResult Function(String userId) complete,
    required TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)
        error,
  }) {
    return error(message, data, lastStep);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult? Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult? Function(OnboardingData data)? saving,
    TResult? Function(String userId)? complete,
    TResult? Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
  }) {
    return error?.call(message, data, lastStep);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OnboardingStep currentStep, OnboardingData data,
            bool isStepValid, String? stepError)?
        collecting,
    TResult Function(OnboardingStep currentStep, OnboardingData data)?
        validating,
    TResult Function(OnboardingData data)? saving,
    TResult Function(String userId)? complete,
    TResult Function(
            String message, OnboardingData? data, OnboardingStep? lastStep)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, data, lastStep);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitial value) initial,
    required TResult Function(OnboardingLoading value) loading,
    required TResult Function(OnboardingCollecting value) collecting,
    required TResult Function(OnboardingValidating value) validating,
    required TResult Function(OnboardingSaving value) saving,
    required TResult Function(OnboardingComplete value) complete,
    required TResult Function(OnboardingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitial value)? initial,
    TResult? Function(OnboardingLoading value)? loading,
    TResult? Function(OnboardingCollecting value)? collecting,
    TResult? Function(OnboardingValidating value)? validating,
    TResult? Function(OnboardingSaving value)? saving,
    TResult? Function(OnboardingComplete value)? complete,
    TResult? Function(OnboardingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitial value)? initial,
    TResult Function(OnboardingLoading value)? loading,
    TResult Function(OnboardingCollecting value)? collecting,
    TResult Function(OnboardingValidating value)? validating,
    TResult Function(OnboardingSaving value)? saving,
    TResult Function(OnboardingComplete value)? complete,
    TResult Function(OnboardingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OnboardingError implements OnboardingState {
  const factory OnboardingError(
      {required final String message,
      final OnboardingData? data,
      final OnboardingStep? lastStep}) = _$OnboardingErrorImpl;

  String get message;
  OnboardingData? get data;
  OnboardingStep? get lastStep;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingErrorImplCopyWith<_$OnboardingErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
