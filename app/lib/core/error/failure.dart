/// Error type the rest of the app sees. Data layer converts library errors
/// (e.g. DioException) into this, so domain and presentation never import Dio.
class ApiFailure implements Exception {
  const ApiFailure(this.message);

  final String message;

  @override
  String toString() => 'ApiFailure: $message';
}
