import 'package:bloc/bloc.dart';

/* o part serve como se tivesse as outras classes nesse mesmo arquivo
  dentro de cada uma usar - part of 'counter_bloc.dart';
  abstract class CounterEvent {}
  abstract class CounterState {}
*/
part 'counter_event.dart';
part 'counter_state.dart';

//Passar o estado inicial no construtor
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterStateInitial()) {
    // passando função anônima - on<CounterIncrement>((event, emit) {});
    //Parâmetro passado
    // on<CounterIncrement>(CounterIncrement event, Emitter<CounterState> emit);
    on<CounterIncrement>(_increment);
    on<CounterDecrement>(_decrement);
  }

//métodos de aumentar e diminuir o contador
  void _increment(CounterIncrement event, Emitter<CounterState> emit) {
    //print('increment');
    //passa o estado atual com state e aumenta 1
    emit(CounterStateData(state.counter + 1));
  }

  void _decrement(CounterDecrement event, Emitter<CounterState> emit) {
    //print('decrement');
    //passa o estado atual com state e diminui 1
    emit(CounterStateData(state.counter - 1));
  }
}
