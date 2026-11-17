import 'package:flutter/foundation.dart';

/// Base URL of the Go API.
///
/// Override at build time: `flutter run --dart-define=API_BASE_URL=http://host:8080`.
/// Otherwise: an Android emulator reaches the host machine at 10.0.2.2,
/// everything else (iOS simulator, desktop, web) uses localhost.
class AppConfig {
  const AppConfig._();

  static const String _override = String.fromEnvironment('API_BASE_URL');

  static String get apiBaseUrl {
    if (_override.isNotEmpty) return _override;
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:8080';
    }
    return 'http://localhost:8080';
  }
}
