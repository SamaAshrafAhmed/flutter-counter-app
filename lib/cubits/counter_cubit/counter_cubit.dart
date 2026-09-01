import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitialState());

  int value = 0;

  // A single action updates the current count and then decides which state
  // should be emitted: a regular update or a milestone alert.
  void increment() {
    value++;
    _emitCounterState(isNegativeStep: false);
  }

  void decrement() {
    value--;
    _emitCounterState(isNegativeStep: true);
  }

  void _emitCounterState({required bool isNegativeStep}) {
    if (value == 10) {
      emit(const CounterReached(message: 'Your counter reached 10!'));
      return;
    }

    if (value == -10) {
      emit(const CounterReached(message: 'Your counter reached -10!'));
      return;
    }

    if (value == -1 && isNegativeStep) {
      emit(
        const CounterReached(message: 'Your counter reached negative numbers!'),
      );
      return;
    }

    emit(CounterUpdated());
  }
}
