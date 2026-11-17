import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/dio_client.dart';
import 'features/health/data/health_remote_data_source.dart';
import 'features/health/data/health_repository_impl.dart';
import 'features/health/domain/health_repository.dart';
import 'features/health/presentation/bloc/health_bloc.dart';
import 'features/health/presentation/health_page.dart';

class TaskcraftApp extends StatelessWidget {
  const TaskcraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<HealthRepository>(
      create: (_) =>
          HealthRepositoryImpl(HealthRemoteDataSource(createDioClient())),
      child: MaterialApp(
        title: 'taskcraft',
        theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
        home: BlocProvider(
          create: (context) =>
              HealthBloc(context.read<HealthRepository>())
                ..add(const HealthCheckRequested()),
          child: const HealthPage(),
        ),
      ),
    );
  }
}
