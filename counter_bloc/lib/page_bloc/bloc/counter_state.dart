part of 'counter_bloc.dart';

//tudo aqui é atualizado e é imutável
abstract class CounterState {
  final int counter;
  const CounterState(this.counter);
}

//estado inicial
class CounterStateInitial extends CounterState {
  CounterStateInitial() : super(0);
}

class CounterStateData extends CounterState {
  CounterStateData(int counter) : super(counter);
}
