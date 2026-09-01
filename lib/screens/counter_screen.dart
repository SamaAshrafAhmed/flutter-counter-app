import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_states.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_state.dart';
import 'package:flutter_counter_app/widgets/update_counter_button.dart';

class CounterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    CounterCubit counterBloc = context.read<CounterCubit>();
    ThemeCubit themeBloc = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Counter App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [ThemeToggleButton(themeBloc: themeBloc)],
      ),
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(state.msg),
                        ),
                      );
                    },
                  );
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

class ThemeToggleButton extends StatelessWidget {
  const new({super.key, required this.themeBloc});

  final ThemeCubit themeBloc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        themeBloc.toggleTheme();
      },
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is DarkThemeState) {
            return Text("☀️");
          }
          return Text("🌙");
        },
      ),
    );
  }
}
