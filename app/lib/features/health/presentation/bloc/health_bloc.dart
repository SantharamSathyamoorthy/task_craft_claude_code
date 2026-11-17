import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/health_repository.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc(this._repository) : super(const HealthInitial()) {
    on<HealthCheckRequested>(_onCheckRequested);
  }

  final HealthRepository _repository;

  Future<void> _onCheckRequested(
    HealthCheckRequested event,
    Emitter<HealthState> emit,
  ) async {
    emit(const HealthLoading());
    try {
      final status = await _repository.getHealth();
      emit(
        status.isOk
            ? const HealthSuccess()
            : const HealthFailure('Unexpected status'),
      );
    } on ApiFailure catch (e) {
      emit(HealthFailure(e.message));
    }
  }
}
