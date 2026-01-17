import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'auth_service.dart';

/// Result wrapper for storage operations
class StorageResult<T> {
  final T? data;
  final StorageError? error;

  const StorageResult.success(this.data) : error = null;
  const StorageResult.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

/// Error types for storage operations
enum StorageError {
  notAuthenticated,
  notFound,
  permissionDenied,
  cancelled,
  unknown,
}

/// Upload progress callback
typedef UploadProgressCallback = void Function(double progress);

/// Service for Firebase Cloud Storage
@lazySingleton
class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthService _authService;

  StorageService(this._authService);

  /// Get the user's storage path prefix
  String? get _userPath {
    final user = _authService.currentUser;
    if (user == null) return null;
    return 'users/${user.uid}';
  }

  /// Upload a file
  Future<StorageResult<String>> uploadFile({
    required File file,
    required String path,
    String? contentType,
    UploadProgressCallback? onProgress,
  }) async {
    try {
      final userPath = _userPath;
      if (userPath == null) {
        return const StorageResult.failure(StorageError.notAuthenticated);
      }

      final fullPath = '$userPath/$path';
      final ref = _storage.ref(fullPath);

      final metadata = contentType != null
          ? SettableMetadata(contentType: contentType)
          : null;

      final uploadTask = ref.putFile(file, metadata);

      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      await uploadTask;
      final downloadUrl = await ref.getDownloadURL();

      return StorageResult.success(downloadUrl);
    } on FirebaseException catch (e) {
      return StorageResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const StorageResult.failure(StorageError.unknown);
    }
  }

  /// Upload bytes data
  Future<StorageResult<String>> uploadBytes({
    required Uint8List bytes,
    required String path,
    String? contentType,
    UploadProgressCallback? onProgress,
  }) async {
    try {
      final userPath = _userPath;
      if (userPath == null) {
        return const StorageResult.failure(StorageError.notAuthenticated);
      }

      final fullPath = '$userPath/$path';
      final ref = _storage.ref(fullPath);

      final metadata = contentType != null
          ? SettableMetadata(contentType: contentType)
          : null;

      final uploadTask = ref.putData(bytes, metadata);

      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      await uploadTask;
      final downloadUrl = await ref.getDownloadURL();

      return StorageResult.success(downloadUrl);
    } on FirebaseException catch (e) {
      return StorageResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const StorageResult.failure(StorageError.unknown);
    }
  }

  /// Upload profile picture
  Future<StorageResult<String>> uploadProfilePicture(File file) async {
    final extension = file.path.split('.').last;
    return uploadFile(
      file: file,
      path: 'profile/avatar.$extension',
      contentType: 'image/$extension',
    );
  }

  /// Delete a file
  Future<StorageResult<void>> deleteFile(String path) async {
    try {
      final userPath = _userPath;
      if (userPath == null) {
        return const StorageResult.failure(StorageError.notAuthenticated);
      }

      final fullPath = '$userPath/$path';
      final ref = _storage.ref(fullPath);

      await ref.delete();
      return const StorageResult.success(null);
    } on FirebaseException catch (e) {
      return StorageResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const StorageResult.failure(StorageError.unknown);
    }
  }

  /// Get download URL for a file
  Future<StorageResult<String>> getDownloadUrl(String path) async {
    try {
      final userPath = _userPath;
      if (userPath == null) {
        return const StorageResult.failure(StorageError.notAuthenticated);
      }

      final fullPath = '$userPath/$path';
      final ref = _storage.ref(fullPath);

      final url = await ref.getDownloadURL();
      return StorageResult.success(url);
    } on FirebaseException catch (e) {
      return StorageResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const StorageResult.failure(StorageError.unknown);
    }
  }

  /// Delete all user data (for account deletion)
  Future<StorageResult<void>> deleteAllUserData() async {
    try {
      final userPath = _userPath;
      if (userPath == null) {
        return const StorageResult.failure(StorageError.notAuthenticated);
      }

      final ref = _storage.ref(userPath);
      final listResult = await ref.listAll();

      for (final item in listResult.items) {
        await item.delete();
      }

      for (final prefix in listResult.prefixes) {
        await _deleteFolder(prefix);
      }

      return const StorageResult.success(null);
    } on FirebaseException catch (e) {
      return StorageResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const StorageResult.failure(StorageError.unknown);
    }
  }

  Future<void> _deleteFolder(Reference ref) async {
    final listResult = await ref.listAll();

    for (final item in listResult.items) {
      await item.delete();
    }

    for (final prefix in listResult.prefixes) {
      await _deleteFolder(prefix);
    }
  }

  StorageError _mapFirebaseError(FirebaseException e) {
    switch (e.code) {
      case 'object-not-found':
        return StorageError.notFound;
      case 'unauthorized':
        return StorageError.permissionDenied;
      case 'canceled':
        return StorageError.cancelled;
      default:
        return StorageError.unknown;
    }
  }
}
