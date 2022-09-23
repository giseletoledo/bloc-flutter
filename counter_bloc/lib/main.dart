import 'package:counter_bloc/features/bloc_example/example_bloc_page.dart';
import 'package:counter_bloc/page_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/page_bloc/counter_bloc_page.dart';
import 'package:counter_bloc/page_cubit/counter_cubit_page.dart';
import 'package:counter_bloc/page_cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc_example/bloc/example_bloc.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/bloc': (_) => BlocProvider(
              create: (_) => CounterBloc(),
              child: const CounterBlocPage(),
            ),
        '/cubit': (_) => BlocProvider(
            create: (_) => CounterCubit(), child: const CounterCubitPage()),
        '/bloc/example/': (_) => BlocProvider(
              create: (_) => ExampleBloc()
                ..add(
                    ExampleFindNameEvent()), //o add adiciona a lista de nomes, com create: (_) => ExampleBloc() -> usar um widget na home depois do if, ele retorna vazio
              child: const ExampleBlocPage(),
            )
      },
      home: const HomePage(),
    );
  }
}
