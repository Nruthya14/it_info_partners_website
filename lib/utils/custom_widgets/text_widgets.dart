import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

Widget buildText(
  String text,
  AlignmentGeometry? alignment, {
  isColorChanged = false,
  isMarginRequired = false,
  isBoldRequired = false,
  isSizeRequired = false,
  isLoginPage = false,
  isFontStyleRequired = false,
  FontStyle? fontStyle,
  double? fontSize,
  TextAlign? textAlign,
  Color? textColor,
  EdgeInsetsGeometry? margin1,
  int? maxLines,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double? labelFontSize;
      EdgeInsetsGeometry? margin;

      if (!kIsWeb) {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 14.sp;
          margin = EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h);
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 10.sp;
        }
      } else if (kIsWeb) {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 5.sp;
          margin = EdgeInsets.only(bottom: 14.h);
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 4.sp;
          margin = EdgeInsets.only(bottom: 14.h);
        }
      }
      return Container(
        alignment: alignment,
        margin: isMarginRequired ? margin1 : margin,
        child: Text(
          text,
          softWrap: true,
          maxLines: maxLines,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: isColorChanged ? textColor : graphite,
            fontSize: isSizeRequired ? fontSize : labelFontSize,
            fontWeight: isBoldRequired ? FontWeight.w600 : FontWeight.w400,
            fontStyle: isFontStyleRequired ? fontStyle : FontStyle.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    },
  );
}
