part of '../theme.dart';

class LightColors extends AppColors {
  // Navigation
  @override
  Color get navigationColor => EssentialColors.white;

  // Text
  @override
  Color get textPrimary => EssentialColors.slate800;
  @override
  Color get textSecondary => EssentialColors.slate500;
  @override
  Color get cursorColor => EssentialColors.primary400;
  @override
  Color get selectionColor => EssentialColors.primary300;

  // Error
  @override
  Color get errorPrimary => EssentialColors.danger800;
  @override
  Color get errorSecondary => EssentialColors.danger600;

  // Surfaces
  @override
  Color get surfacePrimary => EssentialColors.slate100;
  @override
  Color get background => EssentialColors.slate50;

  @override
  Color get shimmerHighlight => EssentialColors.slate300;
  @override
  Color get shimmerBase => EssentialColors.slate200;

  // Borders
  @override
  Color get borderPrimary => EssentialColors.slate200;

  // Loaders
  @override
  Color get loader => EssentialColors.slate500;
  @override
  Color get loaderBackground => EssentialColors.slate200;
}
