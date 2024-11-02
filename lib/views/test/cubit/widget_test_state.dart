part of 'widget_test_cubit.dart';

sealed class WidgetTestState extends Equatable {
  const WidgetTestState();
}

final class WidgetTestLoaded extends WidgetTestState {
  final bool isSwitchOn;
  final bool isCheckboxOn;
  final String radioGroupValue;
  final double sliderValue;
  const WidgetTestLoaded(
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
