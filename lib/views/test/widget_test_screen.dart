import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials/app/bloc/app_bloc.dart';
import 'package:flutter_essentials/components/buttons/buttons.dart';
import 'package:flutter_essentials/components/loaders/loaders.dart';
import 'package:flutter_essentials/components/selections/selections.dart';
import 'package:flutter_essentials/components/spacings/spacing.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/theme/theme.dart';
import 'package:flutter_essentials/views/test/cubit/widget_test_cubit.dart';

class WidgetTestScreen extends StatelessWidget {
  const WidgetTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (appContext, appState) {
        return BlocProvider(
          create: (context) => WidgetTestCubit(),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: Paddings.getHorizontalInsets(appContext),
                child: SingleChildScrollView(
                  child: BlocConsumer<WidgetTestCubit, WidgetTestState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      WidgetTestCubit cubit = context.read<WidgetTestCubit>();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacing(Spacings.pageTop),
                          _buildTheme(appState, context),
                          const Spacing(Spacings.medium),
                          _buildTexts(appState),
                          const Spacing(Spacings.medium),
                          _buildButtons(appState),
                          const Spacing(Spacings.medium),
                          _buildLoaders(appState),
                          const Spacing(Spacings.medium),
                          _buildSelections(appState, cubit),
                          const Spacing(Spacings.xxLarge),
                          const Spacing(Spacings.xxLarge),
                          const Spacing(Spacings.xxLarge),
                          const Spacing(Spacings.xxLarge),
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

  _buildSelections(AppState appState, WidgetTestCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selections',
          style: FontStyles.style(
            FontSizes.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(Spacings.medium),
        EssentialSwitch(
          label: 'Adaptive Switch',
          value: cubit.state.props[0] as bool,
          onChange: (res) => cubit.updateSwitch(res),
        ),
        const Spacing(Spacings.medium),
        EssentialCheckbox(
          label: 'Adaptive Checkbox',
          value: cubit.state.props[1] as bool,
          onChange: (res) => cubit.updateCheckbox(res),
        ),
        const Spacing(Spacings.medium),
        Row(
          children: [
            EssentialRadio<String>(
              groupValue: cubit.state.props[2] as String,
              value: 'Yes',
              onChange: (res) => cubit.updateRadio(res),
            ),
            const Spacing(Spacings.medium),
            EssentialRadio<String>(
              groupValue: cubit.state.props[2] as String,
              value: 'No',
              onChange: (res) => cubit.updateRadio(res),
            ),
            const Spacing(Spacings.medium),
            EssentialRadio<String>(
              groupValue: cubit.state.props[2] as String,
              value: 'Maybe',
              onChange: (res) => cubit.updateRadio(res),
            ),
          ],
        ),
        const Spacing(Spacings.large),
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
            FontSizes.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(Spacings.medium),
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
        const Spacing(Spacings.medium),
        const SizedBox(
            width: Sizes.spacingXXL,
            height: Sizes.spacingXXL,
            child: EssentialSpinner()),
        const Spacing(Spacings.medium),
        const SizedBox(
            width: double.maxFinite,
            height: Sizes.spacingXXL,
            child: EssentialLineLoader()),
        const Spacing(Spacings.medium),
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
            const Spacing(Spacings.medium),
            EssentialButton(
              label: 'Line Overlay',
              onTap: () async {
                EssentialOverlayLoader.showLoader(
                    loaderType: OverlayLoaderTypes.line);
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

  _buildTheme(AppState appState, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Theme',
          style: FontStyles.style(
            FontSizes.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(Spacings.medium),
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
            FontSizes.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Primary Button',
          onTap: () => (),
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Disabled Primary Button',
          onTap: () => (),
          isEnabled: false,
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Expanded = false',
          onTap: () => (),
          isExpanded: false,
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Primary Button',
          onTap: () => (),
          isLoading: true,
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Secondary Button',
          onTap: () => (),
          type: ButtonTypes.secondary,
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Danger Button',
          onTap: () => (),
          type: ButtonTypes.danger,
        ),
        const Spacing(Spacings.medium),
        EssentialButton(
          label: 'Text Only',
          onTap: () => (),
          type: ButtonTypes.textOnly,
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
            FontSizes.titleBold,
            textColor: appState.colors.primaryColor,
          ),
        ),
        const Spacing(Spacings.medium),
        Row(
          children: [
            Expanded(
              child: Text(
                'Title',
                style: FontStyles.style(
                  FontSizes.title,
                ),
              ),
            ),
            const Spacing(Spacings.xSmall),
            Expanded(
              child: Text(
                'Title Bold',
                style: FontStyles.style(
                  FontSizes.titleBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(Spacings.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Heading',
                style: FontStyles.style(
                  FontSizes.heading,
                ),
              ),
            ),
            const Spacing(Spacings.xSmall),
            Expanded(
              child: Text(
                'Heading Bold',
                style: FontStyles.style(
                  FontSizes.headingBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(Spacings.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Body Large',
                style: FontStyles.style(
                  FontSizes.bodyLarge,
                ),
              ),
            ),
            const Spacing(Spacings.xSmall),
            Expanded(
              child: Text(
                'Body Large Bold',
                style: FontStyles.style(
                  FontSizes.bodyLargeBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(Spacings.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Body',
                style: FontStyles.style(
                  FontSizes.body,
                ),
              ),
            ),
            const Spacing(Spacings.xSmall),
            Expanded(
              child: Text(
                'Body Bold',
                style: FontStyles.style(
                  FontSizes.bodyBold,
                ),
              ),
            ),
          ],
        ),
        const Spacing(Spacings.xSmall),
        Row(
          children: [
            Expanded(
              child: Text(
                'Label',
                style: FontStyles.style(
                  FontSizes.label,
                ),
              ),
            ),
            const Spacing(Spacings.xSmall),
            Expanded(
              child: Text(
                'Label Bold',
                style: FontStyles.style(
                  FontSizes.labelBold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
