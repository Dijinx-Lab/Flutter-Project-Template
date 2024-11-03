part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState(
    this.theme,
    this.colors,
    this.themeData,
    this.locale,
  );

  final AppTheme theme;
  final AppThemeColors colors;
  final ThemeData themeData;
  final String locale;
}

final class AppInitial extends AppState {
  const AppInitial(
    super.theme,
    super.colors,
    super.themeData,
    super.locale,
  );

  @override
  List<Object?> get props => [
        theme,
        locale,
      ];
}

final class AppLoaded extends AppState {
  const AppLoaded(
    super.theme,
    super.colors,
    super.themeData,
    super.locale, {
    required this.appSettings,
  });

  final AppSettings appSettings;

  @override
  List<Object?> get props => [theme, locale, appSettings];
}

final class AppReady extends AppState {
  const AppReady(
    super.theme,
    super.colors,
    super.themeData,
    super.locale, {
    required this.appSettings,
  });

  final AppSettings appSettings;

  @override
  List<Object?> get props => [theme, locale, appSettings];
}
