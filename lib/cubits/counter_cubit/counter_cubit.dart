import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitialState());

  int value = 0;

  // Increase the count and then decide which state should be emitted.
  void increment() {
    value++;
    _emitCounterState(isNegativeStep: false);
  }

  // Decrease the count and then decide which state should be emitted.
  void decrement() {
    value--;
    _emitCounterState(isNegativeStep: true);
  }

  // Keep milestone checks in one place so every action follows the same rules.
  void _emitCounterState({required bool isNegativeStep}) {
    // Positive milestone reached.
    if (value == 10) {
      emit(const CounterReached(message: 'Your counter reached 10!'));
      return;
    }

    // Negative milestone reached.
    if (value == -10) {
      emit(const CounterReached(message: 'Your counter reached -10!'));
      return;
    }

    // Trigger a warning when the counter enters negative values.
    if (value == -1 && isNegativeStep) {
      emit(
        const CounterReached(message: 'Your counter reached negative numbers!'),
      );
      return;
    }

    // Default state for all ordinary updates.
    emit(CounterUpdated());
  }
}
