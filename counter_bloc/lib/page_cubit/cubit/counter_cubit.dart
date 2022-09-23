import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterStateInitial());

  void increment() {
    //sempre mandar uma nova instância, não funciona state++
    emit(CounterStateData(state.counter + 1));
  }

  void decrement() {
    emit(CounterStateData(state.counter - 1));
  }
}
