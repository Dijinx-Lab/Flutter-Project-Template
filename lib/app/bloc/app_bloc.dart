import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/models/models.dart';
import 'package:flutter_essentials/repositories/repositories.dart';
import 'package:flutter_essentials/theme/theme.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SettingsRepo _settingsRepo = SettingsRepo();

  AppBloc()
      : super(AppInitial(
          AppTheme.light,
          LightColors(),
          AppThemes.lightTheme,
          '',
        )) {
    on<AppEvent>((event, emit) async {
      AppSettings settings = await _settingsRepo.getAppSettings();

      AppTheme theme = settings.theme;
      String locale = settings.locale;

      if (state is AppInitial) {
        await _onAppPrefsLoaded(emit, theme, locale, settings);
      }

      if (event is AppThemeChangedEvent) {
        settings.theme = theme = event.theme;
        await _settingsRepo.saveAppSettings(settings);
        emit(AppReady(
          theme,
          _getThemeColors(theme),
          _getThemeData(theme),
          locale,
          appSettings: settings,
        ));
      }

      if (event is AppLocaleChangedEvent) {
        settings.locale = locale = event.locale;
        await _settingsRepo.saveAppSettings(settings);
        emit(AppReady(
          theme,
          _getThemeColors(theme),
          _getThemeData(theme),
          locale,
          appSettings: settings,
        ));
      }
    });
  }

  _onAppPrefsLoaded(
    Emitter emit,
    AppTheme theme,
    String locale,
    AppSettings settings,
  ) async {
    emit(AppLoaded(
      theme,
      _getThemeColors(theme),
      _getThemeData(theme),
      locale,
      appSettings: settings,
    ));
    // PERFORM ANY INITIALIZING OPERATIONS LIKE API CALLS OR LOADING ASSETS ETC
    await Future.delayed(const Duration(seconds: 2));
    emit(AppReady(
      theme,
      _getThemeColors(theme),
      _getThemeData(theme),
      locale,
      appSettings: settings,
    ));
  }

  ThemeData _getThemeData(AppTheme theme) {
    return theme == AppTheme.dark ? AppThemes.darkTheme : AppThemes.lightTheme;
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
