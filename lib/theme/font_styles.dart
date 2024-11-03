part of 'theme.dart';

class FontStyles {
  static TextStyle style(FontSizes size, {Color? textColor}) {
    var sizes = _getFontSize(size);
    return TextStyle(
      fontSize: sizes.$1,
      fontWeight: sizes.$2,
      color: textColor,
    );
  }

  static (double, FontWeight) _getFontSize(FontSizes size) {
    switch (size) {
      case FontSizes.title:
        return (Sizes.fontSizeXXL, FontWeight.w400);
      case FontSizes.titleBold:
        return (Sizes.fontSizeXXL, FontWeight.w600);
      case FontSizes.heading:
        return (Sizes.fontSizeXL, FontWeight.w400);
      case FontSizes.headingBold:
        return (Sizes.fontSizeXL, FontWeight.w600);
      case FontSizes.bodyLarge:
        return (Sizes.fontSizeL, FontWeight.w400);
      case FontSizes.bodyLargeBold:
        return (Sizes.fontSizeL, FontWeight.w600);
      case FontSizes.body:
        return (Sizes.fontSizeM, FontWeight.w400);
      case FontSizes.bodyBold:
        return (Sizes.fontSizeM, FontWeight.w600);
      case FontSizes.label:
        return (Sizes.fontSizeS, FontWeight.w400);
      case FontSizes.labelBold:
        return (Sizes.fontSizeS, FontWeight.w600);
      default:
        throw ("Invalid or unhandled type");
    }
  }
}
//   /* INPUT DECORATIONS */
//   static InputDecoration inputDecoration({
//     required AlbiInputType type,
//     required String label,
//     required String errorMessage,
//     required Color labelColor,
//     required bool fill,
//     required Color fillColor,
//     required Color errorColor,
//     required Color errorBorderColor,
//     required Color borderColor,
//     required Color focusedBorderColor,
//     required Color disabledBorderColor,
//     required Color errorFocusedBorderColor,
//     bool hasLeadingIcon = false,
//   }) {
//     double left = Sizes.inputHeight,
//         right = Sizes.inputHeight,
//         bottom = Sizes.inputHeight,
//         top = Sizes.inputHeight;

//     if (hasLeadingIcon) {
//       left = Sizes.inputHeight;
//       top = right = bottom = 0;
//     } else {
//       left = right = bottom = Sizes.inputPadding;
//       top = 40;
//     }

//     return InputDecoration(
//       labelText: label,
//       labelStyle: regular(textColor: labelColor),
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       contentPadding: EdgeInsets.only(
//         left: left,
//         right: right,
//         bottom: bottom,
//         top: top,
//       ),
//       filled: fill,
//       fillColor: fillColor,
//       errorStyle: inputError(textColor: errorColor),
//       errorText: errorMessage.isNotEmpty ? errorMessage : null,
//       errorBorder: inputBorder(errorBorderColor),
//       focusedBorder: inputBorder(focusedBorderColor),
//       enabledBorder: inputBorder(borderColor),
//       disabledBorder: inputBorder(disabledBorderColor),
//       focusedErrorBorder: inputBorder(errorFocusedBorderColor),
//     );
//   }

//   static InputDecoration dateTimeInputDecoration({
//     required String label,
//     required String errorMessage,
//     required Color labelColor,
//     required bool fill,
//     required Color fillColor,
//     required Color errorColor,
//     required Color errorBorderColor,
//     required Color borderColor,
//     required Color focusedBorderColor,
//     required Color disabledBorderColor,
//     required Color errorFocusedBorderColor,
//   }) {
//     double left = Sizes.inputPadding,
//         right = Sizes.inputPadding,
//         bottom = Sizes.inputPadding,
//         top = 40;

//     return InputDecoration(
//       labelText: label,
//       labelStyle: regular(textColor: labelColor),
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       contentPadding: EdgeInsets.only(
//         left: left,
//         right: right,
//         bottom: bottom,
//         top: top,
//       ),
//       filled: fill,
//       fillColor: fillColor,
//       errorStyle: inputError(textColor: errorColor),
//       errorText: errorMessage.isNotEmpty ? errorMessage : null,
//       errorBorder: inputBorder(errorBorderColor),
//       focusedBorder: inputBorder(focusedBorderColor),
//       enabledBorder: inputBorder(borderColor),
//       disabledBorder: inputBorder(disabledBorderColor),
//       focusedErrorBorder: inputBorder(errorFocusedBorderColor),
//     );
//   }

//   static InputDecoration dateAndTimeInputDecoration({
//     required String label,
//     required String errorMessage,
//     required Color labelColor,
//     required bool fill,
//     required Color fillColor,
//     required Color errorColor,
//     required Color errorBorderColor,
//     required Color borderColor,
//     required Color focusedBorderColor,
//     required Color disabledBorderColor,
//     required Color errorFocusedBorderColor,
//   }) {
//     double left = Sizes.inputPadding,
//         right = Sizes.inputPadding,
//         bottom = Sizes.inputPadding,
//         top = 40;

//     return InputDecoration(
//       labelText: label,
//       labelStyle: regular(textColor: labelColor),
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       contentPadding: EdgeInsets.only(
//         left: left,
//         right: right,
//         bottom: bottom,
//         top: top,
//       ),
//       filled: fill,
//       fillColor: fillColor,
//       errorStyle: inputError(textColor: errorColor),
//       errorText: errorMessage.isNotEmpty ? errorMessage : null,
//       errorBorder: inputBorder(errorBorderColor),
//       focusedBorder: inputBorder(focusedBorderColor),
//       enabledBorder: inputBorder(borderColor),
//       disabledBorder: inputBorder(disabledBorderColor),
//       focusedErrorBorder: inputBorder(errorFocusedBorderColor),
//     );
//   }

//   /* BORDERS */
//   static InputBorder inputBorder(Color borderColor) {
//     return OutlineInputBorder(
//       borderRadius: const BorderRadius.all(
//         Radius.circular(Sizes.inputBorderRadius),
//       ),
//       borderSide: BorderSide(
//         color: borderColor,
//       ),
//     );
//   }
// }
