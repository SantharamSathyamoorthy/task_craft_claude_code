import 'package:dio/dio.dart';

class HealthRemoteDataSource {
  HealthRemoteDataSource(this._dio);

  final Dio _dio;

  /// Calls GET /health and returns the `status` field (e.g. "ok").
  Future<String> fetchStatus() async {
    final response = await _dio.get<Map<String, dynamic>>('/health');
    return response.data?['status'] as String? ?? '';
  }
}
