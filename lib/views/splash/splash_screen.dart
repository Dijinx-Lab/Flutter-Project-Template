import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials/app/bloc/app_bloc.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.colors.surfacePrimary,
          body: Center(
            child: Padding(
              padding: Paddings.horizontalScreenInsets(context),
              child: Container(
                width: Sizes.logoWH.$1,
                height: Sizes.logoWH.$2,
                decoration: BoxDecoration(
                  boxShadow: [Shadows.style()],
                ),
                child: Image.asset(
                  Assets.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
