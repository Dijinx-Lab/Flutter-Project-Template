part of '../components.dart';

class EssentialCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;
  final String? label;
  final bool boldLabel;
  final Haptics? haptic;
  final ComponentStyles componentStyle;

  const EssentialCheckbox({
    super.key,
    required this.value,
    required this.onChange,
    this.label,
    this.boldLabel = false,
    this.haptic = Haptics.nudge,
    this.componentStyle = ComponentStyles.adaptive,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return GestureDetector(
          onTap: () => _onTap(!value),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(right: Sizes.spacingM),
                  child: Text(
                    label ?? "",
                    style: FontStyles.style(
                      boldLabel ? FontSizes.labelBold : FontSizes.label,
                    ),
                  ),
                ),
              _buildComponent(appState, context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComponent(AppState state, BuildContext context) {
    switch (componentStyle) {
      case ComponentStyles.adaptive:
        return Checkbox.adaptive(
          value: value,
          onChanged: (res) => _onTap(res),
          visualDensity: VisualDensity.compact,
          activeColor: state.colors.primaryColor,
          checkColor: StaticColors.basicWhite,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      case ComponentStyles.material:
        return _buildMaterialCheckbox(state);
      case ComponentStyles.cupertino:
        return _buildCupertinoCheckbox(state);
    }
  }

  Widget _buildMaterialCheckbox(AppState state) {
    return Checkbox(
      value: value,
      onChanged: (res) => _onTap(res),
      visualDensity: VisualDensity.compact,
      activeColor: state.colors.primaryColor,
      checkColor: StaticColors.basicWhite,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildCupertinoCheckbox(AppState state) {
    return CupertinoCheckbox(
      value: value,
      onChanged: (res) => _onTap(res),
      activeColor: state.colors.primaryColor,
      checkColor: StaticColors.basicWhite,
    );
  }

  _onTap(bool? res) {
    if (haptic != null) {
      HapticUtil.trigger(haptic!);
    }
    onChange(res ?? false);
  }
}
