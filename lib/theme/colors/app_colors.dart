part of '../theme.dart';

abstract class AppColors {
  Color get primaryColor => EssentialColors.primary600;
  Color get onPrimary => EssentialColors.white;
  Color get hoverColor => primaryColor;
  Color get cursorColor;
  Color get selectionColor;

  // Navigation
  Color get navigationColor;

  // Text
  Color get textPrimary;
  Color get textSecondary;
  Color get textError => errorPrimary;

  // Error
  Color get errorPrimary;
  Color get errorSecondary;

  // Surfaces
  Color get background;
  Color get surfacePrimary;
  Color get shimmerHighlight;
  Color get shimmerBase;

  // Loaders
  Color get loader;
  Color get loaderBackground;

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

  // Buttons
  Color get primaryButton => primaryColor;
  Color get primaryButtonText => onPrimary;
  Color get primaryButtonBorder => primaryButton;
  Color get primaryButtonLoader => primaryButtonText;

  Color get secondaryButton => surfacePrimary;
  Color get secondaryButtonText => textSecondary;
  Color get secondaryButtonBorder => textSecondary;
  Color get secondaryButtonLoader => textSecondary;

  Color get dangerButton => EssentialColors.danger700;
  Color get dangerButtonText => onPrimary;
  Color get dangerButtonBorder => dangerButton;
  Color get dangerButtonLoader => onPrimary;

  Color get textButton => Colors.transparent;
  Color get textButtonText => textPrimary;
  Color get textButtonBorder => Colors.transparent;
  Color get textButtonLoader => textPrimary;

  // Dividers
  Color get dividerColor => borderPrimary;
}
