part of '../components.dart';

class EssentialOverlayLoader {
  static showLoader({
    OverlayLoaderTypes loaderType = OverlayLoaderTypes.circular,
    ComponentStyles componentStyle = ComponentStyles.adaptive,
    Color? color,
  }) =>
      SmartDialog.showLoading(
        backType: SmartBackType.ignore,
        builder: (_) => OverlayLoaderWidget(
          loaderType: loaderType,
          color: color ?? StaticColors.basicWhite,
          componentStyle: componentStyle,
        ),
      );

  static dismiss() => SmartDialog.dismiss();
}

class OverlayLoaderWidget extends StatefulWidget {
  final OverlayLoaderTypes loaderType;
  final Color? color;
  final ComponentStyles componentStyle;
  const OverlayLoaderWidget(
      {super.key,
      required this.loaderType,
      this.color,
      required this.componentStyle});

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
    return Stack(children: [
      Visibility(
        visible: widget.loaderType == OverlayLoaderTypes.circular,
        child: EssentialSpinner(
          color: widget.color,
          componentStyle: widget.componentStyle,
        ),
      ),
      Visibility(
        visible: widget.loaderType == OverlayLoaderTypes.line,
        child: EssentialLineLoader(
          color: widget.color,
        ),
      ),
    ]);
  }
}
