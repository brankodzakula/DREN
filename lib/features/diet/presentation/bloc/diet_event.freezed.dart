// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DietEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietEventCopyWith<$Res> {
  factory $DietEventCopyWith(DietEvent value, $Res Function(DietEvent) then) =
      _$DietEventCopyWithImpl<$Res, DietEvent>;
}

/// @nodoc
class _$DietEventCopyWithImpl<$Res, $Val extends DietEvent>
    implements $DietEventCopyWith<$Res> {
  _$DietEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadMealsEventImplCopyWith<$Res> {
  factory _$$LoadMealsEventImplCopyWith(_$LoadMealsEventImpl value,
          $Res Function(_$LoadMealsEventImpl) then) =
      __$$LoadMealsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class __$$LoadMealsEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$LoadMealsEventImpl>
    implements _$$LoadMealsEventImplCopyWith<$Res> {
  __$$LoadMealsEventImplCopyWithImpl(
      _$LoadMealsEventImpl _value, $Res Function(_$LoadMealsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$LoadMealsEventImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LoadMealsEventImpl implements LoadMealsEvent {
  const _$LoadMealsEventImpl({this.date});

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'DietEvent.loadMeals(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMealsEventImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMealsEventImplCopyWith<_$LoadMealsEventImpl> get copyWith =>
      __$$LoadMealsEventImplCopyWithImpl<_$LoadMealsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return loadMeals(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return loadMeals?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (loadMeals != null) {
      return loadMeals(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return loadMeals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return loadMeals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (loadMeals != null) {
      return loadMeals(this);
    }
    return orElse();
  }
}

abstract class LoadMealsEvent implements DietEvent {
  const factory LoadMealsEvent({final DateTime? date}) = _$LoadMealsEventImpl;

  DateTime? get date;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMealsEventImplCopyWith<_$LoadMealsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshDietEventImplCopyWith<$Res> {
  factory _$$RefreshDietEventImplCopyWith(_$RefreshDietEventImpl value,
          $Res Function(_$RefreshDietEventImpl) then) =
      __$$RefreshDietEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshDietEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$RefreshDietEventImpl>
    implements _$$RefreshDietEventImplCopyWith<$Res> {
  __$$RefreshDietEventImplCopyWithImpl(_$RefreshDietEventImpl _value,
      $Res Function(_$RefreshDietEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshDietEventImpl implements RefreshDietEvent {
  const _$RefreshDietEventImpl();

  @override
  String toString() {
    return 'DietEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshDietEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshDietEvent implements DietEvent {
  const factory RefreshDietEvent() = _$RefreshDietEventImpl;
}

/// @nodoc
abstract class _$$SearchFoodEventImplCopyWith<$Res> {
  factory _$$SearchFoodEventImplCopyWith(_$SearchFoodEventImpl value,
          $Res Function(_$SearchFoodEventImpl) then) =
      __$$SearchFoodEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchFoodEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$SearchFoodEventImpl>
    implements _$$SearchFoodEventImplCopyWith<$Res> {
  __$$SearchFoodEventImplCopyWithImpl(
      _$SearchFoodEventImpl _value, $Res Function(_$SearchFoodEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchFoodEventImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchFoodEventImpl implements SearchFoodEvent {
  const _$SearchFoodEventImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'DietEvent.searchFood(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFoodEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFoodEventImplCopyWith<_$SearchFoodEventImpl> get copyWith =>
      __$$SearchFoodEventImplCopyWithImpl<_$SearchFoodEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return searchFood(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return searchFood?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (searchFood != null) {
      return searchFood(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return searchFood(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return searchFood?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (searchFood != null) {
      return searchFood(this);
    }
    return orElse();
  }
}

abstract class SearchFoodEvent implements DietEvent {
  const factory SearchFoodEvent({required final String query}) =
      _$SearchFoodEventImpl;

  String get query;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFoodEventImplCopyWith<_$SearchFoodEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchEventImplCopyWith<$Res> {
  factory _$$ClearSearchEventImplCopyWith(_$ClearSearchEventImpl value,
          $Res Function(_$ClearSearchEventImpl) then) =
      __$$ClearSearchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$ClearSearchEventImpl>
    implements _$$ClearSearchEventImplCopyWith<$Res> {
  __$$ClearSearchEventImplCopyWithImpl(_$ClearSearchEventImpl _value,
      $Res Function(_$ClearSearchEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSearchEventImpl implements ClearSearchEvent {
  const _$ClearSearchEventImpl();

  @override
  String toString() {
    return 'DietEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class ClearSearchEvent implements DietEvent {
  const factory ClearSearchEvent() = _$ClearSearchEventImpl;
}

/// @nodoc
abstract class _$$ScanBarcodeEventImplCopyWith<$Res> {
  factory _$$ScanBarcodeEventImplCopyWith(_$ScanBarcodeEventImpl value,
          $Res Function(_$ScanBarcodeEventImpl) then) =
      __$$ScanBarcodeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$ScanBarcodeEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$ScanBarcodeEventImpl>
    implements _$$ScanBarcodeEventImplCopyWith<$Res> {
  __$$ScanBarcodeEventImplCopyWithImpl(_$ScanBarcodeEventImpl _value,
      $Res Function(_$ScanBarcodeEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$ScanBarcodeEventImpl(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScanBarcodeEventImpl implements ScanBarcodeEvent {
  const _$ScanBarcodeEventImpl({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'DietEvent.scanBarcode(barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanBarcodeEventImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanBarcodeEventImplCopyWith<_$ScanBarcodeEventImpl> get copyWith =>
      __$$ScanBarcodeEventImplCopyWithImpl<_$ScanBarcodeEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return scanBarcode(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return scanBarcode?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (scanBarcode != null) {
      return scanBarcode(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return scanBarcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return scanBarcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (scanBarcode != null) {
      return scanBarcode(this);
    }
    return orElse();
  }
}

abstract class ScanBarcodeEvent implements DietEvent {
  const factory ScanBarcodeEvent({required final String barcode}) =
      _$ScanBarcodeEventImpl;

  String get barcode;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanBarcodeEventImplCopyWith<_$ScanBarcodeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogMealEventImplCopyWith<$Res> {
  factory _$$LogMealEventImplCopyWith(
          _$LogMealEventImpl value, $Res Function(_$LogMealEventImpl) then) =
      __$$LogMealEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mealType, List<FoodItem> items, String? source});
}

/// @nodoc
class __$$LogMealEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$LogMealEventImpl>
    implements _$$LogMealEventImplCopyWith<$Res> {
  __$$LogMealEventImplCopyWithImpl(
      _$LogMealEventImpl _value, $Res Function(_$LogMealEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealType = null,
    Object? items = null,
    Object? source = freezed,
  }) {
    return _then(_$LogMealEventImpl(
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LogMealEventImpl implements LogMealEvent {
  const _$LogMealEventImpl(
      {required this.mealType,
      required final List<FoodItem> items,
      this.source})
      : _items = items;

  @override
  final String mealType;
  final List<FoodItem> _items;
  @override
  List<FoodItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? source;

  @override
  String toString() {
    return 'DietEvent.logMeal(mealType: $mealType, items: $items, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogMealEventImpl &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mealType,
      const DeepCollectionEquality().hash(_items), source);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogMealEventImplCopyWith<_$LogMealEventImpl> get copyWith =>
      __$$LogMealEventImplCopyWithImpl<_$LogMealEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return logMeal(mealType, items, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return logMeal?.call(mealType, items, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (logMeal != null) {
      return logMeal(mealType, items, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return logMeal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return logMeal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (logMeal != null) {
      return logMeal(this);
    }
    return orElse();
  }
}

abstract class LogMealEvent implements DietEvent {
  const factory LogMealEvent(
      {required final String mealType,
      required final List<FoodItem> items,
      final String? source}) = _$LogMealEventImpl;

  String get mealType;
  List<FoodItem> get items;
  String? get source;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogMealEventImplCopyWith<_$LogMealEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuickLogFoodEventImplCopyWith<$Res> {
  factory _$$QuickLogFoodEventImplCopyWith(_$QuickLogFoodEventImpl value,
          $Res Function(_$QuickLogFoodEventImpl) then) =
      __$$QuickLogFoodEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FoodItem food, String mealType, double servings});

  $FoodItemCopyWith<$Res> get food;
}

/// @nodoc
class __$$QuickLogFoodEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$QuickLogFoodEventImpl>
    implements _$$QuickLogFoodEventImplCopyWith<$Res> {
  __$$QuickLogFoodEventImplCopyWithImpl(_$QuickLogFoodEventImpl _value,
      $Res Function(_$QuickLogFoodEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? mealType = null,
    Object? servings = null,
  }) {
    return _then(_$QuickLogFoodEventImpl(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodItemCopyWith<$Res> get food {
    return $FoodItemCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc

class _$QuickLogFoodEventImpl implements QuickLogFoodEvent {
  const _$QuickLogFoodEventImpl(
      {required this.food, required this.mealType, this.servings = 1.0});

  @override
  final FoodItem food;
  @override
  final String mealType;
  @override
  @JsonKey()
  final double servings;

  @override
  String toString() {
    return 'DietEvent.quickLogFood(food: $food, mealType: $mealType, servings: $servings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickLogFoodEventImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            (identical(other.servings, servings) ||
                other.servings == servings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food, mealType, servings);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickLogFoodEventImplCopyWith<_$QuickLogFoodEventImpl> get copyWith =>
      __$$QuickLogFoodEventImplCopyWithImpl<_$QuickLogFoodEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return quickLogFood(food, mealType, servings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return quickLogFood?.call(food, mealType, servings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (quickLogFood != null) {
      return quickLogFood(food, mealType, servings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return quickLogFood(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return quickLogFood?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (quickLogFood != null) {
      return quickLogFood(this);
    }
    return orElse();
  }
}

abstract class QuickLogFoodEvent implements DietEvent {
  const factory QuickLogFoodEvent(
      {required final FoodItem food,
      required final String mealType,
      final double servings}) = _$QuickLogFoodEventImpl;

  FoodItem get food;
  String get mealType;
  double get servings;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickLogFoodEventImplCopyWith<_$QuickLogFoodEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMealEventImplCopyWith<$Res> {
  factory _$$UpdateMealEventImplCopyWith(_$UpdateMealEventImpl value,
          $Res Function(_$UpdateMealEventImpl) then) =
      __$$UpdateMealEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MealEntry meal});

  $MealEntryCopyWith<$Res> get meal;
}

/// @nodoc
class __$$UpdateMealEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$UpdateMealEventImpl>
    implements _$$UpdateMealEventImplCopyWith<$Res> {
  __$$UpdateMealEventImplCopyWithImpl(
      _$UpdateMealEventImpl _value, $Res Function(_$UpdateMealEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meal = null,
  }) {
    return _then(_$UpdateMealEventImpl(
      meal: null == meal
          ? _value.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as MealEntry,
    ));
  }

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealEntryCopyWith<$Res> get meal {
    return $MealEntryCopyWith<$Res>(_value.meal, (value) {
      return _then(_value.copyWith(meal: value));
    });
  }
}

/// @nodoc

class _$UpdateMealEventImpl implements UpdateMealEvent {
  const _$UpdateMealEventImpl({required this.meal});

  @override
  final MealEntry meal;

  @override
  String toString() {
    return 'DietEvent.updateMeal(meal: $meal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMealEventImpl &&
            (identical(other.meal, meal) || other.meal == meal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meal);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMealEventImplCopyWith<_$UpdateMealEventImpl> get copyWith =>
      __$$UpdateMealEventImplCopyWithImpl<_$UpdateMealEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return updateMeal(meal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return updateMeal?.call(meal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (updateMeal != null) {
      return updateMeal(meal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return updateMeal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return updateMeal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (updateMeal != null) {
      return updateMeal(this);
    }
    return orElse();
  }
}

abstract class UpdateMealEvent implements DietEvent {
  const factory UpdateMealEvent({required final MealEntry meal}) =
      _$UpdateMealEventImpl;

  MealEntry get meal;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMealEventImplCopyWith<_$UpdateMealEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMealEventImplCopyWith<$Res> {
  factory _$$DeleteMealEventImplCopyWith(_$DeleteMealEventImpl value,
          $Res Function(_$DeleteMealEventImpl) then) =
      __$$DeleteMealEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mealId});
}

/// @nodoc
class __$$DeleteMealEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$DeleteMealEventImpl>
    implements _$$DeleteMealEventImplCopyWith<$Res> {
  __$$DeleteMealEventImplCopyWithImpl(
      _$DeleteMealEventImpl _value, $Res Function(_$DeleteMealEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealId = null,
  }) {
    return _then(_$DeleteMealEventImpl(
      mealId: null == mealId
          ? _value.mealId
          : mealId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteMealEventImpl implements DeleteMealEvent {
  const _$DeleteMealEventImpl({required this.mealId});

  @override
  final String mealId;

  @override
  String toString() {
    return 'DietEvent.deleteMeal(mealId: $mealId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMealEventImpl &&
            (identical(other.mealId, mealId) || other.mealId == mealId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mealId);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMealEventImplCopyWith<_$DeleteMealEventImpl> get copyWith =>
      __$$DeleteMealEventImplCopyWithImpl<_$DeleteMealEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return deleteMeal(mealId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return deleteMeal?.call(mealId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (deleteMeal != null) {
      return deleteMeal(mealId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return deleteMeal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return deleteMeal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (deleteMeal != null) {
      return deleteMeal(this);
    }
    return orElse();
  }
}

abstract class DeleteMealEvent implements DietEvent {
  const factory DeleteMealEvent({required final String mealId}) =
      _$DeleteMealEventImpl;

  String get mealId;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteMealEventImplCopyWith<_$DeleteMealEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateEventImplCopyWith<$Res> {
  factory _$$ChangeDateEventImplCopyWith(_$ChangeDateEventImpl value,
          $Res Function(_$ChangeDateEventImpl) then) =
      __$$ChangeDateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$ChangeDateEventImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$ChangeDateEventImpl>
    implements _$$ChangeDateEventImplCopyWith<$Res> {
  __$$ChangeDateEventImplCopyWithImpl(
      _$ChangeDateEventImpl _value, $Res Function(_$ChangeDateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$ChangeDateEventImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateEventImpl implements ChangeDateEvent {
  const _$ChangeDateEventImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'DietEvent.changeDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateEventImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateEventImplCopyWith<_$ChangeDateEventImpl> get copyWith =>
      __$$ChangeDateEventImplCopyWithImpl<_$ChangeDateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadMeals,
    required TResult Function() refresh,
    required TResult Function(String query) searchFood,
    required TResult Function() clearSearch,
    required TResult Function(String barcode) scanBarcode,
    required TResult Function(
            String mealType, List<FoodItem> items, String? source)
        logMeal,
    required TResult Function(FoodItem food, String mealType, double servings)
        quickLogFood,
    required TResult Function(MealEntry meal) updateMeal,
    required TResult Function(String mealId) deleteMeal,
    required TResult Function(DateTime date) changeDate,
  }) {
    return changeDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadMeals,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchFood,
    TResult? Function()? clearSearch,
    TResult? Function(String barcode)? scanBarcode,
    TResult? Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult? Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult? Function(MealEntry meal)? updateMeal,
    TResult? Function(String mealId)? deleteMeal,
    TResult? Function(DateTime date)? changeDate,
  }) {
    return changeDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadMeals,
    TResult Function()? refresh,
    TResult Function(String query)? searchFood,
    TResult Function()? clearSearch,
    TResult Function(String barcode)? scanBarcode,
    TResult Function(String mealType, List<FoodItem> items, String? source)?
        logMeal,
    TResult Function(FoodItem food, String mealType, double servings)?
        quickLogFood,
    TResult Function(MealEntry meal)? updateMeal,
    TResult Function(String mealId)? deleteMeal,
    TResult Function(DateTime date)? changeDate,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMealsEvent value) loadMeals,
    required TResult Function(RefreshDietEvent value) refresh,
    required TResult Function(SearchFoodEvent value) searchFood,
    required TResult Function(ClearSearchEvent value) clearSearch,
    required TResult Function(ScanBarcodeEvent value) scanBarcode,
    required TResult Function(LogMealEvent value) logMeal,
    required TResult Function(QuickLogFoodEvent value) quickLogFood,
    required TResult Function(UpdateMealEvent value) updateMeal,
    required TResult Function(DeleteMealEvent value) deleteMeal,
    required TResult Function(ChangeDateEvent value) changeDate,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMealsEvent value)? loadMeals,
    TResult? Function(RefreshDietEvent value)? refresh,
    TResult? Function(SearchFoodEvent value)? searchFood,
    TResult? Function(ClearSearchEvent value)? clearSearch,
    TResult? Function(ScanBarcodeEvent value)? scanBarcode,
    TResult? Function(LogMealEvent value)? logMeal,
    TResult? Function(QuickLogFoodEvent value)? quickLogFood,
    TResult? Function(UpdateMealEvent value)? updateMeal,
    TResult? Function(DeleteMealEvent value)? deleteMeal,
    TResult? Function(ChangeDateEvent value)? changeDate,
  }) {
    return changeDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMealsEvent value)? loadMeals,
    TResult Function(RefreshDietEvent value)? refresh,
    TResult Function(SearchFoodEvent value)? searchFood,
    TResult Function(ClearSearchEvent value)? clearSearch,
    TResult Function(ScanBarcodeEvent value)? scanBarcode,
    TResult Function(LogMealEvent value)? logMeal,
    TResult Function(QuickLogFoodEvent value)? quickLogFood,
    TResult Function(UpdateMealEvent value)? updateMeal,
    TResult Function(DeleteMealEvent value)? deleteMeal,
    TResult Function(ChangeDateEvent value)? changeDate,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(this);
    }
    return orElse();
  }
}

abstract class ChangeDateEvent implements DietEvent {
  const factory ChangeDateEvent({required final DateTime date}) =
      _$ChangeDateEventImpl;

  DateTime get date;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeDateEventImplCopyWith<_$ChangeDateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
