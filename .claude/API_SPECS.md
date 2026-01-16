# Dren External API Specifications

## Overview

Dren uses free, open APIs for nutrition data. All API calls are optional - the app works fully offline with local data.

---

## USDA FoodData Central (Primary Nutrition Database)

### API Details
- **Base URL**: `https://api.nal.usda.gov/fdc/v1`
- **Cost**: Free
- **Rate Limit**: 1,000 requests/hour per API key
- **Registration**: https://fdc.nal.usda.gov/api-key-signup.html

### Endpoints Used

#### Search Foods
```
GET /foods/search
```

**Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| api_key | string | Yes | Your API key |
| query | string | Yes | Search terms |
| dataType | string | No | Filter: Foundation, SR Legacy, Survey (FNDDS), Branded |
| pageSize | int | No | Results per page (max 200) |
| pageNumber | int | No | Page number |

**Example Request:**
```
GET https://api.nal.usda.gov/fdc/v1/foods/search?api_key=YOUR_KEY&query=chicken%20breast&pageSize=25
```

**Response Structure:**
```json
{
  "totalHits": 1234,
  "currentPage": 1,
  "totalPages": 50,
  "foods": [
    {
      "fdcId": 171077,
      "description": "Chicken, broilers or fryers, breast, meat only, cooked, roasted",
      "dataType": "SR Legacy",
      "brandOwner": null,
      "ingredients": null,
      "foodNutrients": [
        {
          "nutrientId": 1008,
          "nutrientName": "Energy",
          "unitName": "KCAL",
          "value": 165.0
        },
        {
          "nutrientId": 1003,
          "nutrientName": "Protein",
          "unitName": "G",
          "value": 31.02
        }
      ]
    }
  ]
}
```

#### Get Food Details
```
GET /food/{fdcId}
```

**Example:**
```
GET https://api.nal.usda.gov/fdc/v1/food/171077?api_key=YOUR_KEY
```

### Nutrient IDs Reference
| Nutrient | ID | Unit |
|----------|-----|------|
| Energy | 1008 | kcal |
| Protein | 1003 | g |
| Total Fat | 1004 | g |
| Carbohydrates | 1005 | g |
| Fiber | 1079 | g |
| Sugars | 2000 | g |
| Sodium | 1093 | mg |
| Saturated Fat | 1258 | g |
| Cholesterol | 1253 | mg |

### Implementation

```dart
class UsdaDataSource {
  final Dio _dio;
  static const _baseUrl = 'https://api.nal.usda.gov/fdc/v1';
  final String _apiKey;
  
  UsdaDataSource(this._dio, this._apiKey);
  
  Future<List<FoodItem>> searchFoods(String query) async {
    final response = await _dio.get(
      '$_baseUrl/foods/search',
      queryParameters: {
        'api_key': _apiKey,
        'query': query,
        'pageSize': 25,
        'dataType': 'Foundation,SR Legacy',
      },
    );
    
    final foods = response.data['foods'] as List;
    return foods.map((f) => _mapToFoodItem(f)).toList();
  }
  
  FoodItem _mapToFoodItem(Map<String, dynamic> json) {
    final nutrients = json['foodNutrients'] as List;
    
    return FoodItem(
      id: json['fdcId'].toString(),
      name: json['description'],
      servingSize: 100,
      servingUnit: 'g',
      calories: _getNutrient(nutrients, 1008)?.toInt() ?? 0,
      protein: _getNutrient(nutrients, 1003) ?? 0,
      carbs: _getNutrient(nutrients, 1005) ?? 0,
      fat: _getNutrient(nutrients, 1004) ?? 0,
      fiber: _getNutrient(nutrients, 1079),
      sugar: _getNutrient(nutrients, 2000),
      sodium: _getNutrient(nutrients, 1093),
      databaseSource: 'usda',
    );
  }
  
  double? _getNutrient(List nutrients, int nutrientId) {
    final nutrient = nutrients.firstWhere(
      (n) => n['nutrientId'] == nutrientId,
      orElse: () => null,
    );
    return nutrient?['value']?.toDouble();
  }
}
```

---

## Open Food Facts (Barcode Scanning)

### API Details
- **Base URL**: `https://world.openfoodfacts.org/api/v2`
- **Cost**: Free (open source)
- **Rate Limit**: No strict limit (be respectful)
- **User-Agent**: Required - identify your app

### Endpoints Used

#### Get Product by Barcode
```
GET /product/{barcode}.json
```

**Headers Required:**
```
User-Agent: Dren/1.0 (contact@example.com)
```

**Example:**
```
GET https://world.openfoodfacts.org/api/v2/product/3017620422003.json
```

**Response Structure:**
```json
{
  "code": "3017620422003",
  "status": 1,
  "product": {
    "product_name": "Nutella",
    "brands": "Ferrero",
    "serving_size": "15 g",
    "nutriments": {
      "energy-kcal_100g": 539,
      "proteins_100g": 6.3,
      "carbohydrates_100g": 57.5,
      "fat_100g": 30.9,
      "fiber_100g": 0,
      "sugars_100g": 56.3,
      "sodium_100g": 0.041
    }
  }
}
```

### Implementation

```dart
class OpenFoodFactsDataSource {
  final Dio _dio;
  static const _baseUrl = 'https://world.openfoodfacts.org/api/v2';
  
  OpenFoodFactsDataSource(this._dio) {
    _dio.options.headers['User-Agent'] = 'Dren/1.0 (dren-app)';
  }
  
  Future<FoodItem?> getProductByBarcode(String barcode) async {
    try {
      final response = await _dio.get('$_baseUrl/product/$barcode.json');
      
      if (response.data['status'] != 1) {
        return null; // Product not found
      }
      
      return _mapToFoodItem(response.data['product'], barcode);
    } catch (e) {
      return null;
    }
  }
  
  FoodItem _mapToFoodItem(Map<String, dynamic> product, String barcode) {
    final nutrients = product['nutriments'] ?? {};
    
    // Parse serving size (e.g., "15 g" -> 15.0)
    final servingString = product['serving_size'] ?? '100 g';
    final servingSize = _parseServingSize(servingString);
    
    return FoodItem(
      id: barcode,
      name: product['product_name'] ?? 'Unknown Product',
      brand: product['brands'],
      servingSize: servingSize,
      servingUnit: 'g',
      calories: (nutrients['energy-kcal_100g'] ?? 0).toInt(),
      protein: (nutrients['proteins_100g'] ?? 0).toDouble(),
      carbs: (nutrients['carbohydrates_100g'] ?? 0).toDouble(),
      fat: (nutrients['fat_100g'] ?? 0).toDouble(),
      fiber: (nutrients['fiber_100g'])?.toDouble(),
      sugar: (nutrients['sugars_100g'])?.toDouble(),
      sodium: (nutrients['sodium_100g'])?.toDouble(),
      barcode: barcode,
      databaseSource: 'open_food_facts',
    );
  }
  
  double _parseServingSize(String serving) {
    final match = RegExp(r'(\d+\.?\d*)').firstMatch(serving);
    return match != null ? double.parse(match.group(1)!) : 100.0;
  }
}
```

---

## Wger Exercise Database (Bundled)

### Strategy
Instead of API calls, bundle the exercise database as a local JSON asset for offline-first operation.

### Data Source
- **URL**: https://wger.de/api/v2/
- **License**: AGPL v3+
- **Approach**: Download once, bundle in app

### Bundled Asset Structure

`assets/data/exercises.json`:
```json
{
  "exercises": [
    {
      "id": 1,
      "name": "Push-ups",
      "category": "chest",
      "muscleGroups": ["chest", "shoulders", "triceps"],
      "equipment": ["none"],
      "difficulty": "beginner",
      "instructions": "Start in plank position...",
      "videoUrl": null,
      "alternatives": [2, 15, 23]
    },
    {
      "id": 2,
      "name": "Bench Press",
      "category": "chest",
      "muscleGroups": ["chest", "shoulders", "triceps"],
      "equipment": ["barbell", "bench"],
      "difficulty": "intermediate",
      "instructions": "Lie on bench...",
      "alternatives": [1, 15]
    }
  ],
  "categories": [
    {"id": "chest", "name": "Chest"},
    {"id": "back", "name": "Back"},
    {"id": "shoulders", "name": "Shoulders"},
    {"id": "arms", "name": "Arms"},
    {"id": "legs", "name": "Legs"},
    {"id": "core", "name": "Core"}
  ]
}
```

### Implementation

```dart
class ExerciseRepository {
  List<Exercise>? _cachedExercises;
  
  Future<List<Exercise>> getAllExercises() async {
    if (_cachedExercises != null) return _cachedExercises!;
    
    final jsonString = await rootBundle.loadString('assets/data/exercises.json');
    final data = json.decode(jsonString);
    
    _cachedExercises = (data['exercises'] as List)
        .map((e) => Exercise.fromJson(e))
        .toList();
    
    return _cachedExercises!;
  }
  
  Future<List<Exercise>> getExercisesByCategory(String category) async {
    final all = await getAllExercises();
    return all.where((e) => e.category == category).toList();
  }
  
  Future<List<Exercise>> getExercisesForEquipment(List<String> equipment) async {
    final all = await getAllExercises();
    return all.where((e) => 
      e.equipment.every((eq) => equipment.contains(eq) || eq == 'none')
    ).toList();
  }
  
  Future<List<Exercise>> getAlternatives(Exercise exercise) async {
    final all = await getAllExercises();
    return all.where((e) => exercise.alternatives.contains(e.id)).toList();
  }
}
```

---

## Blueprint Recipes (Hardcoded)

`assets/data/blueprint_recipes.json`:
```json
{
  "recipes": [
    {
      "id": "super_veggie",
      "name": "Super Veggie",
      "description": "The foundation meal of the Blueprint protocol - nutrient-dense vegetables and legumes",
      "imageUrl": "assets/images/recipes/super_veggie.jpg",
      "prepTimeMinutes": 15,
      "cookTimeMinutes": 30,
      "servings": 2,
      "ingredients": [
        {"name": "Black Lentils", "amount": 150, "unit": "g"},
        {"name": "Broccoli", "amount": 200, "unit": "g"},
        {"name": "Cauliflower", "amount": 150, "unit": "g"},
        {"name": "Mushrooms", "amount": 100, "unit": "g"},
        {"name": "Garlic", "amount": 3, "unit": "cloves"},
        {"name": "Ginger", "amount": 1, "unit": "tbsp", "notes": "minced"},
        {"name": "Cumin", "amount": 1, "unit": "tsp"},
        {"name": "Apple Cider Vinegar", "amount": 1, "unit": "tbsp"}
      ],
      "instructions": [
        "Cook black lentils according to package directions",
        "Steam broccoli and cauliflower until tender-crisp",
        "Sauté mushrooms with garlic and ginger",
        "Combine all vegetables with cooked lentils",
        "Season with cumin and apple cider vinegar"
      ],
      "nutrition": {
        "calories": 380,
        "protein": 26,
        "carbs": 64,
        "fat": 7,
        "fiber": 18
      },
      "dietaryTags": ["vegan", "gluten-free", "high-fiber"],
      "allergens": [],
      "longevityRationale": "High fiber promotes gut health and satiety. Sulforaphane from cruciferous vegetables activates Nrf2 pathway."
    },
    {
      "id": "nutty_pudding",
      "name": "Nutty Pudding",
      "description": "Nutrient-dense breakfast with healthy fats and plant protein",
      "imageUrl": "assets/images/recipes/nutty_pudding.jpg",
      "prepTimeMinutes": 10,
      "cookTimeMinutes": 0,
      "servings": 1,
      "ingredients": [
        {"name": "Macadamia Nuts", "amount": 30, "unit": "g"},
        {"name": "Walnuts", "amount": 30, "unit": "g"},
        {"name": "Mixed Berries", "amount": 100, "unit": "g"},
        {"name": "Pea Protein Powder", "amount": 25, "unit": "g"},
        {"name": "Unsweetened Cocoa", "amount": 1, "unit": "tbsp"},
        {"name": "Ground Flaxseed", "amount": 1, "unit": "tbsp"},
        {"name": "Sunflower Lecithin", "amount": 1, "unit": "tbsp"},
        {"name": "Ceylon Cinnamon", "amount": 0.5, "unit": "tsp"}
      ],
      "instructions": [
        "Blend nuts until coarsely ground",
        "Add berries and protein powder",
        "Mix in cocoa, flaxseed, and lecithin",
        "Top with cinnamon",
        "Add water to desired consistency"
      ],
      "nutrition": {
        "calories": 430,
        "protein": 20,
        "carbs": 30,
        "fat": 32,
        "fiber": 10
      },
      "dietaryTags": ["vegan", "gluten-free", "high-fat"],
      "allergens": ["tree-nuts"],
      "longevityRationale": "Omega-3s from walnuts support brain health. Polyphenols from berries and cocoa provide antioxidant protection."
    },
    {
      "id": "evoo_shot",
      "name": "EVOO Shot",
      "description": "Pure extra virgin olive oil for heart-healthy fats",
      "imageUrl": "assets/images/recipes/evoo_shot.jpg",
      "prepTimeMinutes": 1,
      "cookTimeMinutes": 0,
      "servings": 1,
      "ingredients": [
        {"name": "Extra Virgin Olive Oil", "amount": 3, "unit": "tbsp"}
      ],
      "instructions": [
        "Pour 3 tablespoons of high-quality EVOO",
        "Consume directly or mix with lemon juice"
      ],
      "nutrition": {
        "calories": 370,
        "protein": 0,
        "carbs": 0,
        "fat": 42,
        "fiber": 0
      },
      "dietaryTags": ["vegan", "keto", "gluten-free"],
      "allergens": [],
      "longevityRationale": "Oleic acid and polyphenols in EVOO reduce inflammation and support cardiovascular health."
    }
  ]
}
```

---

## API Error Handling

```dart
enum ApiError {
  networkError,
  rateLimited,
  notFound,
  serverError,
  parseError,
}

class ApiResult<T> {
  final T? data;
  final ApiError? error;
  final String? message;
  
  ApiResult.success(this.data) : error = null, message = null;
  ApiResult.failure(this.error, [this.message]) : data = null;
  
  bool get isSuccess => data != null;
}
```

### Retry Strategy

```dart
Future<ApiResult<T>> withRetry<T>(
  Future<T> Function() apiCall, {
  int maxRetries = 3,
  Duration delay = const Duration(seconds: 1),
}) async {
  int attempts = 0;
  
  while (attempts < maxRetries) {
    try {
      final result = await apiCall();
      return ApiResult.success(result);
    } on DioException catch (e) {
      attempts++;
      
      if (e.response?.statusCode == 429) {
        // Rate limited - wait longer
        await Future.delayed(delay * attempts * 2);
      } else if (attempts < maxRetries) {
        await Future.delayed(delay * attempts);
      } else {
        return ApiResult.failure(ApiError.networkError, e.message);
      }
    }
  }
  
  return ApiResult.failure(ApiError.networkError);
}
```

---

## Caching Strategy

### Food Search Results
- Cache search results for 24 hours
- Max 100 cached searches
- LRU eviction

### Barcode Lookups
- Cache indefinitely (products don't change often)
- Max 500 cached products

```dart
class FoodCache {
  final _searchCache = LruCache<String, List<FoodItem>>(maxSize: 100);
  final _barcodeCache = LruCache<String, FoodItem>(maxSize: 500);
  
  void cacheSearch(String query, List<FoodItem> results) {
    _searchCache.put(query.toLowerCase(), results);
  }
  
  List<FoodItem>? getCachedSearch(String query) {
    return _searchCache.get(query.toLowerCase());
  }
  
  void cacheBarcode(String barcode, FoodItem item) {
    _barcodeCache.put(barcode, item);
  }
  
  FoodItem? getCachedBarcode(String barcode) {
    return _barcodeCache.get(barcode);
  }
}
```
