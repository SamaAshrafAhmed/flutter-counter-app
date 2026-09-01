class CounterState {}

class CounterInitialState extends CounterState {}

class CounterUpdated extends CounterState {

}

class CounterReached extends CounterState {
  final String msg;
  new({ required this.msg});
}
