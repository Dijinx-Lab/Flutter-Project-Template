part of 'selections.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;
  final String? label;
  final bool? isExpanded;
  const AppSwitch(
      {super.key,
      required this.value,
      required this.onChange,
      this.label,
      this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Switch.adaptive(
          value: value,
          onChanged: (res) => onChange(res),
          activeColor: appState.colors.primaryColor,
          activeTrackColor: appState.colors.primaryColor,
          inactiveThumbColor: StaticColors.slate600,
        );
      },
    );
  }
}
