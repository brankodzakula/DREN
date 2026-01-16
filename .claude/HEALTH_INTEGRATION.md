# Dren Health Platform Integration

## Overview

Dren integrates with native health platforms to:
1. Read workout data from external apps (Apple Fitness+, Strava, etc.)
2. Read sleep data from watches and trackers
3. Sync step counts and active energy
4. Write logged meals and completed workouts back to health platforms

All health data stays on-device. No cloud sync.

---

## Apple HealthKit (iOS)

### Required Info.plist Entries

```xml
<key>NSHealthShareUsageDescription</key>
<string>Dren reads your health data to personalize your longevity protocol and track your daily progress toward your goals.</string>

<key>NSHealthUpdateUsageDescription</key>
<string>Dren saves your workout and nutrition data to Apple Health to maintain a complete health record across all your apps.</string>

<key>UIBackgroundModes</key>
<array>
    <string>processing</string>
</array>
```

### Entitlements

```xml
<key>com.apple.developer.healthkit</key>
<true/>
<key>com.apple.developer.healthkit.background-delivery</key>
<true/>
```

### Data Types

#### Read Permissions
| Data Type | HealthKit Identifier | Purpose |
|-----------|---------------------|---------|
| Heart Rate | HKQuantityTypeIdentifierHeartRate | Workout intensity |
| Resting Heart Rate | HKQuantityTypeIdentifierRestingHeartRate | Fitness assessment |
| Step Count | HKQuantityTypeIdentifierStepCount | Daily activity |
| Active Energy | HKQuantityTypeIdentifierActiveEnergyBurned | Calories out ring |
| Basal Energy | HKQuantityTypeIdentifierBasalEnergyBurned | BMR verification |
| Sleep Analysis | HKCategoryTypeIdentifierSleepAnalysis | Sleep tracking |
| Workout | HKWorkoutType | External workout sync |
| HRV | HKQuantityTypeIdentifierHeartRateVariabilitySDNN | Recovery assessment |
| VO2 Max | HKQuantityTypeIdentifierVO2Max | Fitness level |

#### Write Permissions
| Data Type | HealthKit Identifier | Purpose |
|-----------|---------------------|---------|
| Workout | HKWorkoutType | Save completed workouts |
| Active Energy | HKQuantityTypeIdentifierActiveEnergyBurned | Workout calories |
| Dietary Energy | HKQuantityTypeIdentifierDietaryEnergyConsumed | Logged meals |
| Dietary Protein | HKQuantityTypeIdentifierDietaryProtein | Macro tracking |
| Dietary Carbs | HKQuantityTypeIdentifierDietaryCarbohydrates | Macro tracking |
| Dietary Fat | HKQuantityTypeIdentifierDietaryFatTotal | Macro tracking |

### Implementation

```dart
import 'package:health/health.dart';

class HealthKitService {
  final HealthFactory _health = HealthFactory();
  
  static const _readTypes = [
    HealthDataType.HEART_RATE,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_REM,
    HealthDataType.WORKOUT,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
  ];
  
  static const _writeTypes = [
    HealthDataType.WORKOUT,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.DIETARY_ENERGY_CONSUMED,
    HealthDataType.DIETARY_PROTEIN,
    HealthDataType.DIETARY_CARBS,
    HealthDataType.DIETARY_FAT,
  ];
  
  Future<bool> requestPermissions() async {
    return await _health.requestAuthorization(
      [..._readTypes, ..._writeTypes],
      permissions: [
        ...List.filled(_readTypes.length, HealthDataAccess.READ),
        ...List.filled(_writeTypes.length, HealthDataAccess.READ_WRITE),
      ],
    );
  }
  
  Future<List<HealthDataPoint>> getTodaysData() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    
    return await _health.getHealthDataFromTypes(
      midnight,
      now,
      _readTypes,
    );
  }
  
  Future<SleepSession?> getLastNightSleep() async {
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));
    final sleepStart = DateTime(yesterday.year, yesterday.month, yesterday.day, 18, 0);
    final sleepEnd = DateTime(now.year, now.month, now.day, 12, 0);
    
    final sleepData = await _health.getHealthDataFromTypes(
      sleepStart,
      sleepEnd,
      [
        HealthDataType.SLEEP_ASLEEP,
        HealthDataType.SLEEP_AWAKE,
        HealthDataType.SLEEP_DEEP,
        HealthDataType.SLEEP_LIGHT,
        HealthDataType.SLEEP_REM,
      ],
    );
    
    // Process and aggregate sleep data into SleepSession
    return _aggregateSleepData(sleepData);
  }
  
  Future<bool> saveWorkout(WorkoutSession session) async {
    return await _health.writeWorkoutData(
      activityType: _mapWorkoutCategory(session.category),
      start: session.startTime,
      end: session.endTime,
      totalEnergyBurned: session.caloriesBurned,
      totalEnergyBurnedUnit: HealthDataUnit.KILOCALORIE,
    );
  }
  
  Future<bool> saveMeal(MealEntry meal) async {
    final success = await _health.writeHealthData(
      meal.totalCalories.toDouble(),
      HealthDataType.DIETARY_ENERGY_CONSUMED,
      meal.timestamp,
      meal.timestamp,
      unit: HealthDataUnit.KILOCALORIE,
    );
    
    // Also save macros
    await _health.writeHealthData(
      meal.totalProtein,
      HealthDataType.DIETARY_PROTEIN,
      meal.timestamp,
      meal.timestamp,
      unit: HealthDataUnit.GRAM,
    );
    
    return success;
  }
}
```

### Sleep Stage Mapping

| HealthKit Stage | Dren Category |
|-----------------|---------------|
| HKCategoryValueSleepAnalysisInBed | Not counted |
| HKCategoryValueSleepAnalysisAsleepUnspecified | Light sleep |
| HKCategoryValueSleepAnalysisAsleepCore | Light sleep |
| HKCategoryValueSleepAnalysisAsleepDeep | Deep sleep |
| HKCategoryValueSleepAnalysisAsleepREM | REM sleep |
| HKCategoryValueSleepAnalysisAwake | Awake |

---

## Google Health Connect (Android)

### Required Permissions (AndroidManifest.xml)

```xml
<!-- Health Connect Permissions -->
<uses-permission android:name="android.permission.health.READ_HEART_RATE"/>
<uses-permission android:name="android.permission.health.READ_RESTING_HEART_RATE"/>
<uses-permission android:name="android.permission.health.READ_STEPS"/>
<uses-permission android:name="android.permission.health.READ_TOTAL_CALORIES_BURNED"/>
<uses-permission android:name="android.permission.health.READ_ACTIVE_CALORIES_BURNED"/>
<uses-permission android:name="android.permission.health.READ_SLEEP"/>
<uses-permission android:name="android.permission.health.READ_EXERCISE"/>
<uses-permission android:name="android.permission.health.READ_HEART_RATE_VARIABILITY"/>

<uses-permission android:name="android.permission.health.WRITE_EXERCISE"/>
<uses-permission android:name="android.permission.health.WRITE_NUTRITION"/>
<uses-permission android:name="android.permission.health.WRITE_ACTIVE_CALORIES_BURNED"/>

<!-- Intent filter for Health Connect -->
<intent-filter>
    <action android:name="androidx.health.ACTION_SHOW_PERMISSIONS_RATIONALE"/>
</intent-filter>

<activity
    android:name=".HealthConnectPermissionsRationaleActivity"
    android:exported="true">
    <intent-filter>
        <action android:name="androidx.health.ACTION_SHOW_PERMISSIONS_RATIONALE"/>
    </intent-filter>
</activity>
```

### Data Types

| Health Connect Type | Purpose |
|---------------------|---------|
| HeartRateRecord | Workout intensity |
| RestingHeartRateRecord | Fitness assessment |
| StepsRecord | Daily activity |
| ActiveCaloriesBurnedRecord | Calories out ring |
| BasalMetabolicRateRecord | BMR verification |
| SleepSessionRecord | Sleep tracking |
| ExerciseSessionRecord | External workout sync |
| HeartRateVariabilityRmssdRecord | Recovery |
| NutritionRecord | Meal logging |

### Implementation

```dart
class HealthConnectService {
  final HealthFactory _health = HealthFactory();
  
  Future<bool> isAvailable() async {
    return await _health.isHealthConnectAvailable();
  }
  
  Future<bool> requestPermissions() async {
    final types = [
      HealthDataType.HEART_RATE,
      HealthDataType.RESTING_HEART_RATE,
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.SLEEP_SESSION,
      HealthDataType.WORKOUT,
    ];
    
    return await _health.requestAuthorization(types);
  }
  
  Future<List<WorkoutSession>> getExternalWorkouts(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(Duration(days: 1));
    
    final workouts = await _health.getHealthDataFromTypes(
      start,
      end,
      [HealthDataType.WORKOUT],
    );
    
    return workouts.map(_convertToWorkoutSession).toList();
  }
}
```

---

## Platform Differences

| Feature | Apple HealthKit | Health Connect |
|---------|-----------------|----------------|
| Cross-device sync | Yes (iCloud) | No (device-local) |
| Historical data | Full history | 30 days default |
| Background reads | Yes (observer queries) | Android 15+ only |
| Sleep stages | iOS 16+ | All versions |
| Write-back | Full support | Full support |
| Availability | All iOS devices | Requires HC app |

---

## Sync Strategy

### On App Launch
1. Request permissions if not granted
2. Fetch last night's sleep data
3. Fetch today's steps and active energy
4. Fetch any external workouts from today

### Background Sync (iOS only)
```dart
// Set up observer query for new workout data
void setupBackgroundObserver() {
  _health.enableBackgroundObserver(
    HealthDataType.WORKOUT,
    onDataReceived: (data) {
      // Process new workout data
      _processExternalWorkout(data);
    },
  );
}
```

### Manual Refresh
- Pull-to-refresh on Today tab
- Re-fetch last 24 hours of data

---

## Data Deduplication

```dart
bool isDuplicateWorkout(WorkoutSession external, WorkoutSession local) {
  // Check if times overlap significantly
  final overlapStart = max(external.startTime, local.startTime);
  final overlapEnd = min(external.endTime, local.endTime);
  final overlap = overlapEnd.difference(overlapStart).inMinutes;
  
  final externalDuration = external.durationMinutes;
  final localDuration = local.durationMinutes;
  
  // If >50% overlap, consider duplicate
  return overlap > (min(externalDuration, localDuration) * 0.5);
}
```

---

## Error Handling

```dart
enum HealthError {
  notAvailable,      // Health platform not available
  permissionDenied,  // User denied permissions
  noData,            // No data for requested period
  syncFailed,        // Write operation failed
}

class HealthResult<T> {
  final T? data;
  final HealthError? error;
  
  bool get isSuccess => data != null && error == null;
}
```

---

## Privacy Considerations

1. **No cloud sync**: All health data stays on-device
2. **Minimal requests**: Only request data types actually used
3. **User control**: Allow disconnecting health platforms in settings
4. **Clear disclosure**: Explain exactly what data is read/written
5. **No sharing**: Never send health data to external servers
