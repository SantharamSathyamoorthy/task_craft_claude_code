import 'package:dio/dio.dart';

import '../config/app_config.dart';

/// Builds the single configured Dio instance shared by data sources.
Dio createDioClient({String? baseUrl}) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl ?? AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}
