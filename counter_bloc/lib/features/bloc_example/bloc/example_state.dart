part of 'example_bloc.dart';

//immutable está importada na classe example_bloc.dart - import 'package:flutter/foundation.dart';
@immutable
abstract class ExampleState {}

class ExampleStateInitial extends ExampleState {}

class ExampleStateData extends ExampleState {
  final List<String> names;

  ExampleStateData({required this.names});
}
