import 'package:flutter/material.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: Paddings.getHorizontalInsets(context),
          child: SizedBox(
            width: Sizes.logoWH.$1,
            height: Sizes.logoWH.$2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.cardBorderRadiusXl),
              child: Image.asset(
                Assets.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
