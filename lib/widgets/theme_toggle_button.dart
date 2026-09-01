
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key, required this.themeCubit});

  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: themeCubit.toggleTheme,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Text(state is DarkThemeState ? '☀️' : '🌙');
        },
      ),
    );
  }
}
