part of 'theme.dart';

class LightColors extends AppThemeColors {
  // Navigation
  @override
  Color get navigationColor => Colors.white;
  @override
  Color get navigationText => textPrimary;

  // Text
  @override
  Color get textPrimary => const Color(0xFF000000);
  @override
  Color get textSecondary => const Color(0xFF6C757D);
  @override
  Color get textBackground => const Color(0xFFC4C8CB);
  @override
  Color get cursorColor => Colors.black;
  @override
  Color get selectionColor => StaticColors.sky300;
  @override
  Color get buttonTextOnly => StaticColors.sky600;
  @override
  Color get buttonTextOnlyDisabled => StaticColors.sky300;

  // Error
  @override
  Color get errorPrimary => const Color(0xFF960000);
  @override
  Color get errorSecondary => const Color(0xFFC80000);

  // Surfaces
  @override
  Color get surfacePrimary => const Color(0xFFFFFFFF);
  @override
  Color get background => Colors.white;
  @override
  Color get surfaceSecondary => const Color(0xFFE9EFFD);
  @override
  Color get surfaceInteractive => Colors.white;
  @override
  Color get shimmerHighlight => StaticColors.slate300;
  @override
  Color get shimmerBase => StaticColors.slate200;

  // Overlays
  @override
  Color get overlayBackground => const Color(0x80F1F1F2);

  // Borders
  @override
  Color get borderPrimary => StaticColors.slate200;
}
