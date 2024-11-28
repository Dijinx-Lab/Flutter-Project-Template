part of '../components.dart';

class EssentialOverlayLoader {
  static showLoader({
    OverlayLoaderType loaderType = OverlayLoaderType.circular,
    ComponentStyle componentStyle = ComponentStyle.adaptive,
    Color? color,
  }) =>
      SmartDialog.showLoading(
        backType: SmartBackType.ignore,
        maskColor: EssentialColors.slate900.withOpacity(0.6),
        builder: (_) => OverlayLoaderWidget(
          loaderType: loaderType,
          color: color,
          componentStyle: componentStyle,
        ),
      );

  static dismiss() => SmartDialog.dismiss();
}

class OverlayLoaderWidget extends StatefulWidget {
  final OverlayLoaderType loaderType;
  final Color? color;
  final ComponentStyle componentStyle;
  const OverlayLoaderWidget({
    super.key,
    required this.loaderType,
    this.color,
    required this.componentStyle,
  });

  @override
  State<OverlayLoaderWidget> createState() => _OverlayLoaderWidgetState();
}

class _OverlayLoaderWidgetState extends State<OverlayLoaderWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _initializeAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _initializeAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        var loaderColor = widget.color ?? EssentialColors.slate50;
        return Stack(
          children: [
            Visibility(
              visible: widget.loaderType == OverlayLoaderType.circular,
              child: EssentialSpinner(
                color: loaderColor,
                componentStyle: widget.componentStyle,
              ),
            ),
            Visibility(
              visible: widget.loaderType == OverlayLoaderType.line,
              child: Padding(
                padding: Paddings.horizontalScreenInsets(context),
                child: EssentialLineLoader(
                  color: loaderColor,
                  backgroundColor: EssentialColors.slate400,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
