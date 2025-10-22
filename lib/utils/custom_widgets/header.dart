import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/custom_widgets/animated_text.dart';
import 'package:it_info_partners/utils/custom_widgets/text_widgets.dart';
import '../../routes/routes_name.dart';
import '../widget_utils/app_colours.dart';

Widget buildHeader() {
  double font = ScreenUtil().scaleWidth > 600 ? 12.sp : 4.sp;
  List<String> navItems = ['HOME', 'ABOUT', 'SERVICES', 'WORKSHOPS', 'CONTACT'];
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        color: graphite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 120.h, child: Image.asset('assets/images/png/logo1.png')),
                SizedBox(height: 60.h, width: 100.w, child: AnimatedGradientText()),
                Text(
                  'Inspire. Innovate. Impact.',
                  style: TextStyle(fontSize: 4.sp, color: silver, fontWeight: FontWeight.bold, letterSpacing: 4),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: navItems.map((item) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (item == 'HOME') {
                          Navigator.pushNamed(context, RouteNames.homePage);
                        }
                        if (item == 'ABOUT') {
                          Navigator.pushNamed(context, RouteNames.aboutUs);
                        }
                        if (item == 'SERVICES') {
                          Navigator.pushNamed(context, RouteNames.services);
                        }
                        if (item == 'WORKSHOPS') {
                          Navigator.pushNamed(context, RouteNames.workshops);
                        }
                        if (item == 'CONTACT') {
                          Navigator.pushNamed(context, RouteNames.contactUs);
                        }
                      },
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.purple.shade100, fontWeight: FontWeight.bold, fontSize: font),
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],
                );
              }).toList(),
            ),
            Row(
              children: [
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.phone, color: orange),
                // ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.mail, color: orange, size: 10.sp),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget buildFooter() {
  double font = ScreenUtil().scaleWidth > 600 ? 12.sp : 4.sp;
  List<String> navItems = ['HOME', 'ABOUT', 'SERVICES', 'WORKSHOPS', 'CONTACT'];
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        color: graphite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- Left Side (Quick Links) ----------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText("QUICK LINK", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isBoldRequired: true, isSizeRequired: true, fontSize: 6.sp),
                    SizedBox(height: 8.h),
                    ...navItems.map((item) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: GestureDetector(
                          onTap: () {
                            if (item == 'HOME') {
                              Navigator.pushNamed(context, RouteNames.homePage);
                            } else if (item == 'ABOUT') {
                              Navigator.pushNamed(context, RouteNames.aboutUs);
                            } else if (item == 'SERVICES') {
                              Navigator.pushNamed(context, RouteNames.services);
                            } else if (item == 'WORKSHOPS') {
                              Navigator.pushNamed(context, RouteNames.workshops);
                            } else if (item == 'CONTACT') {
                              Navigator.pushNamed(context, RouteNames.contactUs);
                            }
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: buildText(item, Alignment.center, fontSize: font, isSizeRequired: true, isColorChanged: true, textColor: whiteSmoke),
                          ),
                        ),
                      );
                    }),
                  ],
                ),

                // ---------------- Right Side (Contact Info) ----------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText("CONTACT US", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isBoldRequired: true, isSizeRequired: true, fontSize: 6.sp),
                    buildText("Mysuru, Karnataka", Alignment.center, isColorChanged: true, textColor: whiteSmoke),
                    buildText("itinfopartners@gmail.com", Alignment.center, isColorChanged: true, textColor: whiteSmoke),
                  ],
                ),
                SizedBox(height: 300.h, child: Image.asset('assets/images/png/logo.png')),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Divider(color: Colors.white10),
            ),
            buildText(
              "Designed and Developed by IT Info Partners © Copyright www.itinfopartneres 2025",
              Alignment.center,
              isColorChanged: true,
              textColor: whiteSmoke,
              isSizeRequired: true,
              fontSize: 4.sp,
            ),
          ],
        ),
      );
    },
  );
}
