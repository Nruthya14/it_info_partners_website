import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/routes/routes_name.dart';
import 'package:it_info_partners/utils/custom_widgets/header.dart';
import 'package:it_info_partners/utils/custom_widgets/text_widgets.dart';
import 'package:it_info_partners/utils/page_utils/home_banner.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double font = 0;
    double subFont = 0;
    if (!kIsWeb) {
    } else {
      if (ScreenUtil().screenWidth > 600) {
        font = 8.sp;
        subFont = 5.sp;
      }
      if (ScreenUtil().screenWidth <= 600) {
        font = 10.sp;
        subFont = 8.sp;
      }
    }

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                HomeBanner(),
                buildText(
                  "About Us",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: font,
                  margin1: EdgeInsets.only(left: 10.w),
                  isColorChanged: true,
                  textColor: pink,
                ),
                buildText(
                  'At IT Info Partners, we blend creativity and technology to craft digital experiences that Inspire, Innovate, and Impact. '
                  'From mobile apps to modern websites, we bring your ideas to life with smart, scalable, and stunning solutions. ',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  isColorChanged: true,
                  textColor: Colors.black54,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.aboutUs);
                  },
                  child: buildText(
                    "Read More...",
                    Alignment.centerRight,
                    isMarginRequired: true,
                    margin1: EdgeInsets.only(right: 10.w),
                    isColorChanged: true,
                    textColor: pink,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.w, right: 4.w),
                  // child: Divider(color: stealGrey),
                  //child: buildText("************", Alignment.center),
                ),
                buildText(
                  "Our Services",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: font,
                  margin1: EdgeInsets.only(left: 10.w),
                  isColorChanged: true,
                  textColor: Colors.green,
                ),
                buildText(
                  "At IT Info Partners, we transform ideas into powerful digital experiences. "
                  "As a Flutter-focused development company, we specialize in building cross-platform solutions that look stunning, perform seamlessly, and help businesses grow faster. "
                  "Whether you're a startup or an established brand, we deliver smart, scalable, and cost-effective technology — crafted with precision and passion.",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: Colors.black54,
                  isColorChanged: true,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.services);
                  },
                  child: buildText(
                    "Read More...",
                    Alignment.centerRight,
                    isMarginRequired: true,
                    margin1: EdgeInsets.only(right: 10.w),
                    isColorChanged: true,
                    textColor: Colors.green,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.w, right: 4.w),
                  // child: Divider(color: stealGrey, indent: 1, endIndent: 4),
                  //child: buildText("************", Alignment.center),
                ),
                buildText(
                  "Programs",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: font,
                  margin1: EdgeInsets.only(left: 10.w),
                  isColorChanged: true,
                  textColor: Colors.amber.shade900,
                ),
                buildText(
                  'At IT Info Partners, our programs are designed to bridge the gap between learning and real-world application. '
                  'We offer a blend of technical sessions, hands-on workshops, and internship opportunities — each crafted to '
                  'empower students and professionals with the latest industry skills.',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: Colors.black54,
                  isColorChanged: true,
                ),
                buildText(
                  '**Hands-On Workshops**',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: graphite,
                  isColorChanged: true,
                ),
                buildText(
                  'Dive into real-time app development using Flutter and Dart. '
                  'From UI design to Firebase integration, our workshops emphasize practical learning and creative problem-solving.',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: Colors.black54,
                  isColorChanged: true,
                ),
                buildText(
                  '**Technical Sessions**',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: graphite,
                  isColorChanged: true,
                ),
                buildText(
                  'Stay ahead of the curve with expert-led talks on emerging technologies, best practices, and the evolving world of software and design. '
                  'These sessions aim to inspire innovation and broaden technical perspective.',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: Colors.black54,
                  isColorChanged: true,
                ),
                buildText(
                  '**Internship Programs**',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: graphite,
                  isColorChanged: true,
                ),
                buildText(
                  'Gain real-world experience by working on live projects under expert mentorship. '
                  'Our internship opportunities help students and fresh graduates apply their skills, '
                  'explore professional workflows, and build strong project portfolios.',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
                  textColor: Colors.black54,
                  isColorChanged: true,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.programs);
                  },
                  child: buildText(
                    "Read More...",
                    Alignment.centerRight,
                    isMarginRequired: true,
                    margin1: EdgeInsets.only(right: 10.w),
                    isColorChanged: true,
                    textColor: Colors.amber.shade900,
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(left: 4.w, right: 4.w),
                //   child: Divider(color: stealGrey),
                // ),
                SizedBox(height: 20.h),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
