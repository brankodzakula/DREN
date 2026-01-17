import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'auth_service.dart';

/// Result wrapper for Firestore operations
class FirestoreResult<T> {
  final T? data;
  final FirestoreError? error;

  const FirestoreResult.success(this.data) : error = null;
  const FirestoreResult.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

/// Error types for Firestore operations
enum FirestoreError {
  notAuthenticated,
  notFound,
  permissionDenied,
  networkError,
  unknown,
}

/// Firestore collection paths
abstract class FirestoreCollections {
  static const users = 'users';
  static const userProfiles = 'profiles';
  static const meals = 'meals';
  static const workouts = 'workouts';
  static const sleepSessions = 'sleepSessions';
  static const dailyProgress = 'dailyProgress';
  static const recipes = 'recipes';
}

/// Service for Firestore database operations
@lazySingleton
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService;

  FirestoreService(this._authService);

  /// Get current user's document reference
  DocumentReference<Map<String, dynamic>>? get _userDoc {
    final user = _authService.currentUser;
    if (user == null) return null;
    return _firestore.collection(FirestoreCollections.users).doc(user.uid);
  }

  /// Get a subcollection for the current user
  CollectionReference<Map<String, dynamic>>? _userCollection(String name) {
    final userDoc = _userDoc;
    if (userDoc == null) return null;
    return userDoc.collection(name);
  }

  // ============ User Profile ============

  /// Create or update user profile
  Future<FirestoreResult<void>> saveUserProfile(
      Map<String, dynamic> data) async {
    try {
      final userDoc = _userDoc;
      if (userDoc == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      await userDoc.set({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return const FirestoreResult.success(null);
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Get user profile
  Future<FirestoreResult<Map<String, dynamic>>> getUserProfile() async {
    try {
      final userDoc = _userDoc;
      if (userDoc == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      final snapshot = await userDoc.get();
      if (!snapshot.exists) {
        return const FirestoreResult.failure(FirestoreError.notFound);
      }

      return FirestoreResult.success(snapshot.data());
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Stream user profile changes
  Stream<Map<String, dynamic>?> streamUserProfile() {
    final userDoc = _userDoc;
    if (userDoc == null) return Stream.value(null);

    return userDoc.snapshots().map((snapshot) => snapshot.data());
  }

  // ============ Generic CRUD Operations ============

  /// Add a document to a user's subcollection
  Future<FirestoreResult<String>> addDocument({
    required String collection,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      final collectionRef = _userCollection(collection);
      if (collectionRef == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      final docData = {
        ...data,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (documentId != null) {
        await collectionRef.doc(documentId).set(docData);
        return FirestoreResult.success(documentId);
      } else {
        final docRef = await collectionRef.add(docData);
        return FirestoreResult.success(docRef.id);
      }
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Update a document in a user's subcollection
  Future<FirestoreResult<void>> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final collectionRef = _userCollection(collection);
      if (collectionRef == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      await collectionRef.doc(documentId).update({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return const FirestoreResult.success(null);
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Delete a document from a user's subcollection
  Future<FirestoreResult<void>> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      final collectionRef = _userCollection(collection);
      if (collectionRef == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      await collectionRef.doc(documentId).delete();
      return const FirestoreResult.success(null);
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Get a single document from a user's subcollection
  Future<FirestoreResult<Map<String, dynamic>>> getDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      final collectionRef = _userCollection(collection);
      if (collectionRef == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      final snapshot = await collectionRef.doc(documentId).get();
      if (!snapshot.exists) {
        return const FirestoreResult.failure(FirestoreError.notFound);
      }

      return FirestoreResult.success({
        'id': snapshot.id,
        ...snapshot.data()!,
      });
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Query documents from a user's subcollection
  Future<FirestoreResult<List<Map<String, dynamic>>>> queryDocuments({
    required String collection,
    List<QueryFilter>? filters,
    String? orderBy,
    bool descending = false,
    int? limit,
  }) async {
    try {
      final collectionRef = _userCollection(collection);
      if (collectionRef == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      Query<Map<String, dynamic>> query = collectionRef;

      // Apply filters
      if (filters != null) {
        for (final filter in filters) {
          query = _applyFilter(query, filter);
        }
      }

      // Apply ordering
      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending);
      }

      // Apply limit
      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();
      final documents = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();

      return FirestoreResult.success(documents);
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  /// Stream documents from a user's subcollection
  Stream<List<Map<String, dynamic>>> streamDocuments({
    required String collection,
    List<QueryFilter>? filters,
    String? orderBy,
    bool descending = false,
    int? limit,
  }) {
    final collectionRef = _userCollection(collection);
    if (collectionRef == null) return Stream.value([]);

    Query<Map<String, dynamic>> query = collectionRef;

    if (filters != null) {
      for (final filter in filters) {
        query = _applyFilter(query, filter);
      }
    }

    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
    });
  }

  // ============ Batch Operations ============

  /// Write multiple documents in a batch
  Future<FirestoreResult<void>> batchWrite(
      List<BatchOperation> operations) async {
    try {
      final batch = _firestore.batch();
      final userDoc = _userDoc;

      if (userDoc == null) {
        return const FirestoreResult.failure(FirestoreError.notAuthenticated);
      }

      for (final operation in operations) {
        final docRef = userDoc.collection(operation.collection).doc(
              operation.documentId,
            );

        switch (operation.type) {
          case BatchOperationType.set:
            batch.set(docRef, {
              ...operation.data!,
              'updatedAt': FieldValue.serverTimestamp(),
            }, SetOptions(merge: true));
            break;
          case BatchOperationType.update:
            batch.update(docRef, {
              ...operation.data!,
              'updatedAt': FieldValue.serverTimestamp(),
            });
            break;
          case BatchOperationType.delete:
            batch.delete(docRef);
            break;
        }
      }

      await batch.commit();
      return const FirestoreResult.success(null);
    } on FirebaseException catch (e) {
      return FirestoreResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const FirestoreResult.failure(FirestoreError.unknown);
    }
  }

  // ============ Date-based Queries ============

  /// Get documents for a specific date
  Future<FirestoreResult<List<Map<String, dynamic>>>> getDocumentsForDate({
    required String collection,
    required DateTime date,
    String dateField = 'date',
  }) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return queryDocuments(
      collection: collection,
      filters: [
        QueryFilter(
          field: dateField,
          operator: FilterOperator.greaterThanOrEqual,
          value: Timestamp.fromDate(startOfDay),
        ),
        QueryFilter(
          field: dateField,
          operator: FilterOperator.lessThan,
          value: Timestamp.fromDate(endOfDay),
        ),
      ],
      orderBy: dateField,
      descending: true,
    );
  }

  /// Get documents for a date range
  Future<FirestoreResult<List<Map<String, dynamic>>>> getDocumentsForDateRange({
    required String collection,
    required DateTime startDate,
    required DateTime endDate,
    String dateField = 'date',
  }) async {
    return queryDocuments(
      collection: collection,
      filters: [
        QueryFilter(
          field: dateField,
          operator: FilterOperator.greaterThanOrEqual,
          value: Timestamp.fromDate(startDate),
        ),
        QueryFilter(
          field: dateField,
          operator: FilterOperator.lessThanOrEqual,
          value: Timestamp.fromDate(endDate),
        ),
      ],
      orderBy: dateField,
      descending: true,
    );
  }

  // ============ Helpers ============

  Query<Map<String, dynamic>> _applyFilter(
    Query<Map<String, dynamic>> query,
    QueryFilter filter,
  ) {
    switch (filter.operator) {
      case FilterOperator.equals:
        return query.where(filter.field, isEqualTo: filter.value);
      case FilterOperator.notEquals:
        return query.where(filter.field, isNotEqualTo: filter.value);
      case FilterOperator.lessThan:
        return query.where(filter.field, isLessThan: filter.value);
      case FilterOperator.lessThanOrEqual:
        return query.where(filter.field, isLessThanOrEqualTo: filter.value);
      case FilterOperator.greaterThan:
        return query.where(filter.field, isGreaterThan: filter.value);
      case FilterOperator.greaterThanOrEqual:
        return query.where(filter.field, isGreaterThanOrEqualTo: filter.value);
      case FilterOperator.arrayContains:
        return query.where(filter.field, arrayContains: filter.value);
      case FilterOperator.inArray:
        return query.where(filter.field, whereIn: filter.value as List);
    }
  }

  FirestoreError _mapFirebaseError(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirestoreError.permissionDenied;
      case 'not-found':
        return FirestoreError.notFound;
      case 'unavailable':
        return FirestoreError.networkError;
      default:
        return FirestoreError.unknown;
    }
  }
}

/// Filter for Firestore queries
class QueryFilter {
  final String field;
  final FilterOperator operator;
  final dynamic value;

  const QueryFilter({
    required this.field,
    required this.operator,
    required this.value,
  });
}

/// Filter operators
enum FilterOperator {
  equals,
  notEquals,
  lessThan,
  lessThanOrEqual,
  greaterThan,
  greaterThanOrEqual,
  arrayContains,
  inArray,
}

/// Batch operation for bulk writes
class BatchOperation {
  final BatchOperationType type;
  final String collection;
  final String documentId;
  final Map<String, dynamic>? data;

  const BatchOperation({
    required this.type,
    required this.collection,
    required this.documentId,
    this.data,
  });

  factory BatchOperation.set({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) =>
      BatchOperation(
        type: BatchOperationType.set,
        collection: collection,
        documentId: documentId,
        data: data,
      );

  factory BatchOperation.update({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) =>
      BatchOperation(
        type: BatchOperationType.update,
        collection: collection,
        documentId: documentId,
        data: data,
      );

  factory BatchOperation.delete({
    required String collection,
    required String documentId,
  }) =>
      BatchOperation(
        type: BatchOperationType.delete,
        collection: collection,
        documentId: documentId,
      );
}

enum BatchOperationType { set, update, delete }
