import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterState> {
  new() : super(CounterInitialState());
  int value = 0;
  void increment() {
    value++;
    if (value == 15) {
      emit(CounterReached(value: value, msg: "You counted till 15!"));
    } else {
      emit(CounterUpdated(value: value));
    }
  }

  void decrement() {
    value--;
    if (value == 15) {
      emit(CounterReached(value: value, msg: "You counted till 15!"));
    } else {
      emit(CounterUpdated(value: value));
    }
  }
}
