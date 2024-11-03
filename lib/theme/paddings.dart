part of 'theme.dart';

class Paddings {
  static EdgeInsets horizontalScreenInsets(
    BuildContext context, {
    double top = 0,
    double bottom = 0,
  }) {
    EdgeInsets padding = MediaQuery.of(context).padding;

    return EdgeInsets.fromLTRB(
      max(padding.right, Sizes.horizontalPadding),
      top,
      max(padding.left, Sizes.horizontalPadding),
      bottom,
    );
  }
}
