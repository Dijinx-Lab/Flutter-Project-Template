part of '../components.dart';

class EssentialLineLoader extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  const EssentialLineLoader({super.key, this.color, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        Color? lineColor = color;
        Color? lineBgColor = backgroundColor;
        lineColor ??= appState.colors.loader;
        lineBgColor ??= appState.colors.loaderBackground;
        return Center(
          child: LinearProgressIndicator(
            color: lineColor,
            borderRadius: BorderRadius.circular(Sizes.cardBorderRadiusXl),
            backgroundColor: lineBgColor,
          ),
        );
      },
    );
  }
}
