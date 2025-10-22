import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

//Navigation Bar
Widget buildNavigationBar({required BuildContext context}) {
  List<String> navItems = ['HOME', 'ABOUT', 'SERVICES', 'WORKSHOPS', 'CONTACT'];

  return LayoutBuilder(
    builder: (context, constraints) {
      double font = ScreenUtil().scaleWidth > 600 ? 12.sp : 4.sp;

      return Container(
        color: Colors.purple.shade100,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navItems.map((item) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (item == 'HOME') {
                      // Navigator.pushNamed(context, RouteNames.dashboard);
                    }
                    if (item == 'ABOUT') {
                      //Navigator.pushNamed(context, RouteNames.contactUs);
                    }
                    if (item == 'SERVICES') {}
                    if (item == 'WORKSHOPS') {}
                    if (item == 'CONTACT') {}
                  },
                  child: Text(
                    item,
                    style: TextStyle(color: purple, fontWeight: FontWeight.bold, fontSize: font),
                  ),
                ),
                SizedBox(width: 4.w),
              ],
            );
          }).toList(),
        ),
      );
    },
  );
}
