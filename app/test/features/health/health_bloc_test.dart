import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskcraft_app/core/error/failure.dart';
import 'package:taskcraft_app/features/health/domain/health_repository.dart';
import 'package:taskcraft_app/features/health/domain/health_status.dart';
import 'package:taskcraft_app/features/health/presentation/bloc/health_bloc.dart';

class MockHealthRepository extends Mock implements HealthRepository {}

void main() {
  late MockHealthRepository repository;

  setUp(() => repository = MockHealthRepository());

  blocTest<HealthBloc, HealthState>(
    'emits [loading, success] when API is ok',
    setUp: () => when(
      () => repository.getHealth(),
    ).thenAnswer((_) async => const HealthStatus(isOk: true)),
    build: () => HealthBloc(repository),
    act: (bloc) => bloc.add(const HealthCheckRequested()),
    expect: () => [const HealthLoading(), const HealthSuccess()],
  );

  blocTest<HealthBloc, HealthState>(
    'emits [loading, failure] when API is unreachable',
    setUp: () => when(
      () => repository.getHealth(),
    ).thenThrow(const ApiFailure('no connection')),
    build: () => HealthBloc(repository),
    act: (bloc) => bloc.add(const HealthCheckRequested()),
    expect: () => [const HealthLoading(), const HealthFailure('no connection')],
  );

  blocTest<HealthBloc, HealthState>(
    'emits [loading, failure] when status is not ok',
    setUp: () => when(
      () => repository.getHealth(),
    ).thenAnswer((_) async => const HealthStatus(isOk: false)),
    build: () => HealthBloc(repository),
    act: (bloc) => bloc.add(const HealthCheckRequested()),
    expect: () => [
      const HealthLoading(),
      const HealthFailure('Unexpected status'),
    ],
  );
}
