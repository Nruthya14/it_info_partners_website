import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/custom_widgets/buttons.dart';
import 'package:it_info_partners/utils/custom_widgets/testimonials.dart';
import 'package:it_info_partners/utils/page_utils/hover_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/custom_widgets/header.dart';
import '../utils/custom_widgets/text_widgets.dart';
import '../utils/widget_utils/app_colours.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({super.key});

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  @override
  Widget build(BuildContext context) {
    double font = 0;
    double subFont = 0;
    double width = 0;
    double height = 0;
    if (!kIsWeb) {
    } else {
      if (ScreenUtil().screenWidth > 1000) {
        font = 7.sp;
        subFont = 4.5.sp;
        width = MediaQuery.of(context).size.width * 0.07;
        height = MediaQuery.of(context).size.height * 0.44;
      } else if (ScreenUtil().screenWidth > 650) {
        font = 8.sp;
        subFont = 4.sp;
        width = MediaQuery.of(context).size.width * 0.1;
        height = MediaQuery.of(context).size.height * 0.34;
      } else {
        font = 10.sp;
        subFont = 6.5.sp;
        width = MediaQuery.of(context).size.width * 0.2;
        height = MediaQuery.of(context).size.height * 0.3;
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
                  "PROGRAMS",
                  Alignment.center,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: 10.sp,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 20.h),
                  isColorChanged: true,
                  textColor: Colors.amber.shade900,
                  isBoldRequired: true,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 20.w,
                  runSpacing: 30.h,
                  //mainAxisAlignment: mainAxisAlignment,
                  children: [
                    HoverCard(
                      width: width,
                      height: height,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/png/bg1.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildText(
                                'Workshops',
                                Alignment.center,
                                isMarginRequired: true,
                                margin1: EdgeInsets.all(2.w),
                                isBoldRequired: true,
                                isColorChanged: true,
                                textColor: purple,
                                isSizeRequired: true,
                                fontSize: font,
                              ),
                              buildText(
                                '• Individual\n'
                                '• College / Institutional\n'
                                '• Corporate / Tech Professional\n',
                                Alignment.center,
                                isMarginRequired: true,
                                margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                                isColorChanged: true,
                                textColor: graphite,
                                isSizeRequired: true,
                                fontSize: subFont,
                                isTextAligned: true,
                                textAlign: TextAlign.left,
                              ),
                              buildButton("Download Brochure", () {
                                launchUrl(Uri.parse("https://drive.google.com/uc?export=download&id=1bl-1RolTaxneJ4F9yAGmZAsrR6shbFxo"));
                              }),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                    HoverCard(
                      width: width,
                      height: height,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/png/bg1.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildText(
                                'Tech Connect',
                                Alignment.center,
                                isMarginRequired: true,
                                margin1: EdgeInsets.all(2.w),
                                isBoldRequired: true,
                                isColorChanged: true,
                                textColor: purple,
                                isSizeRequired: true,
                                fontSize: font,
                              ),
                              buildText(
                                'Interactive sessions that bridge\nstudents and industry experts\nthrough real-world tech insights.\n',
                                Alignment.center,
                                isMarginRequired: true,
                                margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                                isColorChanged: true,
                                textColor: graphite,
                                isSizeRequired: true,
                                fontSize: subFont,
                                isTextAligned: true,
                                textAlign: TextAlign.left,
                              ),
                              buildButton("Download Brochure", () {
                                launchUrl(Uri.parse("https://drive.google.com/uc?export=download&id=164YDad9L_gYRaY-RVm9n_E3EholnrHVw"));
                              }),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                    HoverCard(
                      width: width,
                      height: height,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/png/bg1.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildText(
                                'Internships',
                                Alignment.center,
                                isMarginRequired: true,
                                margin1: EdgeInsets.all(2.w),
                                isBoldRequired: true,
                                isColorChanged: true,
                                textColor: purple,
                                isSizeRequired: true,
                                fontSize: font,
                              ),
                              buildText(
                                'Gain industry exposure and\npractical skills through\nguided internship opportunities.\n',
                                Alignment.center,
                                isMarginRequired: true,
                                margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                                isColorChanged: true,
                                textColor: graphite,
                                isSizeRequired: true,
                                fontSize: subFont,
                                isTextAligned: true,
                                textAlign: TextAlign.left,
                              ),
                              buildButton("Download Brochure", () {
                                launchUrl(Uri.parse("https://drive.google.com/uc?export=download&id=1VjLRxGE_3Et9_9cc3wM2-oDNVdn6ZKrp"));
                              }),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                buildTestimonials(),
                buildFeedback(),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
