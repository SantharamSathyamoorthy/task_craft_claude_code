import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/health_bloc.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HealthBloc, HealthState>(
          builder: (context, state) {
            final label = switch (state) {
              HealthInitial() || HealthLoading() => 'Checking API...',
              HealthSuccess() => 'API: ok',
              HealthFailure() => 'API: unreachable',
            };
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 16),
                if (state is HealthFailure)
                  FilledButton(
                    onPressed: () => context.read<HealthBloc>().add(
                      const HealthCheckRequested(),
                    ),
                    child: const Text('Retry'),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
