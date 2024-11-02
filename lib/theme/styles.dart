// part of 'theme.dart';

// class Styles {
//   /* TEXT STYLES */
//   static TextStyle title({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeLarge,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

//   static TextStyle titleBold({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeLarge,
//         fontWeight: FontWeight.w600,
//         color: textColor,
//       );

//   static TextStyle mediumTitle({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeMedium,
//         fontWeight: FontWeight.w600,
//         color: textColor,
//       );

//   static TextStyle navbarTitle({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeMedium,
//         fontWeight: FontWeight.w600,
//         color: textColor,
//       );

//   static TextStyle regular({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeRegular,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

//   static TextStyle regularBold({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeRegular,
//         fontWeight: FontWeight.w600,
//         color: textColor,
//       );

//   static TextStyle regularItalic({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeRegular,
//         fontWeight: FontWeight.w400,
//         fontStyle: FontStyle.italic,
//         color: textColor,
//       );

//   static TextStyle subtext({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeSmall,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

//   static TextStyle subtextBold({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeSmall,
//         fontWeight: FontWeight.w600,
//         color: textColor,
//       );

//   static TextStyle smallNote({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeExtraSmall,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

//   static TextStyle inputRegular({Color? textColor}) => TextStyle(
//         fontSize: Sizes.inputFontSize,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

//   static TextStyle inputError({Color? textColor}) => TextStyle(
//         fontSize: Sizes.inputErrorFontSize,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

//   static TextStyle buttonText({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeSmall,
//         fontWeight: FontWeight.w600,
//         color: textColor,
//       );
//   static TextStyle linkText({Color? textColor}) => TextStyle(
//         fontSize: Sizes.fontSizeSmall,
//         fontWeight: FontWeight.w400,
//         color: textColor,
//       );

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
