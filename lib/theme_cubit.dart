import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pro1/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark : false));

  void toggleTheme(){
    emit(ThemeState(isDark : state.isDark));
  }
}

