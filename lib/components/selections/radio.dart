part of '../components.dart';

class EssentialRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Function(T) onChange;
  final bool boldLabel;
  final bool showLabel;
  final Haptics? haptic;
  final ComponentStyle componentStyle;

  const EssentialRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChange,
    this.boldLabel = false,
    this.showLabel = true,
    this.haptic = Haptics.nudge,
    this.componentStyle = ComponentStyle.adaptive,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        bool addPadding = componentStyle == ComponentStyle.cupertino ||
            (componentStyle == ComponentStyle.adaptive &&
                Theme.of(context).platform == TargetPlatform.iOS);

        return GestureDetector(
          onTap: () => _onTap(value),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildComponent(appState, context),
              if (showLabel)
                Padding(
                  padding:
                      EdgeInsets.only(left: addPadding ? Sizes.spacingM : 0),
                  child: Text(
                    value.toString(),
                    style: FontStyles.style(
                      boldLabel ? FontSize.labelBold : FontSize.label,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComponent(AppState state, BuildContext context) {
    switch (componentStyle) {
      case ComponentStyle.adaptive:
        return Radio<T>.adaptive(
          value: value,
          groupValue: groupValue,
          visualDensity: VisualDensity.compact,
          onChanged: (res) {
            if (res != null) _onTap(res);
          },
          activeColor: state.colors.primaryColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      case ComponentStyle.material:
        return _buildMaterialRadio(state);
      case ComponentStyle.cupertino:
        return _buildCupertinoRadio(state);
    }
  }

  Widget _buildMaterialRadio(AppState state) {
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: (T? newValue) {
        if (newValue != null) _onTap(newValue);
      },
      visualDensity: VisualDensity.compact,
      activeColor: state.colors.primaryColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildCupertinoRadio(AppState state) {
    return CupertinoRadio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: (T? newValue) {
        if (newValue != null) _onTap(newValue);
      },
      activeColor: state.colors.primaryColor,
    );
  }

  _onTap(T res) {
    if (haptic != null) {
      HapticUtil.trigger(haptic!);
    }
    onChange(res);
  }
}
