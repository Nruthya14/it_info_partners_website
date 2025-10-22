import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/custom_widgets/header.dart';
import '../utils/custom_widgets/text_widgets.dart';
import '../utils/widget_utils/app_colours.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.pink.shade50,
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                buildText(
                  "ABOUT US",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: 10.sp,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isColorChanged: true,
                  textColor: pink,
                  isBoldRequired: true
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: buildText(
                        "IT Info Partners is a forward-thinking tech company driven by innovation and creativity. "
                        "We specialize in crafting digital solutions that inspire people and empower businesses to grow in a connected world. "
                        "Our passionate team of developers, designers, and strategists work together to transform ideas into impactful mobile apps, web applications, and websites. "
                        "We believe in more than just delivering projects — we build experiences that tell your story, "
                        "enhance engagement, and create lasting value. With every line of code and every pixel designed, our goal is simple: to Inspire. Innovate. Impact.",
                        Alignment.centerLeft,
                        isMarginRequired: true,
                        isSizeRequired: true,
                        fontSize: 5.sp,
                        margin1: EdgeInsets.only(left: 10.w),
                        isColorChanged: true,
                        textColor: graphite,
                        maxLines: 14,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.42,
                      margin: EdgeInsets.only(right: 10.w),
                      child: Image.asset("assets/images/about_us.png", fit: BoxFit.fill),
                    ),
                  ],
                ),
                SizedBox(height: 100.h),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
