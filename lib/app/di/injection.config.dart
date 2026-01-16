// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/services/database/app_database.dart' as _i1017;
import '../../core/services/database/daos/daily_progress_dao.dart' as _i50;
import '../../core/services/database/daos/daily_protocol_dao.dart' as _i441;
import '../../core/services/database/daos/meal_entry_dao.dart' as _i755;
import '../../core/services/database/daos/recipe_dao.dart' as _i336;
import '../../core/services/database/daos/sleep_session_dao.dart' as _i487;
import '../../core/services/database/daos/user_profile_dao.dart' as _i141;
import '../../core/services/database/daos/workout_dao.dart' as _i595;
import '../../core/services/database/daos/workout_session_dao.dart' as _i901;
import '../../core/services/health_service.dart' as _i894;
import '../../core/services/health_sync_service.dart' as _i357;
import '../../core/services/network/network_module.dart' as _i504;
import '../../core/services/secure_storage_service.dart' as _i814;
import '../../features/diet/data/datasources/food_cache.dart' as _i232;
import '../../features/diet/data/datasources/local_food_datasource.dart'
    as _i577;
import '../../features/diet/data/datasources/open_food_facts_datasource.dart'
    as _i505;
import '../../features/diet/data/datasources/usda_datasource.dart' as _i825;
import '../../features/diet/data/repositories/diet_repository_impl.dart'
    as _i905;
import '../../features/diet/domain/repositories/diet_repository.dart' as _i880;
import '../../features/diet/domain/usecases/get_meals_for_date.dart' as _i489;
import '../../features/diet/domain/usecases/get_recipes.dart' as _i788;
import '../../features/diet/domain/usecases/log_meal.dart' as _i622;
import '../../features/diet/domain/usecases/search_food.dart' as _i652;
import '../../features/diet/presentation/bloc/diet_bloc.dart' as _i536;
import '../../features/exercise/data/datasources/exercise_local_datasource.dart'
    as _i1034;
import '../../features/exercise/data/datasources/workout_session_datasource.dart'
    as _i327;
import '../../features/exercise/data/repositories/exercise_repository_impl.dart'
    as _i606;
import '../../features/exercise/domain/repositories/exercise_repository.dart'
    as _i50;
import '../../features/exercise/domain/usecases/get_exercise_library.dart'
    as _i177;
import '../../features/exercise/domain/usecases/get_today_workout.dart'
    as _i312;
import '../../features/exercise/domain/usecases/log_workout_session.dart'
    as _i486;
import '../../features/exercise/domain/usecases/usecases.dart' as _i591;
import '../../features/exercise/presentation/bloc/exercise_bloc.dart' as _i154;
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i452;
import '../../features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i430;
import '../../features/onboarding/domain/usecases/check_onboarding_complete.dart'
    as _i9;
import '../../features/onboarding/domain/usecases/save_user_profile.dart'
    as _i531;
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i792;
import '../../features/protocol_engine/domain/usecases/generate_daily_protocol.dart'
    as _i969;
import '../../features/protocol_engine/domain/usecases/generate_sleep_schedule.dart'
    as _i239;
import '../../features/settings/data/repositories/settings_repository_impl.dart'
    as _i955;
import '../../features/settings/domain/repositories/settings_repository.dart'
    as _i674;
import '../../features/settings/domain/usecases/get_user_settings.dart'
    as _i775;
import '../../features/settings/domain/usecases/manage_data.dart' as _i799;
import '../../features/settings/domain/usecases/update_ambition.dart' as _i489;
import '../../features/settings/domain/usecases/update_profile.dart' as _i93;
import '../../features/settings/presentation/bloc/settings_bloc.dart' as _i585;
import '../../features/sleep/data/datasources/meditation_datasource.dart'
    as _i944;
import '../../features/sleep/data/datasources/sleep_local_datasource.dart'
    as _i266;
import '../../features/sleep/data/repositories/sleep_repository_impl.dart'
    as _i547;
import '../../features/sleep/domain/repositories/sleep_repository.dart'
    as _i1011;
import '../../features/sleep/domain/usecases/get_last_night_sleep.dart'
    as _i1014;
import '../../features/sleep/domain/usecases/get_meditations.dart' as _i54;
import '../../features/sleep/domain/usecases/get_sleep_history.dart' as _i704;
import '../../features/sleep/domain/usecases/get_sleep_schedule.dart' as _i97;
import '../../features/sleep/domain/usecases/log_sleep_habits.dart' as _i744;
import '../../features/sleep/domain/usecases/save_sleep_session.dart' as _i389;
import '../../features/sleep/presentation/bloc/sleep_bloc.dart' as _i602;
import '../../features/today/data/repositories/today_repository_impl.dart'
    as _i700;
import '../../features/today/domain/repositories/today_repository.dart'
    as _i160;
import '../../features/today/domain/usecases/get_daily_progress.dart' as _i345;
import '../../features/today/domain/usecases/get_today_protocol.dart' as _i276;
import '../../features/today/presentation/bloc/today_bloc.dart' as _i63;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i239.GenerateSleepSchedule>(
        () => _i239.GenerateSleepSchedule());
    gh.singleton<_i1017.AppDatabase>(() => databaseModule.database);
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.singleton<_i814.SecureStorageService>(
        () => _i814.SecureStorageService());
    gh.singleton<_i232.FoodCache>(() => _i232.FoodCache());
    gh.lazySingleton<_i894.HealthService>(() => _i894.HealthService());
    gh.lazySingleton<_i944.MeditationDataSource>(
        () => _i944.MeditationDataSource());
    gh.lazySingleton<_i1034.ExerciseLocalDataSource>(
        () => _i1034.ExerciseLocalDataSourceImpl());
    gh.lazySingleton<_i357.HealthSyncService>(
        () => _i357.HealthSyncService(gh<_i894.HealthService>()));
    gh.factory<_i505.OpenFoodFactsDataSource>(
        () => _i505.OpenFoodFactsDataSource(gh<_i361.Dio>()));
    gh.factory<_i825.UsdaDataSource>(
        () => _i825.UsdaDataSource(gh<_i361.Dio>()));
    gh.singleton<_i141.UserProfileDao>(
        () => databaseModule.userProfileDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i441.DailyProtocolDao>(
        () => databaseModule.dailyProtocolDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i755.MealEntryDao>(
        () => databaseModule.mealEntryDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i901.WorkoutSessionDao>(
        () => databaseModule.workoutSessionDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i487.SleepSessionDao>(
        () => databaseModule.sleepSessionDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i336.RecipeDao>(
        () => databaseModule.recipeDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i595.WorkoutDao>(
        () => databaseModule.workoutDao(gh<_i1017.AppDatabase>()));
    gh.singleton<_i50.DailyProgressDao>(
        () => databaseModule.dailyProgressDao(gh<_i1017.AppDatabase>()));
    gh.lazySingleton<_i674.SettingsRepository>(
        () => _i955.SettingsRepositoryImpl(
              gh<_i1017.AppDatabase>(),
              gh<_i814.SecureStorageService>(),
            ));
    gh.lazySingleton<_i327.WorkoutSessionDataSource>(() =>
        _i327.WorkoutSessionDataSourceImpl(gh<_i901.WorkoutSessionDao>()));
    gh.factory<_i577.LocalFoodDataSource>(
        () => _i577.LocalFoodDataSource(gh<_i1017.AppDatabase>()));
    gh.factory<_i969.GenerateDailyProtocol>(
        () => _i969.GenerateDailyProtocol(gh<_i239.GenerateSleepSchedule>()));
    gh.lazySingleton<_i880.DietRepository>(() => _i905.DietRepositoryImpl(
          gh<_i825.UsdaDataSource>(),
          gh<_i505.OpenFoodFactsDataSource>(),
          gh<_i577.LocalFoodDataSource>(),
          gh<_i232.FoodCache>(),
        ));
    gh.lazySingleton<_i50.ExerciseRepository>(
        () => _i606.ExerciseRepositoryImpl(
              gh<_i1034.ExerciseLocalDataSource>(),
              gh<_i327.WorkoutSessionDataSource>(),
            ));
    gh.lazySingleton<_i160.TodayRepository>(() => _i700.TodayRepositoryImpl(
          gh<_i50.DailyProgressDao>(),
          gh<_i441.DailyProtocolDao>(),
        ));
    gh.factory<_i93.UpdateProfile>(
        () => _i93.UpdateProfile(gh<_i674.SettingsRepository>()));
    gh.factory<_i799.ManageData>(
        () => _i799.ManageData(gh<_i674.SettingsRepository>()));
    gh.factory<_i775.GetUserSettings>(
        () => _i775.GetUserSettings(gh<_i674.SettingsRepository>()));
    gh.factory<_i489.UpdateAmbition>(
        () => _i489.UpdateAmbition(gh<_i674.SettingsRepository>()));
    gh.factory<_i345.GetDailyProgress>(
        () => _i345.GetDailyProgress(gh<_i160.TodayRepository>()));
    gh.lazySingleton<_i266.SleepLocalDataSource>(
        () => _i266.SleepLocalDataSource(gh<_i487.SleepSessionDao>()));
    gh.factory<_i486.LogWorkoutSession>(
        () => _i486.LogWorkoutSession(gh<_i50.ExerciseRepository>()));
    gh.factory<_i312.GetTodayWorkout>(
        () => _i312.GetTodayWorkout(gh<_i50.ExerciseRepository>()));
    gh.factory<_i177.GetExerciseLibrary>(
        () => _i177.GetExerciseLibrary(gh<_i50.ExerciseRepository>()));
    gh.factory<_i154.ExerciseBloc>(() => _i154.ExerciseBloc(
          gh<_i591.GetTodayWorkout>(),
          gh<_i591.GetExerciseLibrary>(),
          gh<_i591.LogWorkoutSession>(),
          gh<_i357.HealthSyncService>(),
        ));
    gh.lazySingleton<_i430.OnboardingRepository>(
        () => _i452.OnboardingRepositoryImpl(
              gh<_i141.UserProfileDao>(),
              gh<_i814.SecureStorageService>(),
            ));
    gh.factory<_i489.GetMealsForDate>(
        () => _i489.GetMealsForDate(gh<_i880.DietRepository>()));
    gh.factory<_i788.GetRecipes>(
        () => _i788.GetRecipes(gh<_i880.DietRepository>()));
    gh.factory<_i652.SearchFood>(
        () => _i652.SearchFood(gh<_i880.DietRepository>()));
    gh.factory<_i622.LogMeal>(() => _i622.LogMeal(gh<_i880.DietRepository>()));
    gh.factory<_i9.CheckOnboardingComplete>(
        () => _i9.CheckOnboardingComplete(gh<_i430.OnboardingRepository>()));
    gh.factory<_i531.SaveUserProfile>(
        () => _i531.SaveUserProfile(gh<_i430.OnboardingRepository>()));
    gh.factory<_i585.SettingsBloc>(() => _i585.SettingsBloc(
          gh<_i775.GetUserSettings>(),
          gh<_i93.UpdateProfile>(),
          gh<_i489.UpdateAmbition>(),
          gh<_i799.ManageData>(),
          gh<_i674.SettingsRepository>(),
          gh<_i894.HealthService>(),
        ));
    gh.factory<_i536.DietBloc>(() => _i536.DietBloc(
          gh<_i652.SearchFood>(),
          gh<_i622.LogMeal>(),
          gh<_i489.GetMealsForDate>(),
          gh<_i788.GetRecipes>(),
        ));
    gh.factory<_i792.OnboardingBloc>(() => _i792.OnboardingBloc(
          gh<_i430.OnboardingRepository>(),
          gh<_i531.SaveUserProfile>(),
          gh<_i9.CheckOnboardingComplete>(),
        ));
    gh.factory<_i276.GetTodayProtocol>(() => _i276.GetTodayProtocol(
          gh<_i160.TodayRepository>(),
          gh<_i430.OnboardingRepository>(),
          gh<_i969.GenerateDailyProtocol>(),
        ));
    gh.lazySingleton<_i1011.SleepRepository>(() => _i547.SleepRepositoryImpl(
          gh<_i266.SleepLocalDataSource>(),
          gh<_i944.MeditationDataSource>(),
          gh<_i441.DailyProtocolDao>(),
        ));
    gh.factory<_i389.SaveSleepSession>(
        () => _i389.SaveSleepSession(gh<_i1011.SleepRepository>()));
    gh.factory<_i54.GetMeditations>(
        () => _i54.GetMeditations(gh<_i1011.SleepRepository>()));
    gh.factory<_i97.GetSleepSchedule>(
        () => _i97.GetSleepSchedule(gh<_i1011.SleepRepository>()));
    gh.factory<_i704.GetSleepHistory>(
        () => _i704.GetSleepHistory(gh<_i1011.SleepRepository>()));
    gh.factory<_i744.LogSleepHabits>(
        () => _i744.LogSleepHabits(gh<_i1011.SleepRepository>()));
    gh.factory<_i1014.GetLastNightSleep>(
        () => _i1014.GetLastNightSleep(gh<_i1011.SleepRepository>()));
    gh.factory<_i602.SleepBloc>(() => _i602.SleepBloc(
          gh<_i1014.GetLastNightSleep>(),
          gh<_i97.GetSleepSchedule>(),
          gh<_i744.LogSleepHabits>(),
          gh<_i54.GetMeditations>(),
          gh<_i704.GetSleepHistory>(),
          gh<_i357.HealthSyncService>(),
        ));
    gh.factory<_i63.TodayBloc>(() => _i63.TodayBloc(
          gh<_i345.GetDailyProgress>(),
          gh<_i276.GetTodayProtocol>(),
          gh<_i160.TodayRepository>(),
          gh<_i357.HealthSyncService>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i1017.DatabaseModule {}

class _$NetworkModule extends _i504.NetworkModule {}
