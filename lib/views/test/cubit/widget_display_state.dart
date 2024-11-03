part of 'widget_display_cubit.dart';

sealed class WidgetDisplayState extends Equatable {
  const WidgetDisplayState();
}

final class WidgetDisplayLoaded extends WidgetDisplayState {
  final bool isSwitchOn;
  final bool isCheckboxOn;
  final String radioGroupValue;
  final double sliderValue;
  const WidgetDisplayLoaded(
      {required this.isSwitchOn,
      required this.isCheckboxOn,
      required this.radioGroupValue,
      required this.sliderValue});

  @override
  List<Object> get props => [
        isSwitchOn,
        isCheckboxOn,
        radioGroupValue,
        sliderValue,
      ];
}
