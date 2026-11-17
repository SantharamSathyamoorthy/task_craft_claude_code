import 'package:equatable/equatable.dart';

class HealthStatus extends Equatable {
  const HealthStatus({required this.isOk});

  final bool isOk;

  @override
  List<Object?> get props => [isOk];
}
