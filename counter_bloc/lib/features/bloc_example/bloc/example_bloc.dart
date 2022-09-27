import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleAddNameEvent>(_addName);
    on<ExampleRemoveNameEvent>(_removeName);
  }

  FutureOr<void> _removeName(
      ExampleRemoveNameEvent event, Emitter<ExampleState> emit) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names];
      names.retainWhere((element) => element != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _addName(
      ExampleAddNameEvent event, Emitter<ExampleState> emit) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final newName = event.name;
      final names = [...stateExample.names, newName];
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findNames(
      ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
    final names = [
      'Rodrigo Rahman',
      'Academia do Flutter',
      'Flutter',
      'Dart',
      'Flutter Bloc'
    ];
    emit(ExampleStateData(names: names));
  }
}
