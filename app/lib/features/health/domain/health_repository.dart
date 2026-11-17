import 'health_status.dart';

abstract class HealthRepository {
  /// Throws [ApiFailure] when the API cannot be reached or answers badly.
  Future<HealthStatus> getHealth();
}
