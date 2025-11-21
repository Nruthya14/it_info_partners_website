import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/custom_widgets/buttons.dart';
import 'package:it_info_partners/utils/custom_widgets/testimonials.dart';
import 'package:it_info_partners/utils/page_utils/hover_card.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
  double headingFont = 0;
  double font = 0;
  double subFont = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: ResponsiveBuilder(
            builder: (context, sp) {
              if (sp.deviceScreenType == DeviceScreenType.desktop) {
                headingFont = 8.sp;

                if (ScreenUtil().screenWidth > 800 && ScreenUtil().screenWidth <= 1000) {
                  font = 6.sp;
                  subFont = 4.sp;
                }
                if (ScreenUtil().screenWidth > 1000 && ScreenUtil().screenWidth <= 1200) {
                  font = 7.sp;
                  subFont = 4.5.sp;
                }
                if (ScreenUtil().screenWidth > 1200) {
                  font = 6.sp;
                  subFont = 4.sp;
                }
              }
              if (sp.deviceScreenType == DeviceScreenType.tablet) {
                if (ScreenUtil().screenWidth > 600 && ScreenUtil().screenWidth <= 800) {
                  font = 7.sp;
                  subFont = 5.sp;
                }
                if (ScreenUtil().screenWidth > 800 && ScreenUtil().screenWidth <= 1000) {
                  font = 7.sp;
                  subFont = 5.sp;
                }
              }
              if (sp.deviceScreenType == DeviceScreenType.mobile) {
                headingFont = 10.sp;

                if (ScreenUtil().screenWidth > 500 && ScreenUtil().screenWidth <= 600) {
                  font = 10.sp;
                  subFont = 6.5.sp;
                }
                if (ScreenUtil().screenWidth > 400 && ScreenUtil().screenWidth <= 500) {
                  font = 10.sp;
                  subFont = 6.sp;
                }
                if (ScreenUtil().screenWidth < 400) {
                  font = 9.sp;
                  subFont = 6.sp;
                }
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Header(),
                    buildText(
                      "PROGRAMS",
                      Alignment.center,
                      isMarginRequired: true,
                      isSizeRequired: true,
                      fontSize: headingFont,
                      margin1: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 20.h),
                      isColorChanged: true,
                      textColor: Colors.amber.shade900,
                      isBoldRequired: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ResponsiveHoverCard(
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
                                  //margin1: EdgeInsets.only(left: 4.w, right: 4.w),
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
                              ],
                            ),
                          ),
                        ),
                        ResponsiveHoverCard(
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
                                  // margin1: EdgeInsets.only(left: 4.w, right: 4.w),
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
                              ],
                            ),
                          ),
                        ),
                        ResponsiveHoverCard(
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
                                  // margin1: EdgeInsets.only(left: 4.w, right: 4.w),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    buildResponsiveTestimonials(),
                    buildFeedback(),
                    buildFooter(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
