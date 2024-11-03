part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppPrefsLoadedEvent extends AppEvent {}

final class AppStartedEvent extends AppEvent {}

final class AppThemeChangedEvent extends AppEvent {
  const AppThemeChangedEvent(this.theme);

  final AppTheme theme;
  @override
  List<Object> get props => [theme];
}

final class AppLocaleChangedEvent extends AppEvent {
  const AppLocaleChangedEvent(this.locale);

  final String locale;

  @override
  List<Object> get props => [locale];
}
