// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DietState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietStateCopyWith<$Res> {
  factory $DietStateCopyWith(DietState value, $Res Function(DietState) then) =
      _$DietStateCopyWithImpl<$Res, DietState>;
}

/// @nodoc
class _$DietStateCopyWithImpl<$Res, $Val extends DietState>
    implements $DietStateCopyWith<$Res> {
  _$DietStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DietInitialImplCopyWith<$Res> {
  factory _$$DietInitialImplCopyWith(
          _$DietInitialImpl value, $Res Function(_$DietInitialImpl) then) =
      __$$DietInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DietInitialImplCopyWithImpl<$Res>
    extends _$DietStateCopyWithImpl<$Res, _$DietInitialImpl>
    implements _$$DietInitialImplCopyWith<$Res> {
  __$$DietInitialImplCopyWithImpl(
      _$DietInitialImpl _value, $Res Function(_$DietInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DietInitialImpl implements DietInitial {
  const _$DietInitialImpl();

  @override
  String toString() {
    return 'DietState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DietInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
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
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DietInitial implements DietState {
  const factory DietInitial() = _$DietInitialImpl;
}

/// @nodoc
abstract class _$$DietLoadingImplCopyWith<$Res> {
  factory _$$DietLoadingImplCopyWith(
          _$DietLoadingImpl value, $Res Function(_$DietLoadingImpl) then) =
      __$$DietLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DietLoadingImplCopyWithImpl<$Res>
    extends _$DietStateCopyWithImpl<$Res, _$DietLoadingImpl>
    implements _$$DietLoadingImplCopyWith<$Res> {
  __$$DietLoadingImplCopyWithImpl(
      _$DietLoadingImpl _value, $Res Function(_$DietLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DietLoadingImpl implements DietLoading {
  const _$DietLoadingImpl();

  @override
  String toString() {
    return 'DietState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DietLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
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
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DietLoading implements DietState {
  const factory DietLoading() = _$DietLoadingImpl;
}

/// @nodoc
abstract class _$$DietLoadedImplCopyWith<$Res> {
  factory _$$DietLoadedImplCopyWith(
          _$DietLoadedImpl value, $Res Function(_$DietLoadedImpl) then) =
      __$$DietLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime date,
      List<MealEntry> meals,
      DailyNutritionSummary nutritionSummary,
      NutritionTargets targets,
      List<Recipe> quickLogRecipes,
      List<FoodItem> recentFoods});
}

/// @nodoc
class __$$DietLoadedImplCopyWithImpl<$Res>
    extends _$DietStateCopyWithImpl<$Res, _$DietLoadedImpl>
    implements _$$DietLoadedImplCopyWith<$Res> {
  __$$DietLoadedImplCopyWithImpl(
      _$DietLoadedImpl _value, $Res Function(_$DietLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? meals = null,
    Object? nutritionSummary = null,
    Object? targets = null,
    Object? quickLogRecipes = null,
    Object? recentFoods = null,
  }) {
    return _then(_$DietLoadedImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<MealEntry>,
      nutritionSummary: null == nutritionSummary
          ? _value.nutritionSummary
          : nutritionSummary // ignore: cast_nullable_to_non_nullable
              as DailyNutritionSummary,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as NutritionTargets,
      quickLogRecipes: null == quickLogRecipes
          ? _value._quickLogRecipes
          : quickLogRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      recentFoods: null == recentFoods
          ? _value._recentFoods
          : recentFoods // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ));
  }
}

/// @nodoc

class _$DietLoadedImpl implements DietLoaded {
  const _$DietLoadedImpl(
      {required this.date,
      required final List<MealEntry> meals,
      required this.nutritionSummary,
      required this.targets,
      required final List<Recipe> quickLogRecipes,
      required final List<FoodItem> recentFoods})
      : _meals = meals,
        _quickLogRecipes = quickLogRecipes,
        _recentFoods = recentFoods;

  @override
  final DateTime date;
  final List<MealEntry> _meals;
  @override
  List<MealEntry> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  final DailyNutritionSummary nutritionSummary;
  @override
  final NutritionTargets targets;
  final List<Recipe> _quickLogRecipes;
  @override
  List<Recipe> get quickLogRecipes {
    if (_quickLogRecipes is EqualUnmodifiableListView) return _quickLogRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickLogRecipes);
  }

  final List<FoodItem> _recentFoods;
  @override
  List<FoodItem> get recentFoods {
    if (_recentFoods is EqualUnmodifiableListView) return _recentFoods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentFoods);
  }

  @override
  String toString() {
    return 'DietState.loaded(date: $date, meals: $meals, nutritionSummary: $nutritionSummary, targets: $targets, quickLogRecipes: $quickLogRecipes, recentFoods: $recentFoods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietLoadedImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            (identical(other.nutritionSummary, nutritionSummary) ||
                other.nutritionSummary == nutritionSummary) &&
            (identical(other.targets, targets) || other.targets == targets) &&
            const DeepCollectionEquality()
                .equals(other._quickLogRecipes, _quickLogRecipes) &&
            const DeepCollectionEquality()
                .equals(other._recentFoods, _recentFoods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_meals),
      nutritionSummary,
      targets,
      const DeepCollectionEquality().hash(_quickLogRecipes),
      const DeepCollectionEquality().hash(_recentFoods));

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietLoadedImplCopyWith<_$DietLoadedImpl> get copyWith =>
      __$$DietLoadedImplCopyWithImpl<_$DietLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) {
    return loaded(
        date, meals, nutritionSummary, targets, quickLogRecipes, recentFoods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) {
    return loaded?.call(
        date, meals, nutritionSummary, targets, quickLogRecipes, recentFoods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          date, meals, nutritionSummary, targets, quickLogRecipes, recentFoods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DietLoaded implements DietState {
  const factory DietLoaded(
      {required final DateTime date,
      required final List<MealEntry> meals,
      required final DailyNutritionSummary nutritionSummary,
      required final NutritionTargets targets,
      required final List<Recipe> quickLogRecipes,
      required final List<FoodItem> recentFoods}) = _$DietLoadedImpl;

  DateTime get date;
  List<MealEntry> get meals;
  DailyNutritionSummary get nutritionSummary;
  NutritionTargets get targets;
  List<Recipe> get quickLogRecipes;
  List<FoodItem> get recentFoods;

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietLoadedImplCopyWith<_$DietLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DietSearchingImplCopyWith<$Res> {
  factory _$$DietSearchingImplCopyWith(
          _$DietSearchingImpl value, $Res Function(_$DietSearchingImpl) then) =
      __$$DietSearchingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DietLoaded previousState, String query});
}

/// @nodoc
class __$$DietSearchingImplCopyWithImpl<$Res>
    extends _$DietStateCopyWithImpl<$Res, _$DietSearchingImpl>
    implements _$$DietSearchingImplCopyWith<$Res> {
  __$$DietSearchingImplCopyWithImpl(
      _$DietSearchingImpl _value, $Res Function(_$DietSearchingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousState = freezed,
    Object? query = null,
  }) {
    return _then(_$DietSearchingImpl(
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as DietLoaded,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DietSearchingImpl implements DietSearching {
  const _$DietSearchingImpl({required this.previousState, required this.query});

  @override
  final DietLoaded previousState;
  @override
  final String query;

  @override
  String toString() {
    return 'DietState.searching(previousState: $previousState, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietSearchingImpl &&
            const DeepCollectionEquality()
                .equals(other.previousState, previousState) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(previousState), query);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietSearchingImplCopyWith<_$DietSearchingImpl> get copyWith =>
      __$$DietSearchingImplCopyWithImpl<_$DietSearchingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) {
    return searching(previousState, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) {
    return searching?.call(previousState, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(previousState, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class DietSearching implements DietState {
  const factory DietSearching(
      {required final DietLoaded previousState,
      required final String query}) = _$DietSearchingImpl;

  DietLoaded get previousState;
  String get query;

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietSearchingImplCopyWith<_$DietSearchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DietSearchResultsImplCopyWith<$Res> {
  factory _$$DietSearchResultsImplCopyWith(_$DietSearchResultsImpl value,
          $Res Function(_$DietSearchResultsImpl) then) =
      __$$DietSearchResultsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DietLoaded previousState, String query, List<FoodItem> results});
}

/// @nodoc
class __$$DietSearchResultsImplCopyWithImpl<$Res>
    extends _$DietStateCopyWithImpl<$Res, _$DietSearchResultsImpl>
    implements _$$DietSearchResultsImplCopyWith<$Res> {
  __$$DietSearchResultsImplCopyWithImpl(_$DietSearchResultsImpl _value,
      $Res Function(_$DietSearchResultsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousState = freezed,
    Object? query = null,
    Object? results = null,
  }) {
    return _then(_$DietSearchResultsImpl(
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as DietLoaded,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ));
  }
}

/// @nodoc

class _$DietSearchResultsImpl implements DietSearchResults {
  const _$DietSearchResultsImpl(
      {required this.previousState,
      required this.query,
      required final List<FoodItem> results})
      : _results = results;

  @override
  final DietLoaded previousState;
  @override
  final String query;
  final List<FoodItem> _results;
  @override
  List<FoodItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'DietState.searchResults(previousState: $previousState, query: $query, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietSearchResultsImpl &&
            const DeepCollectionEquality()
                .equals(other.previousState, previousState) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(previousState),
      query,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietSearchResultsImplCopyWith<_$DietSearchResultsImpl> get copyWith =>
      __$$DietSearchResultsImplCopyWithImpl<_$DietSearchResultsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) {
    return searchResults(previousState, query, results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) {
    return searchResults?.call(previousState, query, results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
    required TResult orElse(),
  }) {
    if (searchResults != null) {
      return searchResults(previousState, query, results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) {
    return searchResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) {
    return searchResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) {
    if (searchResults != null) {
      return searchResults(this);
    }
    return orElse();
  }
}

abstract class DietSearchResults implements DietState {
  const factory DietSearchResults(
      {required final DietLoaded previousState,
      required final String query,
      required final List<FoodItem> results}) = _$DietSearchResultsImpl;

  DietLoaded get previousState;
  String get query;
  List<FoodItem> get results;

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietSearchResultsImplCopyWith<_$DietSearchResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DietErrorImplCopyWith<$Res> {
  factory _$$DietErrorImplCopyWith(
          _$DietErrorImpl value, $Res Function(_$DietErrorImpl) then) =
      __$$DietErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, DietLoaded? previousState});
}

/// @nodoc
class __$$DietErrorImplCopyWithImpl<$Res>
    extends _$DietStateCopyWithImpl<$Res, _$DietErrorImpl>
    implements _$$DietErrorImplCopyWith<$Res> {
  __$$DietErrorImplCopyWithImpl(
      _$DietErrorImpl _value, $Res Function(_$DietErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? previousState = freezed,
  }) {
    return _then(_$DietErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as DietLoaded?,
    ));
  }
}

/// @nodoc

class _$DietErrorImpl implements DietError {
  const _$DietErrorImpl({required this.message, this.previousState});

  @override
  final String message;
  @override
  final DietLoaded? previousState;

  @override
  String toString() {
    return 'DietState.error(message: $message, previousState: $previousState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.previousState, previousState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(previousState));

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietErrorImplCopyWith<_$DietErrorImpl> get copyWith =>
      __$$DietErrorImplCopyWithImpl<_$DietErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)
        loaded,
    required TResult Function(DietLoaded previousState, String query) searching,
    required TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)
        searchResults,
    required TResult Function(String message, DietLoaded? previousState) error,
  }) {
    return error(message, previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult? Function(DietLoaded previousState, String query)? searching,
    TResult? Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult? Function(String message, DietLoaded? previousState)? error,
  }) {
    return error?.call(message, previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DateTime date,
            List<MealEntry> meals,
            DailyNutritionSummary nutritionSummary,
            NutritionTargets targets,
            List<Recipe> quickLogRecipes,
            List<FoodItem> recentFoods)?
        loaded,
    TResult Function(DietLoaded previousState, String query)? searching,
    TResult Function(
            DietLoaded previousState, String query, List<FoodItem> results)?
        searchResults,
    TResult Function(String message, DietLoaded? previousState)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DietInitial value) initial,
    required TResult Function(DietLoading value) loading,
    required TResult Function(DietLoaded value) loaded,
    required TResult Function(DietSearching value) searching,
    required TResult Function(DietSearchResults value) searchResults,
    required TResult Function(DietError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DietInitial value)? initial,
    TResult? Function(DietLoading value)? loading,
    TResult? Function(DietLoaded value)? loaded,
    TResult? Function(DietSearching value)? searching,
    TResult? Function(DietSearchResults value)? searchResults,
    TResult? Function(DietError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DietInitial value)? initial,
    TResult Function(DietLoading value)? loading,
    TResult Function(DietLoaded value)? loaded,
    TResult Function(DietSearching value)? searching,
    TResult Function(DietSearchResults value)? searchResults,
    TResult Function(DietError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DietError implements DietState {
  const factory DietError(
      {required final String message,
      final DietLoaded? previousState}) = _$DietErrorImpl;

  String get message;
  DietLoaded? get previousState;

  /// Create a copy of DietState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietErrorImplCopyWith<_$DietErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
