part of 'health_bloc.dart';

sealed class HealthState extends Equatable {
  const HealthState();

  @override
  List<Object?> get props => [];
}

final class HealthInitial extends HealthState {
  const HealthInitial();
}

final class HealthLoading extends HealthState {
  const HealthLoading();
}

final class HealthSuccess extends HealthState {
  const HealthSuccess();
}

final class HealthFailure extends HealthState {
  const HealthFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
