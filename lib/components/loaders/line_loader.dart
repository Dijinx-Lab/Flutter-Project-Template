part of 'loaders.dart';

class LineLoader extends StatelessWidget {
  final Color? color;
  const LineLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        Color? lineColor = color;
        lineColor ??= appState.colors.textSecondary;
        return Center(
          child: LinearProgressIndicator(
            color: lineColor,
            borderRadius: BorderRadius.circular(Sizes.cardBorderRadiusXl),
          ),
        );
      },
    );
  }
}
