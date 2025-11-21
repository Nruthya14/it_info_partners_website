import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';
import 'package:responsive_builder/responsive_builder.dart';

Widget buildButton(String text, void Function()? onPressed, {bool isDisabled = false, bool isMarginRequired = false, bool isColorRequired = false, Color? color}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double? labelFontSize;
      double radius = 0;
      EdgeInsets? padding;
      EdgeInsets? margin;

      if (!kIsWeb) {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 12.sp;
          padding = EdgeInsets.symmetric(horizontal: 12.w);
          radius = 6.sp;
          margin = EdgeInsets.only(bottom: 20.h);
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 8.sp;
          padding = EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h);
          radius = 6;
          margin = EdgeInsets.only(bottom: 20.h);
        }
      } else {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 6.sp;
          padding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h);
          radius = 6;
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 4.sp;
          padding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h);
          radius = 6;
          margin = const EdgeInsets.only(bottom: 0);
        }
      }
      return Container(
        margin: isMarginRequired ? EdgeInsets.zero : margin,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isColorRequired ? color : purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              padding: padding,
            ),
            onPressed: isDisabled ? null : onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: whiteSmoke, fontSize: labelFontSize, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    },
  );
}

Widget buildWhiteButton(String text, void Function()? onPressed, {bool isDisabled = false, bool isMarginRequired = false}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double? labelFontSize;
      double radius = 0;
      EdgeInsets? padding;
      EdgeInsets? margin;

      if (!kIsWeb) {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 12.sp;
          padding = EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h);
          radius = 6.sp;
          margin = EdgeInsets.only(bottom: 20.h);
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 8.sp;
          //padding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h);
          radius = 6;
          margin = EdgeInsets.only(bottom: 20.h);
        }
      } else {
        if (ScreenUtil().screenWidth < 600) {
          labelFontSize = 4.sp;
          padding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h);
          radius = 6;
        } else if (ScreenUtil().screenWidth >= 600) {
          labelFontSize = 4.sp;
          padding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h);
          radius = 6;
          margin = const EdgeInsets.only(bottom: 0);
        }
      }
      return Container(
        margin: isMarginRequired ? EdgeInsets.zero : margin,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: whiteSmoke,
              side: const BorderSide(color: purple),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              padding: padding,
            ),
            onPressed: isDisabled ? null : onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: purple, fontSize: labelFontSize, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    },
  );
}

Widget buildButton1(String text, void Function()? onPressed, {bool isDisabled = false, bool isMarginRequired = false, bool isColorRequired = false, Color? color}) {
  return ResponsiveBuilder(
    builder: (context, sp) {
      double? labelFontSize;
      double radius = 0;
      EdgeInsets? padding;
      EdgeInsets? margin;

      if (sp.deviceScreenType == DeviceScreenType.desktop) {
        labelFontSize = 3.5.sp;
        //padding = EdgeInsets.symmetric(horizontal: 12.w);
        radius = 2.sp;
        //margin = EdgeInsets.only(bottom: 20.h);
      }
      if (sp.deviceScreenType == DeviceScreenType.tablet) {
        labelFontSize = 8.sp;
        padding = EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h);
        radius = 6;
        //margin = EdgeInsets.only(bottom: 20.h);
      }
      if (sp.deviceScreenType == DeviceScreenType.mobile) {
        labelFontSize = 8.sp;
        padding = EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h);
        radius = 6;
        //margin = EdgeInsets.only(bottom: 20.h);
      }
      return Container(
        margin: isMarginRequired ? EdgeInsets.zero : margin,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isColorRequired ? color : purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              padding: padding,
            ),
            onPressed: isDisabled ? null : onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: whiteSmoke, fontSize: labelFontSize, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    },
  );
}
