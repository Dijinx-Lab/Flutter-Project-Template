part of '../components.dart';

class EssentialSpinner extends StatelessWidget {
  final Color? color;
  final ComponentStyles componentStyle;
  const EssentialSpinner({
    super.key,
    this.color,
    this.componentStyle = ComponentStyles.adaptive,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: _buildComponent(appState, context),
          ),
        );
      },
    );
  }

  Widget _buildComponent(AppState state, BuildContext context) {
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;
    Color? spinnerColor = color;
    spinnerColor ??= state.colors.textSecondary;
    switch (componentStyle) {
      case ComponentStyles.adaptive:
        return isCupertino
            ? CupertinoActivityIndicator(
                radius: 15,
                color: spinnerColor,
              )
            : CircularProgressIndicator(
                color: spinnerColor,
              );

      case ComponentStyles.material:
        return CircularProgressIndicator(
          color: spinnerColor,
        );
      case ComponentStyles.cupertino:
        return CupertinoActivityIndicator(
          radius: 15,
          color: spinnerColor,
        );
    }
  }
}
