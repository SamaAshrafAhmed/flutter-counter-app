abstract class CounterState {
  const CounterState();
}

class CounterInitialState extends CounterState {
  const CounterInitialState();
}

class CounterUpdated extends CounterState {
  const CounterUpdated();
}

class CounterReached extends CounterState {
  const CounterReached({required this.message});

  final String message;
}
