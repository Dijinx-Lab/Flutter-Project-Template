part of 'selections.dart';

class EssentialRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Function(T) onChange;
  final bool boldLabel;
  final bool showLabel;
  final Haptics? haptic;

  const EssentialRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChange,
    this.boldLabel = false,
    this.showLabel = true,
    this.haptic = Haptics.nudge,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return GestureDetector(
          onTap: () => onTap(value),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<T>.adaptive(
                value: value,
                groupValue: groupValue,
                visualDensity: VisualDensity.compact,
                onChanged: (res) {
                  if (res != null) onTap(res);
                },
                activeColor: appState.colors.primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              if (showLabel)
                Padding(
                  padding: const EdgeInsets.only(left: Sizes.spacingM),
                  child: Text(
                    value.toString(),
                    style: FontStyles.style(
                      boldLabel ? FontSizes.labelBold : FontSizes.label,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  onTap(T res) {
    if (haptic != null) {
      HapticUtil.trigger(haptic!);
    }
    onChange(res);
  }
}
