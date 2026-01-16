import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/meal_entry.dart';
import '../../domain/usecases/get_meals_for_date.dart';
import '../../domain/usecases/get_recipes.dart';
import '../../domain/usecases/log_meal.dart';
import '../../domain/usecases/search_food.dart';
import 'diet_event.dart';
import 'diet_state.dart';

/// BLoC for managing diet feature state
@injectable
class DietBloc extends Bloc<DietEvent, DietState> {
  final SearchFood _searchFood;
  final LogMeal _logMeal;
  final GetMealsForDate _getMealsForDate;
  final GetRecipes _getRecipes;

  /// Debounce duration for search
  static const _searchDebounce = Duration(milliseconds: 300);

  DietBloc(
    this._searchFood,
    this._logMeal,
    this._getMealsForDate,
    this._getRecipes,
  ) : super(const DietState.initial()) {
    on<LoadMealsEvent>(_onLoadMeals);
    on<RefreshDietEvent>(_onRefresh);
    on<SearchFoodEvent>(
      _onSearchFood,
      transformer: _debounceSearch(),
    );
    on<ClearSearchEvent>(_onClearSearch);
    on<ScanBarcodeEvent>(_onScanBarcode);
    on<LogMealEvent>(_onLogMeal);
    on<QuickLogFoodEvent>(_onQuickLogFood);
    on<UpdateMealEvent>(_onUpdateMeal);
    on<DeleteMealEvent>(_onDeleteMeal);
    on<ChangeDateEvent>(_onChangeDate);
  }

  /// Debounce transformer for search events
  EventTransformer<SearchFoodEvent> _debounceSearch() {
    return (events, mapper) => events
        .debounceTime(_searchDebounce)
        .asyncExpand(mapper);
  }

  /// Handle load meals event
  Future<void> _onLoadMeals(
    LoadMealsEvent event,
    Emitter<DietState> emit,
  ) async {
    emit(const DietState.loading());

    try {
      final date = event.date ?? DateTime.now();
      final loadedState = await _loadDietData(date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(message: 'Failed to load meals: $e'));
    }
  }

  /// Handle refresh event
  Future<void> _onRefresh(
    RefreshDietEvent event,
    Emitter<DietState> emit,
  ) async {
    final currentState = state;
    DateTime date = DateTime.now();

    if (currentState is DietLoaded) {
      date = currentState.date;
    } else if (currentState is DietSearching) {
      date = currentState.previousState.date;
    } else if (currentState is DietSearchResults) {
      date = currentState.previousState.date;
    }

    try {
      final loadedState = await _loadDietData(date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(
        message: 'Failed to refresh: $e',
        previousState: _getPreviousLoadedState(),
      ));
    }
  }

  /// Handle search food event
  Future<void> _onSearchFood(
    SearchFoodEvent event,
    Emitter<DietState> emit,
  ) async {
    final query = event.query.trim();
    final previousState = _getPreviousLoadedState();

    if (previousState == null) return;

    if (query.isEmpty) {
      emit(previousState);
      return;
    }

    emit(DietState.searching(
      previousState: previousState,
      query: query,
    ));

    try {
      final results = await _searchFood(query);

      emit(DietState.searchResults(
        previousState: previousState,
        query: query,
        results: results,
      ));
    } catch (e) {
      emit(DietState.error(
        message: 'Search failed: $e',
        previousState: previousState,
      ));
    }
  }

  /// Handle clear search event
  void _onClearSearch(
    ClearSearchEvent event,
    Emitter<DietState> emit,
  ) {
    final previousState = _getPreviousLoadedState();
    if (previousState != null) {
      emit(previousState);
    }
  }

  /// Handle scan barcode event
  Future<void> _onScanBarcode(
    ScanBarcodeEvent event,
    Emitter<DietState> emit,
  ) async {
    final previousState = _getPreviousLoadedState();
    if (previousState == null) return;

    emit(DietState.searching(
      previousState: previousState,
      query: 'Scanning barcode...',
    ));

    try {
      final result = await _searchFood.byBarcode(event.barcode);

      if (result != null) {
        emit(DietState.searchResults(
          previousState: previousState,
          query: event.barcode,
          results: [result],
        ));
      } else {
        emit(DietState.error(
          message: 'Product not found for barcode: ${event.barcode}',
          previousState: previousState,
        ));
      }
    } catch (e) {
      emit(DietState.error(
        message: 'Barcode scan failed: $e',
        previousState: previousState,
      ));
    }
  }

  /// Handle log meal event
  Future<void> _onLogMeal(
    LogMealEvent event,
    Emitter<DietState> emit,
  ) async {
    final previousState = _getPreviousLoadedState();
    if (previousState == null) return;

    try {
      await _logMeal(
        mealType: event.mealType,
        items: event.items,
        source: event.source ?? MealSource.manual,
      );

      // Reload data after logging
      final loadedState = await _loadDietData(previousState.date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(
        message: 'Failed to log meal: $e',
        previousState: previousState,
      ));
    }
  }

  /// Handle quick log food event
  Future<void> _onQuickLogFood(
    QuickLogFoodEvent event,
    Emitter<DietState> emit,
  ) async {
    final previousState = _getPreviousLoadedState();
    if (previousState == null) return;

    try {
      final scaledFood = event.food.scaled(event.servings * event.food.servingSize);

      await _logMeal(
        mealType: event.mealType,
        items: [scaledFood],
        source: MealSource.manual,
      );

      // Reload data after logging
      final loadedState = await _loadDietData(previousState.date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(
        message: 'Failed to log food: $e',
        previousState: previousState,
      ));
    }
  }

  /// Handle update meal event
  Future<void> _onUpdateMeal(
    UpdateMealEvent event,
    Emitter<DietState> emit,
  ) async {
    final previousState = _getPreviousLoadedState();
    if (previousState == null) return;

    try {
      await _logMeal.update(event.meal);

      // Reload data after updating
      final loadedState = await _loadDietData(previousState.date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(
        message: 'Failed to update meal: $e',
        previousState: previousState,
      ));
    }
  }

  /// Handle delete meal event
  Future<void> _onDeleteMeal(
    DeleteMealEvent event,
    Emitter<DietState> emit,
  ) async {
    final previousState = _getPreviousLoadedState();
    if (previousState == null) return;

    try {
      await _logMeal.delete(event.mealId);

      // Reload data after deleting
      final loadedState = await _loadDietData(previousState.date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(
        message: 'Failed to delete meal: $e',
        previousState: previousState,
      ));
    }
  }

  /// Handle change date event
  Future<void> _onChangeDate(
    ChangeDateEvent event,
    Emitter<DietState> emit,
  ) async {
    emit(const DietState.loading());

    try {
      final loadedState = await _loadDietData(event.date);
      emit(loadedState);
    } catch (e) {
      emit(DietState.error(message: 'Failed to load data for date: $e'));
    }
  }

  /// Load all diet data for a date
  Future<DietLoaded> _loadDietData(DateTime date) async {
    final meals = await _getMealsForDate(date);
    final nutritionSummary = await _getMealsForDate.getSummary(date);
    final recipes = await _getRecipes.blueprintOnly();
    final recentFoods = await _searchFood.getRecent();

    // TODO: Load targets from protocol when available
    final targets = NutritionTargets.defaults();

    return DietLoaded(
      date: date,
      meals: meals,
      nutritionSummary: nutritionSummary,
      targets: targets,
      quickLogRecipes: recipes,
      recentFoods: recentFoods,
    );
  }

  /// Get the previous loaded state from current state
  DietLoaded? _getPreviousLoadedState() {
    final currentState = state;

    if (currentState is DietLoaded) {
      return currentState;
    } else if (currentState is DietSearching) {
      return currentState.previousState;
    } else if (currentState is DietSearchResults) {
      return currentState.previousState;
    } else if (currentState is DietError) {
      return currentState.previousState;
    }

    return null;
  }
}
