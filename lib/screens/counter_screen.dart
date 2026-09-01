import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_state.dart';
import 'package:flutter_counter_app/widgets/theme_toggle_button.dart';
import 'package:flutter_counter_app/widgets/update_counter_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter App',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [ThemeToggleButton(themeCubit: themeCubit)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is CounterReached) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Counter milestone'),
                        content: Text(state.message),
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  counterCubit.value.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UpdateCounterButton(
                    text: '+',
                    color: Colors.green,
                    onPressed: () => counterCubit.increment(),
                  ),
                  UpdateCounterButton(
                    text: '-',
                    color: Colors.red,
                    onPressed: () => counterCubit.decrement(),
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
