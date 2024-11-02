part of './theme.dart';

abstract class AppThemeColors {
  Color get primaryColor => StaticColors.sky500;
  Color get onPrimary => Colors.white;
  Color get hoverColor => primaryColor;
  Color get cursorColor;
  Color get selectionColor;

  // Navigation
  Color get navigationColor;
  Color get navigationText;
  Color get navbarPrimaryText => buttonTextOnly;
  Color get navbarPrimaryDisabledText => buttonTextOnlyDisabled;

  // Text
  Color get textPrimary;
  Color get textSecondary;
  Color get textBackground;
  Color get textError => errorPrimary;
  Color get buttonTextOnly;
  Color get buttonTextOnlyDisabled;

  // Error
  Color get errorPrimary;
  Color get errorSecondary;

  // Surfaces
  Color get surfacePrimary;
  Color get background;
  Color get surfaceSecondary;
  Color get surfaceInteractive;
  Color get shimmerHighlight;
  Color get shimmerBase;

  // Overlays
  Color get overlayBackground;

  // Borders
  Color get borderPrimary;
  Color get errorBorder => errorSecondary;

  // Inputs
  Color get inputFocusColor => primaryColor;
  Color get inputTextDisabled => const Color(0xFF41464B);
  Color get inputTextError => textError;
  Color get inputCursor => cursorColor;
  Color get inputErrorCursor => errorSecondary;
  Color get inputBackground => surfacePrimary;
  Color get inputDisabledBackground => surfacePrimary;
  Color get inputBorder => borderPrimary;
  Color get inputBorderFocused => borderPrimary;
  Color get inputBorderError => errorBorder;
  Color get inputBorderDisabled => const Color(0xFF41464B);
  Color get inputPopupBackground => surfacePrimary;
  Color get inputPopupBorder => borderPrimary;
  Color get inputPopupOptionText => textPrimary;
  Color get inputPopupDivider => borderPrimary;
  Color get inputPopupSelectedBackground => primaryColor;
  Color get inputPopupSelectedText => Colors.white;

  // Buttons
  Color get primaryButton => primaryColor;
  Color get primaryButtonWater => onPrimary.withOpacity(0.3);
  Color get primaryButtonText => onPrimary;
  Color get primaryButtonBorder => primaryButton;
  Color get primaryButtonLoader => primaryButtonText;

  Color get secondaryButton => surfacePrimary;
  Color get secondaryButtonWater => textSecondary.withOpacity(0.3);
  Color get secondaryButtonText => textSecondary;
  Color get secondaryButtonBorder => textSecondary;
  Color get secondaryButtonLoader => textSecondary;

  Color get dangerButton => StaticColors.strawberry500;
  Color get dangerButtonWater => onPrimary.withOpacity(0.3);
  Color get dangerButtonText => onPrimary;
  Color get dangerButtonBorder => dangerButton;
  Color get dangerButtonLoader => onPrimary;

  Color get textButton => Colors.transparent;
  Color get textButtonWater => textPrimary.withOpacity(0.3);
  Color get textButtonText => textPrimary;
  Color get textButtonBorder => Colors.transparent;
  Color get textButtonLoader => textPrimary;

  // Switches
  Color get switchBackgroundOn => primaryColor;
  Color get switchBackgroundOff => surfaceSecondary;
  Color get switchBorderOn => primaryColor;
  Color get switchBorderOff => textSecondary;
  Color get switchIndicatorOn => Colors.white;
  Color get switchIndicatorOff => switchBorderOff;

  // Dividers
  Color get dividerColor => borderPrimary;

  // Snackbars
  Color get snackBarSuccess => StaticColors.mint500;
  Color get onSnackBarSuccess => Colors.white;
  Color get snackBarError => StaticColors.strawberry500;
  Color get onSnackBarError => Colors.white;
}

class StaticColors {
  static const Color basicWhite = Color(0xFFFFFFFF);

  static const Color sky50 = Color(0xFFE9EFFD);
  static const Color sky100 = Color(0xFFD3E0FB);
  static const Color sky200 = Color(0xFFA7C1F7);
  static const Color sky300 = Color(0xFF818EEF);
  static const Color sky400 = Color(0xFF5082EF);
  static const Color sky500 = Color(0xFF2463EB);
  static const Color sky600 = Color(0XFF1D4FBC);
  static const Color sky700 = Color(0xFF163B8D);
  static const Color sky800 = Color(0xFF0E285E);
  static const Color sky900 = Color(0xFF07142F);
  static const Color sky950 = Color(0xFF040A18);

  static const Color slate100 = Color(0xFFE2E3E5);
  static const Color slate200 = Color(0xFFC4C8CB);
  static const Color slate300 = Color(0xFFA7ACB1);
  static const Color slate400 = Color(0xFF899197);
  static const Color slate500 = Color(0xFF6C757D);
  static const Color slate600 = Color(0xFF565E64);
  static const Color slate700 = Color(0xFF41464B);
  static const Color slate800 = Color(0xFF2B2F32);
  static const Color slate900 = Color(0xFF161719);

  static const Color strawberry100 = Color(0xFFFECCCC);
  static const Color strawberry200 = Color(0xFFFD9999);
  static const Color strawberry300 = Color(0xFFFC6666);
  static const Color strawberry400 = Color(0xFFFB3333);
  static const Color strawberry500 = Color(0xFFFA0000);
  static const Color strawberry600 = Color(0xFFC80000);
  static const Color strawberry700 = Color(0xFF960000);
  static const Color strawberry800 = Color(0xFF640000);
  static const Color strawberry900 = Color(0xFF320000);

  static const Color mint100 = Color(0xFFCFEDD6);
  static const Color mint200 = Color(0xFFA5DBB2);
  static const Color mint300 = Color(0xFF7CCA8D);
  static const Color mint400 = Color(0xFF52B869);
  static const Color mint500 = Color(0xFF28A745);
  static const Color mint600 = Color(0xFF208637);
  static const Color mint700 = Color(0xFF186429);
  static const Color mint800 = Color(0xFF10431C);
  static const Color mint900 = Color(0xFF08210E);

  static const Color lemon100 = Color(0xFFFEF6D5);
  static const Color lemon200 = Color(0xFFFDECAB);
  static const Color lemon300 = Color(0xFFFCE380);
  static const Color lemon400 = Color(0xFFFBD956);
  static const Color lemon500 = Color(0xFFFAD02C);
  static const Color lemon600 = Color(0xFFC8A623);
  static const Color lemon700 = Color(0xFF967D1A);
  static const Color lemon800 = Color(0xFF645312);
  static const Color lemon900 = Color(0xFF322A09);

  static const Color apricot100 = Color(0xFFFFE7D2);
  static const Color apricot200 = Color(0xFFFFCFA5);
  static const Color apricot300 = Color(0xFFFFB678);
  static const Color apricot400 = Color(0xFFFF9E4B);
  static const Color apricot500 = Color(0xFFFF861E);
  static const Color apricot600 = Color(0xFFCC6B18);
  static const Color apricot700 = Color(0xFF995012);
  static const Color apricot800 = Color(0xFF66360C);
  static const Color apricot900 = Color(0xFF331B06);
}
