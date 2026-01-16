// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealEntry _$MealEntryFromJson(Map<String, dynamic> json) {
  return _MealEntry.fromJson(json);
}

/// @nodoc
mixin _$MealEntry {
  String get id => throw _privateConstructorUsedError;
  String get oderId =>
      throw _privateConstructorUsedError; // Order/sequence ID for the day
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get mealType =>
      throw _privateConstructorUsedError; // breakfast, lunch, dinner, snack
  List<FoodItem> get items => throw _privateConstructorUsedError;
  int get totalCalories => throw _privateConstructorUsedError;
  double get totalProtein => throw _privateConstructorUsedError;
  double get totalCarbs => throw _privateConstructorUsedError;
  double get totalFat => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  /// Serializes this MealEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealEntryCopyWith<MealEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealEntryCopyWith<$Res> {
  factory $MealEntryCopyWith(MealEntry value, $Res Function(MealEntry) then) =
      _$MealEntryCopyWithImpl<$Res, MealEntry>;
  @useResult
  $Res call(
      {String id,
      String oderId,
      DateTime timestamp,
      String mealType,
      List<FoodItem> items,
      int totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      String source});
}

/// @nodoc
class _$MealEntryCopyWithImpl<$Res, $Val extends MealEntry>
    implements $MealEntryCopyWith<$Res> {
  _$MealEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oderId = null,
    Object? timestamp = null,
    Object? mealType = null,
    Object? items = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? source = null,
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as int,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealEntryImplCopyWith<$Res>
    implements $MealEntryCopyWith<$Res> {
  factory _$$MealEntryImplCopyWith(
          _$MealEntryImpl value, $Res Function(_$MealEntryImpl) then) =
      __$$MealEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String oderId,
      DateTime timestamp,
      String mealType,
      List<FoodItem> items,
      int totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      String source});
}

/// @nodoc
class __$$MealEntryImplCopyWithImpl<$Res>
    extends _$MealEntryCopyWithImpl<$Res, _$MealEntryImpl>
    implements _$$MealEntryImplCopyWith<$Res> {
  __$$MealEntryImplCopyWithImpl(
      _$MealEntryImpl _value, $Res Function(_$MealEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? oderId = null,
    Object? timestamp = null,
    Object? mealType = null,
    Object? items = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? source = null,
  }) {
    return _then(_$MealEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      oderId: null == oderId
          ? _value.oderId
          : oderId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as int,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealEntryImpl extends _MealEntry {
  const _$MealEntryImpl(
      {required this.id,
      required this.oderId,
      required this.timestamp,
      required this.mealType,
      required final List<FoodItem> items,
      required this.totalCalories,
      required this.totalProtein,
      required this.totalCarbs,
      required this.totalFat,
      required this.source})
      : _items = items,
        super._();

  factory _$MealEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String oderId;
// Order/sequence ID for the day
  @override
  final DateTime timestamp;
  @override
  final String mealType;
// breakfast, lunch, dinner, snack
  final List<FoodItem> _items;
// breakfast, lunch, dinner, snack
  @override
  List<FoodItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalCalories;
  @override
  final double totalProtein;
  @override
  final double totalCarbs;
  @override
  final double totalFat;
  @override
  final String source;

  @override
  String toString() {
    return 'MealEntry(id: $id, oderId: $oderId, timestamp: $timestamp, mealType: $mealType, items: $items, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.oderId, oderId) || other.oderId == oderId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalFat, totalFat) ||
                other.totalFat == totalFat) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      oderId,
      timestamp,
      mealType,
      const DeepCollectionEquality().hash(_items),
      totalCalories,
      totalProtein,
      totalCarbs,
      totalFat,
      source);

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealEntryImplCopyWith<_$MealEntryImpl> get copyWith =>
      __$$MealEntryImplCopyWithImpl<_$MealEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealEntryImplToJson(
      this,
    );
  }
}

abstract class _MealEntry extends MealEntry {
  const factory _MealEntry(
      {required final String id,
      required final String oderId,
      required final DateTime timestamp,
      required final String mealType,
      required final List<FoodItem> items,
      required final int totalCalories,
      required final double totalProtein,
      required final double totalCarbs,
      required final double totalFat,
      required final String source}) = _$MealEntryImpl;
  const _MealEntry._() : super._();

  factory _MealEntry.fromJson(Map<String, dynamic> json) =
      _$MealEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get oderId; // Order/sequence ID for the day
  @override
  DateTime get timestamp;
  @override
  String get mealType; // breakfast, lunch, dinner, snack
  @override
  List<FoodItem> get items;
  @override
  int get totalCalories;
  @override
  double get totalProtein;
  @override
  double get totalCarbs;
  @override
  double get totalFat;
  @override
  String get source;

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealEntryImplCopyWith<_$MealEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
