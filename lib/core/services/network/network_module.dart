import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Module for registering network-related dependencies
@module
abstract class NetworkModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
        ),
      )..interceptors.add(
          LogInterceptor(
            requestBody: false,
            responseBody: false,
            error: true,
          ),
        );
}
