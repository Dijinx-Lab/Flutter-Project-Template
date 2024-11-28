part of '../components.dart';

class EssentialSpinner extends StatelessWidget {
  final Color? color;
  final ComponentStyle componentStyle;
  const EssentialSpinner({
    super.key,
    this.color,
    this.componentStyle = ComponentStyle.adaptive,
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
    spinnerColor ??= state.colors.loader;
    switch (componentStyle) {
      case ComponentStyle.adaptive:
        return isCupertino
            ? CupertinoActivityIndicator(
                radius: 10,
                color: spinnerColor,
              )
            : CircularProgressIndicator(
                color: spinnerColor,
              );

      case ComponentStyle.material:
        return CircularProgressIndicator(
          color: spinnerColor,
        );
      case ComponentStyle.cupertino:
        return CupertinoActivityIndicator(
          radius: 10,
          color: spinnerColor,
        );
    }
  }
}
