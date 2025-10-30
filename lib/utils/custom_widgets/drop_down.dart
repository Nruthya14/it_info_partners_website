import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

Widget buildDropDown<T>({
  required BuildContext context,
  required String label,
  required String hint,
  required T? value,
  required List<DropdownMenuItem<T>>? items,
  required void Function(T?)? onChanged,
  bool isMandatory = false,
  AutovalidateMode? autoValidateMode,
  bool isRowUsed = false,
  bool changeAutoValidateMode = false,
  String? Function(T?)? validator,
  bool? isEnabled,
  EdgeInsets? margin,
  EdgeInsets? padding,
  FocusNode? focusNode,
  double? width,
  DropdownButtonBuilder? selectedItemBuilder,
  bool isItemHeightRequired = false,
  double itemHeight = 0,
  Key? key,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final double dropdownWidth = constraints.maxWidth;
      final double dropdownHeight = constraints.maxHeight;
      EdgeInsetsGeometry? contentPadding;
      EdgeInsets? margin;
      double labelFontSize = 0.0;
      double hintFontSize = 0.0;
      double iconSize = 0.0;
      double menuItemHeight = 0;
      EdgeInsetsGeometry? menuItemPadding;
      EdgeInsetsGeometry? padding;

      if (!kIsWeb) {
        if (ScreenUtil().screenWidth < 600) {
          contentPadding = EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w);
          labelFontSize = 12.sp;
          hintFontSize = 12.sp;
          iconSize = 24.sp;
          margin = EdgeInsets.only(bottom: 8.h, top: 8.h);
          menuItemHeight = 40;
          //menuItemPadding = EdgeInsets.only(left: 6.w);
          padding = EdgeInsets.fromLTRB(16.h, 0.w, 16.h, 0.w);
        } else if (ScreenUtil().screenWidth >= 600) {
          contentPadding = EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w);
          labelFontSize = 10.sp;
          hintFontSize = 10.sp;
          iconSize = 20.sp;
          margin = EdgeInsets.only(bottom: 6.h, top: 6.h);
          menuItemHeight = isItemHeightRequired ? 30 : itemHeight;
          menuItemPadding = EdgeInsets.only(left: 10.w);
          padding = EdgeInsets.zero;
        }
      } else {
        if (ScreenUtil().screenWidth < 600) {
          contentPadding = EdgeInsets.symmetric(vertical: 12.h, horizontal: 2.w);
          labelFontSize = 6.sp;
          hintFontSize = 6.sp;
          iconSize = 11.sp;
          margin = EdgeInsets.only(bottom: 8.h, top: 8.h);
          //menuItemHeight = 50;
          menuItemHeight = isItemHeightRequired ? itemHeight : 30;
          //menuItemPadding = EdgeInsets.only(left: 20.w);
          padding = EdgeInsets.zero;
        } else if (ScreenUtil().screenWidth >= 600) {
          contentPadding = EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);
          labelFontSize = 4.sp;
          hintFontSize = 4.sp;
          iconSize = 10.sp;
          margin = EdgeInsets.only(bottom: 8.h, top: 8.h);
          // menuItemHeight = 45;
          menuItemHeight = isItemHeightRequired ? itemHeight : 40;
          //menuItemPadding = EdgeInsets.only(left: 10.w);
          padding = EdgeInsets.zero;
        }
      }

      return Container(
        margin: margin,
        padding: isRowUsed ? EdgeInsets.zero : padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: dropdownWidth, maxHeight: dropdownHeight),
          child: DropdownButtonFormField2<T>(
            key: key,
            isExpanded: true,
            alignment: Alignment.centerLeft,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.red, fontSize: labelFontSize, overflow: TextOverflow.visible),
              isCollapsed: true,
              contentPadding: contentPadding,
              label: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: TextStyle(color: graphite, fontSize: labelFontSize, letterSpacing: 0.15.w),
                    ),
                    if (isMandatory)
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: Colors.red, fontSize: labelFontSize, letterSpacing: 0.15.w),
                      ),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(color: grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                borderSide: const BorderSide(color: grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                borderSide: const BorderSide(color: grey),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: graphite, fontSize: hintFontSize, fontWeight: FontWeight.normal),
            ),
            value: value,
            items: items,
            validator: validator,
            onChanged: onChanged,
            autovalidateMode: changeAutoValidateMode ? autoValidateMode : AutovalidateMode.onUserInteraction,
            iconStyleData: IconStyleData(
              icon: const Icon(Icons.arrow_drop_down, color: graphite),
              iconSize: iconSize,
            ),
            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -4),
              //padding: EdgeInsets.only(left: 2.w),
              maxHeight: 200.h,
              elevation: 0,
              decoration: BoxDecoration(
                border: Border.all(color: grey),
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(height: menuItemHeight, padding: menuItemPadding),
          ),
        ),
      );
    },
  );
}
