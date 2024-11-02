import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_template/app/bloc/app_bloc.dart';
import 'package:mobile_template/components/buttons/buttons.dart';
import 'package:mobile_template/components/loaders/loaders.dart';
import 'package:mobile_template/components/selections/selections.dart';
import 'package:mobile_template/components/spacings/spacing.dart';
import 'package:mobile_template/constants/constants.dart';
import 'package:mobile_template/theme/theme.dart';

class WidgetTestScreen extends StatelessWidget {
  const WidgetTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: Paddings.getHorizontalInsets(context),
              child: SingleChildScrollView(
                child: Column(
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
                    const Spacing(Spacings.xxLarge),
                    const Spacing(Spacings.xxLarge),
                    const Spacing(Spacings.xxLarge),
                    const Spacing(Spacings.xxLarge),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
        // const Spacing(Spacings.medium),
        // const SizedBox(
        //     width: Sizes.spacingXXL,
        //     height: Sizes.spacingXXL,
        //     child: AdaptiveLoader()),
        // const Spacing(Spacings.medium),
        // const SizedBox(
        //     width: double.maxFinite,
        //     height: Sizes.spacingXXL,
        //     child: LineLoader()),
        // const Spacing(Spacings.medium),
        // Row(
        //   children: [
        //     Button(
        //       label: 'Circular Overlay',
        //       onTap: () async {
        //         OverlayLoader.showLoader();
        //         await Future.delayed(const Duration(seconds: 3));
        //         OverlayLoader.dismiss();
        //       },
        //       isExpanded: false,
        //     ),
        //     const Spacing(Spacings.medium),
        //     Button(
        //       label: 'Line Overlay',
        //       onTap: () async {
        //         OverlayLoader.showLoader(loaderType: OverlayLoaderTypes.line);
        //         await Future.delayed(const Duration(seconds: 3));
        //         OverlayLoader.dismiss();
        //       },
        //       isExpanded: false,
        //     ),
        //   ],
        // ),
        const Spacing(Spacings.medium),
        Row(
          children: [
            SkeletonLoader.circle(radius: 30),
            SkeletonLoader.text(margin: EdgeInsets.only(left: Sizes.spacingM)),
          ],
        ),
        SkeletonLoader.rect(
            width: double.maxFinite,
            height: 100,
            margin: EdgeInsets.only(top: Sizes.spacingM)),
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
        Row(
          children: [
            Text(
              'Dark Mode',
              style: FontStyles.style(
                FontSizes.body,
              ),
            ),
            const Spacing(Spacings.medium),
            AppSwitch(
              value: appState.themeData.brightness == Brightness.dark,
              onChange: (res) {
                context
                    .read<AppBloc>()
                    .setTheme(res ? AppTheme.dark : AppTheme.light);
              },
            )
          ],
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
        Button(
          label: 'Primary Button',
          onTap: () => (),
        ),
        const Spacing(Spacings.medium),
        Button(
          label: 'Disabled Primary Button',
          onTap: () => (),
          isEnabled: false,
        ),
        const Spacing(Spacings.medium),
        Button(
          label: 'Expanded = false',
          onTap: () => (),
          isExpanded: false,
        ),
        const Spacing(Spacings.medium),
        Button(
          label: 'Primary Button',
          onTap: () => (),
          isLoading: true,
        ),
        const Spacing(Spacings.medium),
        Button(
          label: 'Secondary Button',
          onTap: () => (),
          type: ButtonTypes.secondary,
        ),
        const Spacing(Spacings.medium),
        Button(
          label: 'Danger Button',
          onTap: () => (),
          type: ButtonTypes.danger,
        ),
        const Spacing(Spacings.medium),
        Button(
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
