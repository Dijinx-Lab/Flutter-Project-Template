part of 'theme.dart';

class Shadows {
  static BoxShadow style({ShadowStyles style = ShadowStyles.card}) {
    switch (style) {
      case ShadowStyles.card:
        return _getCardShadow();
      default:
        throw ("Invalid or unhandled type");
    }
  }

  static BoxShadow _getCardShadow() {
    return BoxShadow(
      blurRadius: 10,
      offset: const Offset(3, 3),
      color: StaticColors.slate800.withOpacity(0.4),
    );
  }
}
