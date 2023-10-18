// import 'package:bloc/bloc.dart';
import 'package:book_store/constans.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Theme/themes_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemesState themesState) {
    if (themesState == ThemesState.Initial) {
      if (sharedPreferences!.getString('theme') != null) {
        if (sharedPreferences!.getString('theme') == 'L') {
          emit(AppLightTheme());
        } else {
          emit(AppDarkTheme());
        }
      }
      emit(AppThemeInitial());
    } else if (themesState == ThemesState.Light) {
      sharedPreferences!.setString('theme', 'L');
      emit(AppLightTheme());
    } else if (themesState == ThemesState.Dark) {
      sharedPreferences!.setString('theme', 'D');
      emit(AppDarkTheme());
    }
  }
}
