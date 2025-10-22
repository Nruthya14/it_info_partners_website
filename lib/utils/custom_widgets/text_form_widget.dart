import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

Widget buildTextFormField({
  required BuildContext context,
  required String label,
  required String hint,
  required TextInputType textType,
  String? Function(String?)? validator,
  AutovalidateMode? autoValidateMode,
  String? initialValue,
  int? maxLines = 1,
  int? maxLength,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? suffix,
  double? cursorHeight,
  IconData? datePickerIcon,
  TextEditingController? controller,
  List<TextInputFormatter>? inputTextFormatter,
  FocusNode? focusNode,
  EdgeInsetsGeometry? margin1,
  bool isMarginRequired = false,
  bool changeAutoValidateMode = false,
  bool isMandatory = false,
  bool enabled = true,
  bool isDateRequired = false,
  bool isTimeRequired = false,
  bool readOnly = false,
  bool isRowUsed = false,
  bool isUpperCase = false,
  bool obscureText = false,
  bool isNumeric = false,
  bool isAddress = false,
  Key? key,
  TextInputAction? textInputAction,
  void Function(String value)? onChanged,
  void Function()? dateFunction,
  void Function()? timeFunction,
  void Function()? onEditingComplete,
  void Function()? onTap,
  void Function(String)? onFieldSubmitted,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double? labelFontSize;
      double? hintFontSize;
      double? errorFontSize;
      double? iconSize;
      EdgeInsetsGeometry? margin;
      EdgeInsetsGeometry? padding;
      EdgeInsetsGeometry dateIconPadding = EdgeInsets.zero;
      EdgeInsetsGeometry? contentPadding;

      if (!kIsWeb) {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 10.sp;
          hintFontSize = 10.sp;
          errorFontSize = 10.sp;
          iconSize = 24.sp;
          margin = EdgeInsets.only(bottom: 8.h, top: 8.h);
          padding = EdgeInsets.fromLTRB(16.h, 0.w, 16.h, 0.w);
          contentPadding = EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w);
          dateIconPadding = EdgeInsets.only(right: 10.w);
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 14;
          hintFontSize = 14;
          errorFontSize = 10.sp;
          iconSize = 8.sp;
          margin = EdgeInsets.only(bottom: 6.h, top: 6.h);
          padding = EdgeInsets.zero;
          contentPadding = EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w);
          dateIconPadding = EdgeInsets.only(right: 8.w);
        }
      } else {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 6.sp;
          hintFontSize = 6.sp;
          errorFontSize = 6.sp;
          iconSize = 8.sp;
          margin = EdgeInsets.only(bottom: 8.h, top: 8.h);
          padding = EdgeInsets.zero;
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 4.sp;
          hintFontSize = 4.sp;
          errorFontSize = 4.sp;
          iconSize = 8.sp;
          margin = EdgeInsets.only(bottom: 8.h, top: 8.h);
          padding = EdgeInsets.zero;
          dateIconPadding = EdgeInsets.only(right: 2.w);
        }
      }

      return Container(
        margin: isMarginRequired ? margin1 : margin,
        padding: isRowUsed ? EdgeInsets.zero : padding,
        child: TextFormField(
          enableInteractiveSelection: true,
          textInputAction: textInputAction,
          key: key,
          cursorHeight: cursorHeight,
          onEditingComplete: onEditingComplete,
          style: TextStyle(color: graphite, fontSize: labelFontSize, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
          autovalidateMode: changeAutoValidateMode ? autoValidateMode : AutovalidateMode.onUserInteraction,
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          enabled: enabled,
          textAlign: TextAlign.left,
          keyboardType: isDateRequired ? null : textType,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
          readOnly: readOnly,
          //enableInteractiveSelection: allowCopyText,
          maxLength: maxLength,
          focusNode: focusNode,
          obscureText: obscureText,
          inputFormatters: [
            if (inputTextFormatter != null) ...inputTextFormatter,
            if (isUpperCase) UpperCaseTextFormatter(),
            if (isNumeric) FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            if (isAddress) FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s,.\-/]')),
          ],
          onTap:
              onTap ??
              () {
                if (isDateRequired && dateFunction != null) {
                  dateFunction();
                }
                if (isTimeRequired && timeFunction != null) {
                  timeFunction();
                }
              },
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: prefixIcon,
            contentPadding: contentPadding,
            errorStyle: TextStyle(
              color: Colors.red.shade400,
              fontSize: errorFontSize,
              fontWeight: FontWeight.w400,
              // overflow: TextOverflow.visible,
            ),
            isDense: true,
            label: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: TextStyle(
                      color: graphite,
                      fontSize: labelFontSize,
                      fontWeight: FontWeight.w400,
                      //overflow: TextOverflow.ellipsis,
                      letterSpacing: 0.15,
                    ),
                  ),
                  if (isMandatory)
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red.shade400, fontSize: labelFontSize, fontWeight: FontWeight.w400, letterSpacing: 0.15),
                    ),
                ],
              ),
            ),
            hintText: hint,
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              color: graphite,
              fontSize: hintFontSize,
              fontWeight: FontWeight.w400,
              //overflow: TextOverflow.ellipsis,
            ),
            suffixIcon: (isDateRequired || isTimeRequired)
                ? Padding(
                    padding: dateIconPadding,
                    child: Icon(datePickerIcon, size: iconSize),
                  )
                : suffixIcon,
            suffixIconConstraints: BoxConstraints(minHeight: 8.h),
            suffix: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(color: graphite),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(color: graphite),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(color: graphite),
            ),
          ),
        ),
      );
    },
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
