import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/cubits/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const LightThemeState());

  // The theme toggles between the app's light and dark visual modes.
  void toggleTheme() {
    if (state is LightThemeState) {
      emit(const DarkThemeState());
      return;
    }

    emit(const LightThemeState());
  }
}
