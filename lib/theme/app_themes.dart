part of 'theme.dart';

class DijinxAppThemes {
  static final DarkColors _darkColors = DarkColors();
  static final LightColors _lightColors = LightColors();

  static final ThemeData lightTheme =
      _generateTheme(_lightColors, Brightness.light);
  static final ThemeData darkTheme =
      _generateTheme(_darkColors, Brightness.dark);

  static ThemeData _generateTheme(
    AppThemeColors colors,
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
      /*inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.inputBackground,
        filled: true,
        labelStyle: TextStyle(
          color: colors.textSecondary,
        ),
        floatingLabelStyle: TextStyle(
          color: colors.textSecondary,
        ),
        hintStyle: TextStyle(
          color: colors.textSecondary,
        ),
        helperStyle: TextStyle(
          color: colors.textSecondary,
        ),
        prefixStyle: TextStyle(
          color: colors.textSecondary,
        ),
        suffixStyle: TextStyle(
          color: colors.textSecondary,
        ),
        counterStyle: TextStyle(
          color: colors.textSecondary,
        ),
        border: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Sizes.inputBorderRadius)),
          borderSide: BorderSide(color: colors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Sizes.inputBorderRadius)),
          borderSide: BorderSide(color: colors.inputBorderFocused),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Sizes.inputBorderRadius)),
          borderSide: BorderSide(color: colors.inputBorder),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Sizes.inputBorderRadius)),
          borderSide: BorderSide(color: colors.inputBorderDisabled),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Sizes.inputBorderRadius)),
          borderSide: BorderSide(color: colors.errorBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Sizes.inputBorderRadius)),
          borderSide: BorderSide(color: colors.errorBorder),
        ),
      ),*/
      useMaterial3: true,
    );
  }
}
