part of 'theme.dart';

class DarkColors extends AppThemeColors {
  // Navigation
  @override
  Color get navigationColor => StaticColors.slate900;
  @override
  Color get navigationText => textPrimary;

  // Text
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  @override
  Color get textSecondary => const Color(0xFFC4C8CB);
  @override
  Color get textBackground => const Color(0xFF41464B);
  @override
  Color get cursorColor => Colors.white;
  @override
  Color get selectionColor => primaryColor;
  @override
  Color get buttonTextOnly => StaticColors.sky300;
  @override
  Color get buttonTextOnlyDisabled => StaticColors.sky600;

  // Error
  @override
  Color get errorPrimary => const Color(0xFFFD9999);
  @override
  Color get errorSecondary => const Color(0xFFFC6666);

  // Surfaces
  @override
  Color get surfacePrimary => StaticColors.slate900;
  @override
  Color get background => const Color(0xFF040A18);
  @override
  Color get surfaceSecondary => const Color(0xFF040A18);
  @override
  Color get surfaceInteractive => surfacePrimary;
  @override
  Color get shimmerHighlight => StaticColors.slate800;
  @override
  Color get shimmerBase => StaticColors.slate700;

  // Overlays
  @override
  Color get overlayBackground => const Color(0x80000000);

  // Borders
  @override
  Color get borderPrimary => StaticColors.slate700;
}
