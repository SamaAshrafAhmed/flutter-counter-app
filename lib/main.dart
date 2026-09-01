import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_state.dart';
import 'package:flutter_counter_app/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => CounterCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state is DarkThemeState
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
