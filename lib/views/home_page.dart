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
          backgroundColor: Colors.purple.shade100,
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
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
                  child: Divider(color: stealGrey),
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
                  child: Divider(color: stealGrey),
                ),
                buildText(
                  "Hands-on Workshops",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: font,
                  margin1: EdgeInsets.only(left: 10.w),
                  isColorChanged: true,
                  textColor: Colors.amber.shade900,
                ),
                buildText(
                  'Our Flutter Hands-On Workshop is designed to help developers and learners build real, functional mobile apps using Flutter and Dart. '
                  'You’ll explore widgets, layouts, state management, Firebase integration, and deployment — all through guided, practical sessions.',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 14.w, right: 14.w),
                  isSizeRequired: true,
                  fontSize: subFont,
                  maxLines: 5,
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
                Container(
                  margin: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Divider(color: stealGrey),
                ),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
