# Dren Calculation Specifications

## Caloric Target Calculation

### Step 1: Calculate BMR (Mifflin-St Jeor Equation)

```dart
double calculateBMR({
  required double weightKg,
  required double heightCm,
  required int ageYears,
  required String sex,
}) {
  if (sex == 'male') {
    return (10 * weightKg) + (6.25 * heightCm) - (5 * ageYears) + 5;
  } else {
    return (10 * weightKg) + (6.25 * heightCm) - (5 * ageYears) - 161;
  }
}
```

**Example Calculations:**
- Male, 70kg, 175cm, 30 years: (10 × 70) + (6.25 × 175) - (5 × 30) + 5 = **1648.75 kcal**
- Female, 60kg, 165cm, 28 years: (10 × 60) + (6.25 × 165) - (5 × 28) - 161 = **1351.25 kcal**

### Step 2: Calculate TDEE (Total Daily Energy Expenditure)

```dart
double calculateTDEE(double bmr, String activityLevel) {
  final multipliers = {
    'sedentary': 1.2,         // Desk job, little/no exercise
    'lightly_active': 1.375,  // Light exercise 1-3 days/week
    'moderately_active': 1.55, // Moderate exercise 3-5 days/week
    'very_active': 1.725,     // Hard exercise 6-7 days/week
    'extra_active': 1.9,      // Physical job + intense training
  };
  return bmr * multipliers[activityLevel]!;
}
```

### Step 3: Apply Longevity Deficit

```dart
int calculateTargetCalories(double tdee, String ambition) {
  final deficits = {
    'moderate': 0.94,      // 6% deficit
    'aggressive': 0.88,    // 12% deficit (Blueprint-aligned)
  };
  return (tdee * deficits[ambition]!).round();
}
```

**Example Flow:**
1. Male, 70kg, 175cm, 30 years → BMR = 1648.75
2. Moderately active → TDEE = 1648.75 × 1.55 = 2555.56
3. Aggressive ambition → Target = 2555.56 × 0.88 = **2249 kcal**

### Step 4: Calculate Macro Targets

```dart
class MacroTargets {
  final int protein;
  final int carbs;
  final int fat;
  
  MacroTargets({required this.protein, required this.carbs, required this.fat});
}

MacroTargets calculateMacros(int targetCalories, double weightKg) {
  // Longevity-optimized ratios (Blueprint-inspired)
  // Protein: 22-25% (minimum 1.2g/kg for muscle preservation)
  // Fat: 40-45% (emphasizing healthy fats)
  // Carbs: 33-38% (remainder, low-glycemic sources)
  
  // Calculate protein first (ensure minimum threshold)
  final proteinFromPercent = (targetCalories * 0.23 / 4).round();
  final proteinFromWeight = (weightKg * 1.2).round();
  final proteinGrams = max(proteinFromPercent, proteinFromWeight);
  
  // Calculate fat
  final fatGrams = (targetCalories * 0.42 / 9).round();
  
  // Carbs are the remainder
  final proteinCalories = proteinGrams * 4;
  final fatCalories = fatGrams * 9;
  final carbGrams = ((targetCalories - proteinCalories - fatCalories) / 4).round();
  
  return MacroTargets(
    protein: proteinGrams,
    carbs: carbGrams,
    fat: fatGrams,
  );
}
```

**Macro Ratios:**
| Macro | Target % | Calories/gram | Purpose |
|-------|----------|---------------|---------|
| Protein | 22-25% | 4 | Muscle preservation, satiety |
| Fat | 40-45% | 9 | Hormone health, brain function |
| Carbs | 33-38% | 4 | Energy, fiber, micronutrients |

---

## Sleep Score Calculation (0-100)

```dart
int calculateSleepScore(SleepSession session) {
  int score = 0;
  
  // Duration (max 25 points)
  // Optimal: 7-9 hours (420-540 minutes)
  score += _getDurationScore(session.totalMinutes);
  
  // Efficiency (max 25 points)
  // Optimal: ≥90%
  score += _getEfficiencyScore(session.efficiency);
  
  // Deep Sleep (max 20 points)
  // Optimal: 13-23% of total
  score += _getDeepSleepScore(
    session.deepSleepMinutes, 
    session.totalMinutes
  );
  
  // REM Sleep (max 15 points)
  // Optimal: 20-25% of total
  score += _getRemScore(
    session.remSleepMinutes, 
    session.totalMinutes
  );
  
  // Latency (max 10 points)
  // Optimal: 10-20 minutes
  score += _getLatencyScore(session.latencyMinutes);
  
  // Consistency Bonus (max 5 points)
  // Bedtime within ±30 min of target
  score += _getConsistencyBonus(session.bedTime, targetBedtime);
  
  return score.clamp(0, 100);
}

int _getDurationScore(int minutes) {
  if (minutes >= 420 && minutes <= 540) return 25; // 7-9 hours
  if (minutes >= 360 && minutes < 420) return 20;  // 6-7 hours
  if (minutes >= 540 && minutes <= 600) return 20; // 9-10 hours
  if (minutes >= 300 && minutes < 360) return 15;  // 5-6 hours
  if (minutes > 600) return 10;                     // >10 hours
  return 5;                                         // <5 hours
}

int _getEfficiencyScore(double efficiency) {
  // efficiency is 0.0 - 1.0
  if (efficiency >= 0.90) return 25;
  if (efficiency >= 0.85) return 20;
  if (efficiency >= 0.80) return 15;
  if (efficiency >= 0.75) return 10;
  return 5;
}

int _getDeepSleepScore(int deepMinutes, int totalMinutes) {
  final percent = deepMinutes / totalMinutes;
  if (percent >= 0.13 && percent <= 0.23) return 20;
  if (percent >= 0.10 && percent < 0.13) return 15;
  if (percent > 0.23 && percent <= 0.30) return 15;
  if (percent >= 0.05 && percent < 0.10) return 10;
  return 5;
}

int _getRemScore(int remMinutes, int totalMinutes) {
  final percent = remMinutes / totalMinutes;
  if (percent >= 0.20 && percent <= 0.25) return 15;
  if (percent >= 0.15 && percent < 0.20) return 12;
  if (percent > 0.25 && percent <= 0.30) return 12;
  if (percent >= 0.10 && percent < 0.15) return 8;
  return 4;
}

int _getLatencyScore(int minutes) {
  if (minutes >= 10 && minutes <= 20) return 10;
  if (minutes < 10) return 7;  // Falling asleep too fast may indicate sleep debt
  if (minutes <= 30) return 7;
  if (minutes <= 45) return 4;
  return 2;
}

int _getConsistencyBonus(DateTime actual, TimeOfDay target) {
  final targetDateTime = _timeOfDayToDateTime(target, actual);
  final difference = actual.difference(targetDateTime).inMinutes.abs();
  if (difference <= 15) return 5;
  if (difference <= 30) return 3;
  return 0;
}
```

---

## Sleep Schedule Generation

```dart
class SleepSchedule {
  final TimeOfDay targetBedtime;
  final TimeOfDay targetWakeTime;
  final TimeOfDay windDownStart;
  final TimeOfDay lastCaffeineCutoff;
  final TimeOfDay lastMealCutoff;
  final TimeOfDay stopFluidsTime;
}

SleepSchedule generateSleepSchedule(TimeOfDay wakeTime, {int targetHours = 8}) {
  final sleepDuration = Duration(hours: targetHours);
  final sleepLatencyBuffer = Duration(minutes: 15);
  
  // Calculate bedtime (wake time - sleep duration - latency buffer)
  final bedtime = _subtractDuration(wakeTime, sleepDuration + sleepLatencyBuffer);
  
  // Wind-down starts 60 minutes before bedtime
  final windDownStart = _subtractDuration(bedtime, Duration(minutes: 60));
  
  // Last caffeine: 9 hours after wake (or before 2 PM, whichever is earlier)
  final lastCaffeine = _addDuration(wakeTime, Duration(hours: 9));
  
  // Last meal: 3 hours before bedtime (Blueprint: 8 hours before)
  final lastMeal = _subtractDuration(bedtime, Duration(hours: 3));
  
  // Stop fluids: 2-3 hours before bed
  final stopFluids = _subtractDuration(bedtime, Duration(hours: 2, minutes: 30));
  
  return SleepSchedule(
    targetBedtime: bedtime,
    targetWakeTime: wakeTime,
    windDownStart: windDownStart,
    lastCaffeineCutoff: lastCaffeine,
    lastMealCutoff: lastMeal,
    stopFluidsTime: stopFluids,
  );
}
```

**Example (Wake at 6:00 AM, 8-hour target):**
- Target Bedtime: 9:45 PM (10 PM minus 15 min latency buffer)
- Wind-Down Start: 8:45 PM
- Last Caffeine: 3:00 PM
- Last Meal: 6:45 PM
- Stop Fluids: 7:15 PM

---

## Exercise Protocol Generation

### Weekly Structure Templates

```dart
Map<String, List<WorkoutType>> getWeeklyStructure(String fitnessLevel, String ambition) {
  if (fitnessLevel == 'beginner') {
    return {
      'monday': [WorkoutType.fullBodyStrength],
      'tuesday': [WorkoutType.rest],
      'wednesday': [WorkoutType.zone2Cardio],
      'thursday': [WorkoutType.rest],
      'friday': [WorkoutType.yoga],
      'saturday': [WorkoutType.rest],
      'sunday': [WorkoutType.rest],
    };
  }
  
  if (fitnessLevel == 'intermediate') {
    return {
      'monday': [WorkoutType.upperStrength],
      'tuesday': [WorkoutType.zone2Cardio],
      'wednesday': [WorkoutType.lowerStrength],
      'thursday': [WorkoutType.yoga],
      'friday': [WorkoutType.hiit, WorkoutType.core],
      'saturday': [WorkoutType.zone2Cardio],
      'sunday': [WorkoutType.rest],
    };
  }
  
  // Advanced / Blueprint-aligned
  return {
    'monday': [WorkoutType.push],           // Chest/Shoulders/Triceps
    'tuesday': [WorkoutType.hiit, WorkoutType.zone2Cardio],
    'wednesday': [WorkoutType.pull],         // Back/Biceps
    'thursday': [WorkoutType.zone2Cardio],
    'friday': [WorkoutType.legs],            // Legs/Glutes
    'saturday': [WorkoutType.hiit, WorkoutType.zone2Cardio],
    'sunday': [WorkoutType.yoga],            // Active recovery
  };
}
```

### Daily Minute Targets

| Fitness Level | Moderate Ambition | Aggressive Ambition |
|---------------|-------------------|---------------------|
| Beginner | 30 min | 45 min |
| Intermediate | 45 min | 60 min |
| Advanced | 60 min | 90 min |

```dart
int getDailyTargetMinutes(String fitnessLevel, String ambition) {
  final targets = {
    'beginner': {'moderate': 30, 'aggressive': 45},
    'intermediate': {'moderate': 45, 'aggressive': 60},
    'advanced': {'moderate': 60, 'aggressive': 90},
  };
  return targets[fitnessLevel]![ambition]!;
}
```

### Calorie Burn Estimation

```dart
int estimateCaloriesBurn({
  required String category,
  required int durationMinutes,
  required double weightKg,
}) {
  // MET values (Metabolic Equivalent of Task)
  final metValues = {
    'strength': 5.0,
    'hiit': 8.0,
    'running': 7.0,
    'yoga': 3.0,
    'core': 4.0,
    'cycling': 6.0,
    'swimming': 6.0,
    'zone2_cardio': 5.0,
  };
  
  final met = metValues[category] ?? 5.0;
  // Calories = MET × weight(kg) × duration(hours)
  return (met * weightKg * (durationMinutes / 60)).round();
}
```

---

## Adaptive Algorithm

### Inputs Monitored

```dart
class AdaptationInputs {
  final double avgCalorieIntakePercent;    // 7-day rolling avg vs target
  final double exerciseCompletionRate;      // 7-day completion rate
  final double avgSleepHours;               // 7-day average
  final double avgSleepScore;               // 7-day average
  final double weightTrend;                 // 14-day kg change
  final double hrvTrend;                    // 7-day HRV change percent
}
```

### Adjustment Triggers

```dart
List<ProtocolAdjustment> analyzeAndAdjust(AdaptationInputs inputs) {
  final adjustments = <ProtocolAdjustment>[];
  
  // Calorie surplus detection
  if (inputs.avgCalorieIntakePercent > 1.05) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.reduceCalories,
      amount: 100,
      reason: 'Consistent calorie surplus detected',
    ));
  }
  
  // Too aggressive deficit
  if (inputs.avgCalorieIntakePercent < 0.80) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.increaseCalories,
      amount: 150,
      reason: 'Deficit too aggressive - risking metabolic adaptation',
    ));
  }
  
  // Exercise under-completion
  if (inputs.exerciseCompletionRate < 0.60) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.reduceWorkoutDuration,
      reason: 'Offering shorter workout alternatives',
    ));
  }
  
  // Sleep efficiency declining
  if (inputs.avgSleepScore < 70) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.sleepIntervention,
      reason: 'Consider sleep restriction protocol',
    ));
  }
  
  // Weight plateau
  if (inputs.weightTrend.abs() < 0.1 && daysSinceLastChange > 14) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.adjustDeficit,
      amount: 5, // Increase deficit by 5%
      reason: 'Weight plateau detected',
    ));
  }
  
  // HRV declining (overtraining signal)
  if (inputs.hrvTrend < -0.10) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.addRecoveryDay,
      reason: 'HRV declining - recommend recovery',
    ));
  }
  
  // Consistently exceeding targets
  if (inputs.exerciseCompletionRate > 1.10 && 
      inputs.avgSleepScore > 85) {
    adjustments.add(ProtocolAdjustment(
      type: AdjustmentType.increaseDifficulty,
      reason: 'Ready for next challenge level',
    ));
  }
  
  return adjustments;
}
```

### Adjustment Thresholds Summary

| Signal | Threshold | Adjustment |
|--------|-----------|------------|
| Calorie surplus | >105% for 3+ days | Reduce target by 100 kcal |
| Deficit too aggressive | <80% for 3+ days | Increase target by 150 kcal |
| Exercise under-completion | <60% weekly | Offer shorter alternatives |
| Sleep efficiency declining | <80% for 5+ days | Sleep restriction, earlier meals |
| Weight plateau | No change 14+ days | Adjust deficit by 5% |
| HRV declining | 10%+ drop over 7 days | Recovery day, reduce intensity |
| Exceeding targets | >110% for 7+ days | Advance difficulty level |

---

## Unit Conversions

```dart
// Weight
double lbsToKg(double lbs) => lbs * 0.453592;
double kgToLbs(double kg) => kg * 2.20462;

// Height
double inchesToCm(double inches) => inches * 2.54;
double cmToInches(double cm) => cm / 2.54;
double feetInchesToCm(int feet, int inches) => (feet * 12 + inches) * 2.54;

// Distance
double milesToKm(double miles) => miles * 1.60934;
double kmToMiles(double km) => km / 1.60934;

// Temperature
double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;
double celsiusToFahrenheit(double c) => c * 9 / 5 + 32;
```
