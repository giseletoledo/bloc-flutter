part of 'counter_cubit.dart';

//tudo aqui é atualizado e é imutável
abstract class CounterState {
  final int counter;
  const CounterState(this.counter);

  //verifica se é o mesmo objeto counter state, se foi modificado, compara com o anterior
  @override
  bool operator ==(Object other) {
    //sem implementação - return super == other;
    if (identical(this, other)) return true;
    return other is CounterState && other.counter == counter;
  }

  @override
  int get hashCode => counter.hashCode;
}

//estado inicial
class CounterStateInitial extends CounterState {
  CounterStateInitial() : super(0);
}

class CounterStateData extends CounterState {
  CounterStateData(int counter) : super(counter);
}
