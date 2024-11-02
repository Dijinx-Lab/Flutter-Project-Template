part of 'loaders.dart';

class EssentialSpinner extends StatelessWidget {
  final Color? color;
  const EssentialSpinner({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        Color? spinnerColor = color;
        spinnerColor ??= appState.colors.textSecondary;
        return Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Platform.isAndroid
                ? CircularProgressIndicator(
                    color: spinnerColor,
                  )
                : CupertinoActivityIndicator(
                    radius: 15,
                    color: spinnerColor,
                  ),
          ),
        );
      },
    );
  }
}
