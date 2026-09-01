import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';
import 'package:flutter_counter_app/widgets/update_counter_button.dart';

class CounterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    var counterBloc = context.read<CounterCubit>();
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
                  UpdateCounterButton(
                    text: "+",
                    color: Colors.green,
                    onPressed: () {
                      counterBloc.increment();
                    },
                  ),
                  UpdateCounterButton(
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
