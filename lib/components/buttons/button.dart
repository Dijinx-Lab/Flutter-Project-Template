part of 'buttons.dart';

class EssentialButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final ButtonTypes type;
  final bool isLoading;
  final bool isExpanded;
  final bool isEnabled;
  final Haptics? haptic;

  const EssentialButton({
    super.key,
    required this.label,
    required this.onTap,
    this.type = ButtonTypes.primary,
    this.isLoading = false,
    this.isExpanded = true,
    this.isEnabled = true,
    this.haptic = Haptics.selection,
  });

  @override
  Widget build(BuildContext context) {
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: !isEnabled || isLoading,
          child: SizedBox(
            height: Sizes.buttonHeight,
            width: isExpanded ? double.maxFinite : null,
            child: isCupertino
                ? CupertinoButton(
                    onPressed: () {
                      if (!isLoading && !isLoading) onTap();
                    },
                    padding: _getPadding(),
                    color: _getCupertinoBackgroundColor(state),
                    pressedOpacity: 0.7,
                    borderRadius:
                        BorderRadius.circular(Sizes.buttonBorderRadius),
                    child: _buildChild(state),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (!isLoading && !isLoading) {
                        if (haptic != null) {
                          HapticUtil.trigger(haptic!);
                        }
                        onTap();
                      }
                    },
                    style: _getButtonStyle(state),
                    child: _buildChild(state),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildChild(AppState state) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: isLoading
          ? EssentialSpinner(
              color: _getTextColor(state).withOpacity(isEnabled ? 1 : 0.8),
            )
          : Text(
              label,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: FontStyles.style(
                FontSizes.bodyBold,
                textColor:
                    _getTextColor(state).withOpacity(isEnabled ? 1 : 0.8),
              ),
            ),
    );
  }

  Color _getTextColor(AppState appState) {
    switch (type) {
      case ButtonTypes.primary:
        return appState.colors.primaryButtonText;

      case ButtonTypes.secondary:
        return appState.colors.secondaryButtonText;

      case ButtonTypes.danger:
        return appState.colors.dangerButtonText;

      case ButtonTypes.textOnly:
        return appState.colors.textButtonText;
      default:
        throw Exception('Invalid type');
    }
  }

  ButtonStyle _getButtonStyle(AppState appState) {
    Color backgroundColor;
    Color overlayColor;
    Color borderColor;

    switch (type) {
      case ButtonTypes.primary:
        backgroundColor = appState.colors.primaryButton;
        overlayColor = appState.colors.primaryButtonWater;
        borderColor = appState.colors.primaryButtonBorder;
        break;

      case ButtonTypes.secondary:
        backgroundColor = appState.colors.secondaryButton;
        overlayColor = appState.colors.secondaryButtonWater;
        borderColor = appState.colors.secondaryButtonBorder;
        break;

      case ButtonTypes.danger:
        backgroundColor = appState.colors.dangerButton;
        overlayColor = appState.colors.dangerButtonWater;
        borderColor = appState.colors.dangerButtonBorder;
        break;

      case ButtonTypes.textOnly:
        backgroundColor = appState.colors.textButton;
        overlayColor = appState.colors.textButtonWater;
        borderColor = appState.colors.textButtonBorder;
        break;
    }

    if (!isEnabled) {
      backgroundColor = backgroundColor.withOpacity(0.6);
      borderColor = backgroundColor.withOpacity(0.6);
    }

    return ButtonStyle(
      padding: WidgetStateProperty.resolveWith<EdgeInsets>(
        (Set<WidgetState> states) {
          return _getPadding();
        },
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
        (Set<WidgetState> states) {
          if (!isEnabled || type == ButtonTypes.textOnly) {
            return 0;
          }
          return Sizes.buttonElevation;
        },
      ),
      overlayColor: WidgetStateProperty.all(overlayColor),
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(Sizes.buttonBorderRadius),
        ),
      ),
    );
  }

  EdgeInsets _getPadding() {
    return EdgeInsets.symmetric(
      horizontal: !isExpanded
          ? Sizes.buttonHorizontalPaddingS
          : Sizes.buttonHorizontalPaddingL,
    );
  }

  Color _getCupertinoBackgroundColor(AppState appState) {
    Color backgroundColor;
    switch (type) {
      case ButtonTypes.primary:
        backgroundColor = appState.colors.primaryButton;
        break;

      case ButtonTypes.secondary:
        backgroundColor =
            appState.colors.secondaryButtonBorder.withOpacity(0.2);
        break;

      case ButtonTypes.danger:
        backgroundColor = appState.colors.dangerButton;
        break;

      case ButtonTypes.textOnly:
        backgroundColor = appState.colors.textButton;
        break;
    }

    if (!isEnabled) {
      backgroundColor = backgroundColor.withOpacity(0.6);
    }
    return backgroundColor;
  }
}
