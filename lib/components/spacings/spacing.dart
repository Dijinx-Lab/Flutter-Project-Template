import 'package:flutter/material.dart';
import 'package:flutter_essentials/constants/constants.dart';

class Spacing extends StatelessWidget {
  final Spacings size;

  const Spacing(
    this.size, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedSize = _getSize();
    return SizedBox(
      height: resolvedSize,
      width: resolvedSize,
    );
  }

  double _getSize() {
    switch (size) {
      case Spacings.form:
        return Sizes.spacingForms;
      case Spacings.pageTop:
        return Sizes.spacingPageTop;
      case Spacings.xSmall:
        return Sizes.spacingXS;
      case Spacings.small:
        return Sizes.spacingS;
      case Spacings.medium:
        return Sizes.spacingM;
      case Spacings.large:
        return Sizes.spacingL;
      case Spacings.xLarge:
        return Sizes.spacingXL;
      case Spacings.xxLarge:
        return Sizes.spacingXXL;
      default:
        throw Exception("Invalid type");
    }
  }
}
