part of '../components.dart';

class EssentialSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int? stops;
  final ValueChanged<double> onChanged;
  final bool boldLabel;
  final String? label;
  final Alignment labelAlignment;

  const EssentialSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.stops,
    this.boldLabel = false,
    this.label,
    this.labelAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (label != null)
              Align(
                alignment: labelAlignment,
                child: Padding(
                  padding: const EdgeInsets.only(right: Sizes.spacingM),
                  child: Text(
                    label ?? "",
                    style: FontStyles.style(
                      boldLabel ? FontSizes.labelBold : FontSizes.label,
                    ),
                  ),
                ),
              ),
            Slider.adaptive(
              value: value,
              min: min,
              max: max,
              divisions: stops,
              onChanged: onChanged,
              activeColor: appState.colors.primaryColor,
            ),
          ],
        );
      },
    );
  }
}
