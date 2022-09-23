import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/example_bloc.dart';

class ExampleBlocPage extends StatelessWidget {
  const ExampleBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: BlocListener<ExampleBloc, ExampleState>(
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A quantidade de nomes é ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            BlocConsumer<ExampleBloc, ExampleState>(
              listener: (context, state) {
                print("Estado alterado para ${state.runtimeType}");
              },
              builder: (_, state) {
                if (state is ExampleStateData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Total de nomes é ${state.names.length}"),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) {
                if (state is ExampleStateInitial) {
                  return true;
                }
                return false;
              },
              builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
              selector: (state) {
                if (state is ExampleStateData) {
                  return state.names;
                }
                return [];
              },
              builder: (context, names) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      final name = names[index];
                      return ListTile(
                        title: Text(name),
                      );
                    },
                  ),
                );
              },
            )
            /*  BlocBuilder<ExampleBloc, ExampleState>(builder: (context, state) {
              if (state is ExampleStateData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.names.length,
                    itemBuilder: (context, index) {
                      final name = state.names[index];
                      return ListTile(
                        title: Text(name),
                      );
                    },
                  ),
                );
              }
              return const Center(child: Text('Nenhum nome cadastrado'));
            }), */
          ],
        ),
      ),
    );
  }
}
