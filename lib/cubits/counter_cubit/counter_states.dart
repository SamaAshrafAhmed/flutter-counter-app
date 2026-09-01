class CounterState {}

class CounterInitialState extends CounterState {}

class CounterUpdated extends CounterState {
  final int value;

  new({required this.value});
}

class CounterReached extends CounterState {
  final int value;
  final String msg;
  new({required this.value, required this.msg});
}
