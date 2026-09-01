import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  new() : super(LightThemeState());

  void toggleTheme() {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else if (state is DarkThemeState) {
      emit(LightThemeState());
    }
  }
}
