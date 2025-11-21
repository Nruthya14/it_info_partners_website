import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    double font = 0;
    double subFont = 0;
    double icon = 0;
    if (!kIsWeb) {
    } else {
      if (ScreenUtil().screenWidth > 600) {
        font = 8.sp;
        subFont = 5.sp;
        icon = 10.sp;
      }
      if (ScreenUtil().screenWidth <= 600) {
        font = 10.sp;
        subFont = 6.sp;
        icon = 12.sp;
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
                buildText(
                  "ABOUT US",
                  Alignment.center,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: font,
                  margin1: EdgeInsets.only(top: 10.h, bottom: 20.h),
                  isColorChanged: true,
                  textColor: pink,
                  isBoldRequired: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w, right: 10.w, bottom: 10.h),
                        padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 10.h),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/png/bg4.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black38),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.insights, color: Colors.orange.shade900, size: icon),
                            Text(
                              "VISION",
                              style: GoogleFonts.sahitya(fontSize: font, color: Colors.pink.shade900, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "To inspire innovation & create meaningful digital experiences that move people & empower business worldwide.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sahitya(fontSize: subFont, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.star, color: Colors.orange.shade900, size: icon),
                    Icon(Icons.square, color: Colors.black38, size: icon),
                    Icon(Icons.star, color: Colors.pink.shade900, size: icon),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w, right: 20.w, bottom: 10.h),
                        padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 10.h),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/png/bg4.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black38),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.assistant_photo, color: Colors.pink.shade900, size: icon),
                            Text(
                              "MISSION",
                              style: GoogleFonts.sahitya(fontSize: font, color: Colors.orange.shade900, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "To blend technology & creativity to design solutions that connect, engage & make an impact in a constantly evolving digital world",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sahitya(fontSize: subFont, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                buildText(
                  "IT Info Partners is a forward-thinking tech company driven by innovation and creativity. "
                  "We specialize in crafting digital solutions that inspire people and empower businesses to grow in a connected world. "
                  "Our passionate team of developers, designers, and strategists work together to transform ideas into impactful mobile apps, web applications, and websites. "
                  "We believe in more than just delivering projects — we build experiences that tell your story, "
                  "enhance engagement, and create lasting value. With every line of code and every pixel designed, our goal is simple: to Inspire. Innovate. Impact.",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: subFont,
                  margin1: EdgeInsets.all(10.w),
                  isColorChanged: true,
                  textColor: Colors.black54,
                  maxLines: 14,
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
