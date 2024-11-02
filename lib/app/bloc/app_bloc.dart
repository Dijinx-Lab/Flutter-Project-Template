import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_template/constants/enums.dart';
import 'package:mobile_template/models/models.dart';
import 'package:mobile_template/repositories/repositories.dart';
import 'package:mobile_template/theme/theme.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SettingsRepo _settingsRepo = SettingsRepo();

  AppBloc()
      : super(AppInitial(
          AppTheme.light,
          LightColors(),
          DijinxAppThemes.lightTheme,
          '',
        )) {
    on<AppEvent>((event, emit) async {
      AppSettings settings = await _settingsRepo.getAppSettings();

      AppTheme theme = settings.theme;
      String locale = settings.locale;

      if (event is AppThemeChangedEvent) {
        settings.theme = theme = event.theme;
        await _settingsRepo.saveAppSettings(settings);
      }

      if (event is AppLocaleChangedEvent) {
        settings.locale = locale = event.locale;
        await _settingsRepo.saveAppSettings(settings);
      }

      emit(AppReady(
        theme,
        _getThemeColors(theme),
        _getThemeData(theme),
        locale,
        appSettings: settings,
      ));
    });
  }

  ThemeData _getThemeData(AppTheme theme) {
    return theme == AppTheme.dark
        ? DijinxAppThemes.darkTheme
        : DijinxAppThemes.lightTheme;
  }

  AppThemeColors _getThemeColors(AppTheme theme) {
    return theme == AppTheme.dark ? DarkColors() : LightColors();
  }

  Future setTheme(AppTheme theme) async {
    AppSettings settings = await _settingsRepo.getAppSettings();
    if (theme == settings.theme) return;

    add(AppThemeChangedEvent(theme));
  }

  Future setLocale(String locale, {String region = ''}) async {
    AppSettings settings = await _settingsRepo.getAppSettings();
    if (locale == settings.locale) return;

    add(AppLocaleChangedEvent(locale));
  }

  void reload() {
    if (!isClosed) {
      add(AppStartedEvent());
    }
  }
}
