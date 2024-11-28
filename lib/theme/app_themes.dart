part of 'theme.dart';

class AppThemes {
  static final DarkColors _darkColors = DarkColors();
  static final LightColors _lightColors = LightColors();

  static final ThemeData lightTheme =
      _generateTheme(_lightColors, Brightness.light);
  static final ThemeData darkTheme =
      _generateTheme(_darkColors, Brightness.dark);

  static ThemeData _generateTheme(
    AppColors colors,
    Brightness brightness,
  ) {
    return ThemeData(
      brightness: brightness,
      primaryColor: colors.primaryColor,
      iconTheme: IconThemeData(color: colors.primaryColor),
      hoverColor: colors.hoverColor,
      indicatorColor: colors.cursorColor,
      dividerColor: colors.dividerColor,
      colorScheme: ColorScheme(
        primary: colors.primaryColor,
        secondary: colors.primaryColor,
        surface: colors.surfacePrimary,
        error: colors.errorPrimary,
        onPrimary: colors.onPrimary,
        onSecondary: colors.textPrimary,
        onSurface: colors.textPrimary,
        onError: colors.textPrimary,
        brightness: brightness,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.navigationColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.inputCursor,
        selectionColor: colors.selectionColor,
        selectionHandleColor: colors.primaryColor,
      ),
      scaffoldBackgroundColor: colors.background,
      useMaterial3: true,
    );
  }
}
