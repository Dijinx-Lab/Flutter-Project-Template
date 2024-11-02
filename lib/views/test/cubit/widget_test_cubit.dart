import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'widget_test_state.dart';

class WidgetTestCubit extends Cubit<WidgetTestState> {
  WidgetTestCubit()
      : super(const WidgetTestLoaded(
          isSwitchOn: false,
          isCheckboxOn: false,
          radioGroupValue: "",
          sliderValue: 0.0,
        ));

  updateSwitch(bool val) {
    emit(
      WidgetTestLoaded(
        isSwitchOn: val,
        isCheckboxOn: state.props[1] as bool,
        radioGroupValue: state.props[2] as String,
        sliderValue: state.props[3] as double,
      ),
    );
  }

  updateCheckbox(bool val) {
    emit(
      WidgetTestLoaded(
        isSwitchOn: state.props[0] as bool,
        isCheckboxOn: val,
        radioGroupValue: state.props[2] as String,
        sliderValue: state.props[3] as double,
      ),
    );
  }

  updateRadio(String val) {
    emit(
      WidgetTestLoaded(
        isSwitchOn: state.props[0] as bool,
        isCheckboxOn: state.props[1] as bool,
        radioGroupValue: val,
        sliderValue: state.props[3] as double,
      ),
    );
  }

  updateSlider(double val) {
    emit(
      WidgetTestLoaded(
        isSwitchOn: state.props[0] as bool,
        isCheckboxOn: state.props[1] as bool,
        radioGroupValue: state.props[2] as String,
        sliderValue: val,
      ),
    );
  }
}
