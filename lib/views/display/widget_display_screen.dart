import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials/app/bloc/app_bloc.dart';
import 'package:flutter_essentials/components/components.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/theme/theme.dart';
import 'package:flutter_essentials/views/display/cubit/widget_display_cubit.dart';

class WidgetDisplayScreen extends StatelessWidget {
  const WidgetDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (appContext, appState) {
        return BlocProvider(
          create: (context) => WidgetDisplayCubit(),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: Paddings.horizontalScreenInsets(appContext),
                child: SingleChildScrollView(
                  child: BlocConsumer<WidgetDisplayCubit, WidgetDisplayState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      WidgetDisplayCubit cubit =
                          context.read<WidgetDisplayCubit>();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacing(size: SpacingSize.pageTop),
                          _buildConfig(appState, context),
                          const Spacing(),
                          _buildTexts(appState),
                          const Spacing(),
                          _buildButtons(appState),
                          const Spacing(),
                          _buildLoaders(appState),
                          const Spacing(),
                          _buildSelections(appState, cubit),
                          const Spacing(size: SpacingSize.xxLarge),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSelections(AppState appState, WidgetDisplayCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selections',
          style: FontStyles.style(
            FontSize.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(),
        EssentialSwitch(
          label: 'Adaptive Switch',
          value: cubit.state.props[0] as bool,
          onChange: (res) => cubit.updateSwitch(res),
        ),
        const Spacing(),
        EssentialCheckbox(
          label: 'Adaptive Checkbox',
          value: cubit.state.props[1] as bool,
          onChange: (res) => cubit.updateCheckbox(res),
        ),
        const Spacing(),
        Row(
          children: [
            EssentialRadio<String>(
              groupValue: cubit.state.props[2] as String,
              value: 'Yes',
              onChange: (res) => cubit.updateRadio(res),
            ),
            const Spacing(),
            EssentialRadio<String>(
              groupValue: cubit.state.props[2] as String,
              value: 'No',
              onChange: (res) => cubit.updateRadio(res),
            ),
            const Spacing(),
            EssentialRadio<String>(
              groupValue: cubit.state.props[2] as String,
              value: 'Maybe',
              onChange: (res) => cubit.updateRadio(res),
            ),
          ],
        ),
        const Spacing(size: SpacingSize.large),
        EssentialSlider(
          value: cubit.state.props[3] as double,
          min: 0,
          max: 10,
          label: 'Adaptive Slider',
          onChanged: (res) => cubit.updateSlider(res),
        )
      ],
    );
  }

  _buildLoaders(AppState appState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loadings',
          style: FontStyles.style(
            FontSize.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(),
        Row(
          children: [
            EssentialSkeleton.circle(radius: 30),
            EssentialSkeleton.text(
                margin: const EdgeInsets.only(left: Sizes.spacingM)),
          ],
        ),
        EssentialSkeleton.rect(
            width: double.maxFinite,
            height: 100,
            margin: const EdgeInsets.only(top: Sizes.spacingM)),
        const Spacing(),
        const SizedBox(
            width: Sizes.spacingXXL,
            height: Sizes.spacingXXL,
            child: EssentialSpinner()),
        const Spacing(),
        const SizedBox(
            width: double.maxFinite,
            height: Sizes.spacingXXL,
            child: EssentialLineLoader()),
        const Spacing(),
        Row(
          children: [
            EssentialButton(
              label: 'Circular Overlay',
              onTap: () async {
                EssentialOverlayLoader.showLoader();
                await Future.delayed(const Duration(seconds: 3));
                EssentialOverlayLoader.dismiss();
              },
              isExpanded: false,
            ),
            const Spacing(),
            EssentialButton(
              label: 'Line Overlay',
              onTap: () async {
                EssentialOverlayLoader.showLoader(
                    loaderType: OverlayLoaderType.line);
                await Future.delayed(const Duration(seconds: 3));
                EssentialOverlayLoader.dismiss();
              },
              isExpanded: false,
            ),
          ],
        ),
      ],
    );
  }

  _buildConfig(AppState appState, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Settings',
          style: FontStyles.style(
            FontSize.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(),
        EssentialSwitch(
          label: 'Dark Mode',
          value: appState.themeData.brightness == Brightness.dark,
          onChange: (res) {
            context
                .read<AppBloc>()
                .setTheme(res ? AppTheme.dark : AppTheme.light);
          },
        ),
      ],
    );
  }

  _buildButtons(AppState appState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buttons',
          style: FontStyles.style(
            FontSize.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(),
        EssentialButton(
          label: 'Primary Button',
          onTap: () => (),
        ),
        const Spacing(),
        EssentialButton(
          label: 'Disabled Primary Button',
          onTap: () => (),
          isEnabled: false,
        ),
        const Spacing(),
        EssentialButton(
          label: 'Expanded = false',
          onTap: () => (),
          isExpanded: false,
        ),
        const Spacing(),
        EssentialButton(
          label: 'Primary Button',
          onTap: () => (),
          isLoading: true,
        ),
        const Spacing(),
        EssentialButton(
          label: 'Secondary Button',
          onTap: () => (),
          type: ButtonType.secondary,
        ),
        const Spacing(),
        EssentialButton(
          label: 'Danger Button',
          onTap: () => (),
          type: ButtonType.danger,
        ),
        const Spacing(),
        EssentialButton(
          label: 'Text Only',
          onTap: () => (),
          type: ButtonType.textOnly,
          isExpanded: false,
        ),
      ],
    );
  }

  _buildTexts(AppState appState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text Styles',
          style: FontStyles.style(
            FontSize.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(),
        Row(
          children: [
            Expanded(
              child: Text(
                'Title',
                style: FontStyles.style(
                  FontSize.title,
                ),
              ),
            ),
            const Spacing(size: SpacingSize.xSmall),
            Expanded(
              child: Text(
                'Title Bold',
                style: FontStyles.style(
                  FontSize.titleBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(size: SpacingSize.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Heading',
                style: FontStyles.style(
                  FontSize.heading,
                ),
              ),
            ),
            const Spacing(size: SpacingSize.xSmall),
            Expanded(
              child: Text(
                'Heading Bold',
                style: FontStyles.style(
                  FontSize.headingBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(size: SpacingSize.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Body Large',
                style: FontStyles.style(
                  FontSize.bodyLarge,
                ),
              ),
            ),
            const Spacing(size: SpacingSize.xSmall),
            Expanded(
              child: Text(
                'Body Large Bold',
                style: FontStyles.style(
                  FontSize.bodyLargeBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(size: SpacingSize.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Body',
                style: FontStyles.style(
                  FontSize.body,
                ),
              ),
            ),
            const Spacing(size: SpacingSize.xSmall),
            Expanded(
              child: Text(
                'Body Bold',
                style: FontStyles.style(
                  FontSize.bodyBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(size: SpacingSize.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Label',
                style: FontStyles.style(
                  FontSize.label,
                ),
              ),
            ),
            const Spacing(size: SpacingSize.xSmall),
            Expanded(
              child: Text(
                'Label Bold',
                style: FontStyles.style(
                  FontSize.labelBold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
