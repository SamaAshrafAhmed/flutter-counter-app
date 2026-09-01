import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterState> {
  new() : super(CounterInitialState());
  int value = 0;
  void increment() {
    value++;
    emitCounter(false);
  }

  void decrement() {
    value--;
    emitCounter(true);
  }

  void emitCounter(bool reachedNegative) {
    if (value == 10) {
      emit(CounterReached(msg: "Your Counter Reached 10!"));
    } else if (value == -10) {
      emit(CounterReached(msg: "Your Counter Reached -10!"));
    } else if (value == -1) {
      reachedNegative
          ? emit(CounterReached(msg: "Your Counter Reached Negative numbers!"))
          : emit(CounterUpdated());
    } else {
      emit(CounterUpdated());
    }
  }
}
