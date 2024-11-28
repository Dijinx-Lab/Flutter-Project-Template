part of '../components.dart';

class EssentialButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final ButtonType type;
  final bool isLoading;
  final bool isExpanded;
  final bool isEnabled;
  final Haptics? haptic;
  final ComponentStyle componentStyle;

  const EssentialButton({
    super.key,
    required this.label,
    required this.onTap,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.isExpanded = true,
    this.isEnabled = true,
    this.haptic = Haptics.selection,
    this.componentStyle = ComponentStyle.adaptive,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: !isEnabled || isLoading,
          child: SizedBox(
              height: Sizes.buttonHeight,
              width: isExpanded ? double.maxFinite : null,
              child: _buildComponent(state, context)),
        );
      },
    );
  }

  Widget _buildComponent(AppState state, BuildContext context) {
    switch (componentStyle) {
      case ComponentStyle.adaptive:
        {
          final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;
          return isCupertino
              ? _buildCupertinoButton(state)
              : _buildMaterialButton(state);
        }
      case ComponentStyle.material:
        return _buildMaterialButton(state);
      case ComponentStyle.cupertino:
        return _buildCupertinoButton(state);
      default:
        throw Exception("Invalid or unhandled type");
    }
  }

  _buildCupertinoButton(AppState state) {
    return CupertinoButton(
      onPressed: () => _onTap(),
      padding: _getPadding(),
      color: _getCupertinoBackgroundColor(state),
      pressedOpacity: 0.7,
      borderRadius: BorderRadius.circular(Sizes.buttonBorderRadius),
      child: _buildChild(state),
    );
  }

  _buildMaterialButton(AppState state) {
    return ElevatedButton(
      onPressed: () => _onTap(),
      style: _getButtonStyle(state),
      child: _buildChild(state),
    );
  }

  Widget _buildChild(AppState state) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: isLoading
          ? EssentialSpinner(
              componentStyle: componentStyle,
              color: _getTextColor(state).withOpacity(isEnabled ? 1 : 0.8),
            )
          : Text(
              label,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: FontStyles.style(
                FontSize.bodyBold,
                textColor:
                    _getTextColor(state).withOpacity(isEnabled ? 1 : 0.8),
              ),
            ),
    );
  }

  Color _getTextColor(AppState appState) {
    switch (type) {
      case ButtonType.primary:
        return appState.colors.primaryButtonText;

      case ButtonType.secondary:
        return appState.colors.secondaryButtonText;

      case ButtonType.danger:
        return appState.colors.dangerButtonText;

      case ButtonType.textOnly:
        return appState.colors.textButtonText;
      default:
        throw Exception('Invalid or unhandled type');
    }
  }

  ButtonStyle _getButtonStyle(AppState appState) {
    Color backgroundColor;
    Color overlayColor;
    Color borderColor;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = appState.colors.primaryButton;
        overlayColor = appState.colors.primaryButtonText.withOpacity(0.3);
        borderColor = appState.colors.primaryButtonBorder;
        break;

      case ButtonType.secondary:
        backgroundColor = appState.colors.secondaryButton;
        overlayColor = appState.colors.secondaryButtonText.withOpacity(0.3);
        borderColor = appState.colors.secondaryButtonBorder;
        break;

      case ButtonType.danger:
        backgroundColor = appState.colors.dangerButton;
        overlayColor = appState.colors.dangerButtonText.withOpacity(0.3);
        borderColor = appState.colors.dangerButtonBorder;
        break;

      case ButtonType.textOnly:
        backgroundColor = appState.colors.textButton;
        overlayColor = appState.colors.textButtonText.withOpacity(0.3);
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
          if (!isEnabled || type == ButtonType.textOnly) {
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
      case ButtonType.primary:
        backgroundColor = appState.colors.primaryButton;
        break;

      case ButtonType.secondary:
        backgroundColor =
            appState.colors.secondaryButtonBorder.withOpacity(0.2);
        break;

      case ButtonType.danger:
        backgroundColor = appState.colors.dangerButton;
        break;

      case ButtonType.textOnly:
        backgroundColor = appState.colors.textButton;
        break;
    }

    if (!isEnabled) {
      backgroundColor = backgroundColor.withOpacity(0.6);
    }
    return backgroundColor;
  }

  _onTap() {
    if (!isLoading && isEnabled) {
      if (haptic != null) {
        HapticUtil.trigger(haptic!);
      }
      onTap();
    }
  }
}
