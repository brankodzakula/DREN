// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meditation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Meditation _$MeditationFromJson(Map<String, dynamic> json) {
  return _Meditation.fromJson(json);
}

/// @nodoc
mixin _$Meditation {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category =>
      throw _privateConstructorUsedError; // wind_down, sleep_story, soundscape, sos
  int get durationMinutes => throw _privateConstructorUsedError;
  String get audioUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  bool get isDownloaded => throw _privateConstructorUsedError;

  /// Serializes this Meditation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meditation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeditationCopyWith<Meditation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeditationCopyWith<$Res> {
  factory $MeditationCopyWith(
          Meditation value, $Res Function(Meditation) then) =
      _$MeditationCopyWithImpl<$Res, Meditation>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      int durationMinutes,
      String audioUrl,
      String thumbnailUrl,
      bool isDownloaded});
}

/// @nodoc
class _$MeditationCopyWithImpl<$Res, $Val extends Meditation>
    implements $MeditationCopyWith<$Res> {
  _$MeditationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meditation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? durationMinutes = null,
    Object? audioUrl = null,
    Object? thumbnailUrl = null,
    Object? isDownloaded = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isDownloaded: null == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeditationImplCopyWith<$Res>
    implements $MeditationCopyWith<$Res> {
  factory _$$MeditationImplCopyWith(
          _$MeditationImpl value, $Res Function(_$MeditationImpl) then) =
      __$$MeditationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String category,
      int durationMinutes,
      String audioUrl,
      String thumbnailUrl,
      bool isDownloaded});
}

/// @nodoc
class __$$MeditationImplCopyWithImpl<$Res>
    extends _$MeditationCopyWithImpl<$Res, _$MeditationImpl>
    implements _$$MeditationImplCopyWith<$Res> {
  __$$MeditationImplCopyWithImpl(
      _$MeditationImpl _value, $Res Function(_$MeditationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meditation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? durationMinutes = null,
    Object? audioUrl = null,
    Object? thumbnailUrl = null,
    Object? isDownloaded = null,
  }) {
    return _then(_$MeditationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isDownloaded: null == isDownloaded
          ? _value.isDownloaded
          : isDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeditationImpl implements _Meditation {
  const _$MeditationImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.durationMinutes,
      required this.audioUrl,
      required this.thumbnailUrl,
      required this.isDownloaded});

  factory _$MeditationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeditationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
// wind_down, sleep_story, soundscape, sos
  @override
  final int durationMinutes;
  @override
  final String audioUrl;
  @override
  final String thumbnailUrl;
  @override
  final bool isDownloaded;

  @override
  String toString() {
    return 'Meditation(id: $id, title: $title, description: $description, category: $category, durationMinutes: $durationMinutes, audioUrl: $audioUrl, thumbnailUrl: $thumbnailUrl, isDownloaded: $isDownloaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeditationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.isDownloaded, isDownloaded) ||
                other.isDownloaded == isDownloaded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, category,
      durationMinutes, audioUrl, thumbnailUrl, isDownloaded);

  /// Create a copy of Meditation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeditationImplCopyWith<_$MeditationImpl> get copyWith =>
      __$$MeditationImplCopyWithImpl<_$MeditationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeditationImplToJson(
      this,
    );
  }
}

abstract class _Meditation implements Meditation {
  const factory _Meditation(
      {required final String id,
      required final String title,
      required final String description,
      required final String category,
      required final int durationMinutes,
      required final String audioUrl,
      required final String thumbnailUrl,
      required final bool isDownloaded}) = _$MeditationImpl;

  factory _Meditation.fromJson(Map<String, dynamic> json) =
      _$MeditationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category; // wind_down, sleep_story, soundscape, sos
  @override
  int get durationMinutes;
  @override
  String get audioUrl;
  @override
  String get thumbnailUrl;
  @override
  bool get isDownloaded;

  /// Create a copy of Meditation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeditationImplCopyWith<_$MeditationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
