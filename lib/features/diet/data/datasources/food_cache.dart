import 'dart:collection';

import 'package:injectable/injectable.dart';

import '../../domain/entities/food_item.dart';

/// In-memory LRU cache for food search results
/// Reduces API calls for repeated searches
@singleton
class FoodCache {
  final _searchCache = _LruCache<String, _CachedSearch>(maxSize: 100);
  final _barcodeCache = _LruCache<String, FoodItem>(maxSize: 500);

  // Cache expiration time for searches (24 hours)
  static const _searchCacheExpiration = Duration(hours: 24);

  // ============ Search Cache ============

  /// Cache search results for a query
  void cacheSearch(String query, List<FoodItem> results) {
    final normalizedQuery = query.toLowerCase().trim();
    _searchCache.put(
      normalizedQuery,
      _CachedSearch(results: results, cachedAt: DateTime.now()),
    );
  }

  /// Get cached search results for a query
  List<FoodItem>? getCachedSearch(String query) {
    final normalizedQuery = query.toLowerCase().trim();
    final cached = _searchCache.get(normalizedQuery);

    if (cached == null) return null;

    // Check if cache has expired
    if (DateTime.now().difference(cached.cachedAt) > _searchCacheExpiration) {
      _searchCache.remove(normalizedQuery);
      return null;
    }

    return cached.results;
  }

  /// Check if search results are cached
  bool hasSearchCached(String query) {
    return getCachedSearch(query) != null;
  }

  // ============ Barcode Cache ============

  /// Cache a food item by barcode (indefinite cache)
  void cacheBarcode(String barcode, FoodItem item) {
    _barcodeCache.put(barcode, item);
  }

  /// Get cached food item by barcode
  FoodItem? getCachedBarcode(String barcode) {
    return _barcodeCache.get(barcode);
  }

  /// Check if barcode is cached
  bool hasBarcodeCached(String barcode) {
    return _barcodeCache.containsKey(barcode);
  }

  // ============ Cache Management ============

  /// Clear all caches
  void clearAll() {
    _searchCache.clear();
    _barcodeCache.clear();
  }

  /// Clear only search cache
  void clearSearchCache() {
    _searchCache.clear();
  }

  /// Get cache statistics
  CacheStats get stats => CacheStats(
        searchCacheSize: _searchCache.length,
        barcodeCacheSize: _barcodeCache.length,
        searchCacheMaxSize: _searchCache.maxSize,
        barcodeCacheMaxSize: _barcodeCache.maxSize,
      );
}

/// Cached search result with timestamp
class _CachedSearch {
  final List<FoodItem> results;
  final DateTime cachedAt;

  _CachedSearch({required this.results, required this.cachedAt});
}

/// Cache statistics for monitoring
class CacheStats {
  final int searchCacheSize;
  final int barcodeCacheSize;
  final int searchCacheMaxSize;
  final int barcodeCacheMaxSize;

  CacheStats({
    required this.searchCacheSize,
    required this.barcodeCacheSize,
    required this.searchCacheMaxSize,
    required this.barcodeCacheMaxSize,
  });

  double get searchCacheUsage => searchCacheSize / searchCacheMaxSize;
  double get barcodeCacheUsage => barcodeCacheSize / barcodeCacheMaxSize;
}

/// Simple LRU (Least Recently Used) cache implementation
class _LruCache<K, V> {
  final int maxSize;
  final _cache = <K, V>{};

  _LruCache({required this.maxSize});

  /// Get value and mark as recently used
  V? get(K key) {
    if (!_cache.containsKey(key)) return null;

    // Move to end (most recently used)
    final value = _cache.remove(key);
    _cache[key] = value as V;
    return value;
  }

  /// Put value in cache
  void put(K key, V value) {
    // Remove if exists (will be re-added at end)
    _cache.remove(key);

    // Evict oldest if at capacity
    while (_cache.length >= maxSize) {
      _cache.remove(_cache.keys.first);
    }

    _cache[key] = value;
  }

  /// Remove value from cache
  V? remove(K key) {
    return _cache.remove(key);
  }

  /// Check if key exists
  bool containsKey(K key) {
    return _cache.containsKey(key);
  }

  /// Clear all entries
  void clear() {
    _cache.clear();
  }

  /// Current cache size
  int get length => _cache.length;
}
