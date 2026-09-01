import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';

class CounterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    var counterBloc = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  counterBloc.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
              listener: (context, state) {
                if (state is CounterReached) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.msg)));
                  return;
                }
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UpdateValueButton(
                    text: "+",
                    color: Colors.green,
                    onPressed: () {
                      counterBloc.increment();
                    },
                  ),
                  UpdateValueButton(
                    text: "-",
                    color: Colors.red,
                    onPressed: () {
                      counterBloc.decrement();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateValueButton extends StatelessWidget {
  const new({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });
  final String text;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(50, 50),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
