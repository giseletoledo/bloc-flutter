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
              listenWhen: (previous, current) {
                if (previous is ExampleStateInitial &&
                    current is ExampleStateData) {
                  if (current.names.length > 3) {
                    return true;
                  }
                }
                return false;
              },
              listener: (context, state) {
                print("Estado alterado para ${state.runtimeType}");
              },
              builder: (_, state) {
                if (state is ExampleStateData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                //add - método stream
                                context
                                    .read<ExampleBloc>()
                                    .add(ExampleAddNameEvent(name: 'Provider'));
                              },
                              icon: const Icon(Icons.add),
                              label: const Text(''),
                            ),
                          ],
                        ),
                        Text("Total de nomes é ${state.names.length}"),
                      ],
                    ),
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
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(name),
                                TextButton.icon(
                                  onPressed: () {
                                    //add - método stream
                                    context.read<ExampleBloc>().add(
                                        ExampleRemoveNameEvent(name: name));
                                  },
                                  icon: const Icon(Icons.delete_rounded),
                                  label: const Text(''),
                                ),
                              ],
                            ),
                          ],
                        ),
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
