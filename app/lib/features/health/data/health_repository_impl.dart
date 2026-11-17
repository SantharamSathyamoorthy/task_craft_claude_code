import 'package:dio/dio.dart';

import '../../../core/error/failure.dart';
import '../domain/health_repository.dart';
import '../domain/health_status.dart';
import 'health_remote_data_source.dart';

class HealthRepositoryImpl implements HealthRepository {
  HealthRepositoryImpl(this._remote);

  final HealthRemoteDataSource _remote;

  @override
  Future<HealthStatus> getHealth() async {
    try {
      final status = await _remote.fetchStatus();
      return HealthStatus(isOk: status == 'ok');
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Request failed');
    }
  }
}
