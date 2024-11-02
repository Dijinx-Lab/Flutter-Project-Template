part of 'selections.dart';

class EssentialCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;
  final String? label;
  final bool boldLabel;
  final Haptics? haptic;

  const EssentialCheckbox({
    super.key,
    required this.value,
    required this.onChange,
    this.label,
    this.boldLabel = false,
    this.haptic = Haptics.nudge,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return GestureDetector(
          onTap: () => onTap(!value),
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
              Checkbox.adaptive(
                value: value,
                onChanged: (res) => onTap(res),
                visualDensity: VisualDensity.compact,
                activeColor: appState.colors.primaryColor,
                checkColor: StaticColors.basicWhite,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        );
      },
    );
  }

  onTap(bool? res) {
    if (haptic != null) {
      HapticUtil.trigger(haptic!);
    }
    onChange(res ?? false);
  }
}
