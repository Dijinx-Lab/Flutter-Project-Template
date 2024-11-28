part of '../theme.dart';

class DarkColors extends AppColors {
  // Navigation
  @override
  Color get navigationColor => EssentialColors.slate900;

  // Text
  @override
  Color get textPrimary => EssentialColors.slate50;
  @override
  Color get textSecondary => EssentialColors.slate300;
  @override
  Color get cursorColor => EssentialColors.primary400;
  @override
  Color get selectionColor => EssentialColors.primary100;

  // Error
  @override
  Color get errorPrimary => EssentialColors.danger300;
  @override
  Color get errorSecondary => EssentialColors.danger500;

  // Surfaces
  @override
  Color get surfacePrimary => EssentialColors.slate800;
  @override
  Color get background => EssentialColors.slate950;

  @override
  Color get shimmerHighlight => EssentialColors.slate800;
  @override
  Color get shimmerBase => EssentialColors.slate900;

  // Borders
  @override
  Color get borderPrimary => EssentialColors.slate700;

  // Loaders
  @override
  Color get loader => EssentialColors.slate300;
  @override
  Color get loaderBackground => EssentialColors.slate900;
}
