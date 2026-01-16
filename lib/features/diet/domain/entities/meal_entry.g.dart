// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealEntryImpl _$$MealEntryImplFromJson(Map<String, dynamic> json) =>
    _$MealEntryImpl(
      id: json['id'] as String,
      oderId: json['oderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      mealType: json['mealType'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCalories: (json['totalCalories'] as num).toInt(),
      totalProtein: (json['totalProtein'] as num).toDouble(),
      totalCarbs: (json['totalCarbs'] as num).toDouble(),
      totalFat: (json['totalFat'] as num).toDouble(),
      source: json['source'] as String,
    );

Map<String, dynamic> _$$MealEntryImplToJson(_$MealEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oderId': instance.oderId,
      'timestamp': instance.timestamp.toIso8601String(),
      'mealType': instance.mealType,
      'items': instance.items,
      'totalCalories': instance.totalCalories,
      'totalProtein': instance.totalProtein,
      'totalCarbs': instance.totalCarbs,
      'totalFat': instance.totalFat,
      'source': instance.source,
    };
