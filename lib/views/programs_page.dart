import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/custom_widgets/buttons.dart';
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
    if (!kIsWeb) {
    } else {
      if (ScreenUtil().screenWidth > 600) {
        font = 7.sp;
        subFont = 4.5.sp;
      }
      if (ScreenUtil().screenWidth <= 600) {
        font = 10.sp;
        subFont = 6.sp;
      }
    }
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber.shade50,
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 10,
                      color: Colors.orange.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildText(
                            'Workshops',
                            Alignment.center,
                            isMarginRequired: true,
                            margin1: EdgeInsets.all(4.w),
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
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                            isColorChanged: true,
                            textColor: pink,
                            isSizeRequired: true,
                            fontSize: subFont,
                          ),
                          buildButton("Download Brochure", () {}),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.orange.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildText(
                            'Tech Connect',
                            Alignment.center,
                            isMarginRequired: true,
                            margin1: EdgeInsets.all(4.w),
                            isBoldRequired: true,
                            isColorChanged: true,
                            textColor: purple,
                            isSizeRequired: true,
                            fontSize: font,
                          ),
                          buildText(
                            'Interactive sessions that bridge\nstudents and industry experts\nthrough real-world tech insights.\n',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                            isColorChanged: true,
                            textColor: pink,
                            isSizeRequired: true,
                            fontSize: subFont,
                          ),
                          buildButton("Download Brochure", () {}),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.orange.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildText(
                            'Internships',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.all(4.w),
                            isBoldRequired: true,
                            isColorChanged: true,
                            textColor: purple,
                            isSizeRequired: true,
                            fontSize: font,
                          ),
                          buildText(
                            'Gain industry exposure and\npractical skills through\nguided internship opportunities.\n',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                            isColorChanged: true,
                            textColor: pink,
                            isSizeRequired: true,
                            fontSize: subFont,
                          ),
                          buildButton("Download Brochure", () {}),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                buildFooter(),
              ],
            ),
          ),

          // body: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       buildHeader(),
          //       buildText(
          //         "HANDS-ON WORKSHOPS",
          //         Alignment.center,
          //         isMarginRequired: true,
          //         isSizeRequired: true,
          //         fontSize: 10.sp,
          //         margin1: EdgeInsets.only(left: 10.w, top: 10.h),
          //         isColorChanged: true,
          //         textColor: Colors.amber.shade900,
          //         isBoldRequired: true,
          //       ),
          //       buildText(
          //         "Empowering developers and students to build real Flutter apps — hands-on, project-driven, and industry-ready.",
          //         Alignment.center,
          //         isMarginRequired: true,
          //         isSizeRequired: true,
          //         fontSize: subFont,
          //         //margin1: EdgeInsets.only(left: 10.w, top: 10.h),
          //         isColorChanged: true,
          //         textColor: Colors.greenAccent.shade700,
          //       ),
          //       buildText(
          //         "About the Workshop",
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w, top: 10.h),
          //         isSizeRequired: true,
          //         fontSize: font,
          //         isColorChanged: true,
          //         textColor: Colors.red.shade700,
          //       ),
          //       buildText(
          //         "The Flutter Hands-On Workshop by IT Info Partners is a complete learning experience crafted for students, IT professionals, and tech enthusiasts. We focus on building functional, real-world apps using Flutter & Dart through practical sessions and project-based learning.\n\nNo theory overload — just pure, interactive coding sessions that let you learn by building.",
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w, right: 50.h),
          //         isSizeRequired: true,
          //         fontSize: subFont,
          //         maxLines: 3,
          //       ),
          //       buildText(
          //         "Workshop Categories",
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w),
          //         isSizeRequired: true,
          //         fontSize: font,
          //         isColorChanged: true,
          //         textColor: Colors.red.shade700,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Card(
          //             elevation: 10,
          //             color: Colors.orange.shade100,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 buildText(
          //                   'Individual Workshop',
          //                   Alignment.center,
          //                   isMarginRequired: true,
          //                   margin1: EdgeInsets.all(4.w),
          //                   isBoldRequired: true,
          //                   isColorChanged: true,
          //                   textColor: purple,
          //                   isSizeRequired: true,
          //                   fontSize: subFont,
          //                 ),
          //                 buildText(
          //                   '• Beginner-friendly & guided coding\n'
          //                   '• Mini project and personal mentoring\n'
          //                   '• Certificate of completion\n'
          //                   '• Small group sessions',
          //                   Alignment.centerLeft,
          //                   isMarginRequired: true,
          //                   margin1: EdgeInsets.only(left: 4.w, right: 4.w),
          //                   isColorChanged: true,
          //                   textColor: pink,
          //                   isSizeRequired: true,
          //                   fontSize: subFont,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             elevation: 10,
          //             color: Colors.orange.shade100,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 buildText(
          //                   'College / Institutional Workshop',
          //                   Alignment.centerLeft,
          //                   isMarginRequired: true,
          //                   margin1: EdgeInsets.all(4.w),
          //                   isBoldRequired: true,
          //                   isColorChanged: true,
          //                   textColor: purple,
          //                   isSizeRequired: true,
          //                   fontSize: subFont,
          //                 ),
          //                 buildText(
          //                   '• 1–2 day on-site / online bootcamps\n'
          //                   '• Tailored syllabus for student level\n'
          //                   '• Certification for participants\n'
          //                   '• Institutional MoU available',
          //                   Alignment.centerLeft,
          //                   isMarginRequired: true,
          //                   margin1: EdgeInsets.only(left: 4.w, right: 4.w),
          //                   isColorChanged: true,
          //                   textColor: pink,
          //                   isSizeRequired: true,
          //                   fontSize: subFont,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             elevation: 10,
          //             color: Colors.orange.shade100,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 buildText(
          //                   'Corporate / Tech Professional Workshop',
          //                   Alignment.centerLeft,
          //                   isMarginRequired: true,
          //                   margin1: EdgeInsets.all(4.w),
          //                   isBoldRequired: true,
          //                   isColorChanged: true,
          //                   textColor: purple,
          //                   isSizeRequired: true,
          //                   fontSize: subFont,
          //                 ),
          //                 buildText(
          //                   '• Advanced Flutter & Firebase integration\n'
          //                   '• App architecture & performance focus\n'
          //                   '• Team-based project sessions\n'
          //                   '• Post-workshop technical support',
          //                   Alignment.centerLeft,
          //                   isMarginRequired: true,
          //                   margin1: EdgeInsets.only(left: 4.w, right: 4.w),
          //                   isColorChanged: true,
          //                   textColor: pink,
          //                   isSizeRequired: true,
          //                   fontSize: subFont,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //       buildText(
          //         "What You'll Learn",
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w, top: 10.h),
          //         isSizeRequired: true,
          //         fontSize: font,
          //         isColorChanged: true,
          //         textColor: Colors.red.shade700,
          //       ),
          //       buildText(
          //         '• Understand Flutter’s architecture and app-building process\n'
          //         '• Learn UI design, interactivity, and navigation\n'
          //         '• State management (Provider / Bloc / Riverpod)\n'
          //         '• Firebase integration – Authentication & Firestore\n'
          //         '• Gain industry insights and a career roadmap in Flutter development\n',
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w),
          //         isColorChanged: true,
          //         // textColor: pink,
          //         isSizeRequired: true,
          //         fontSize: subFont,
          //       ),
          //
          //       buildText(
          //         "Want to Collaborate?",
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w),
          //         isSizeRequired: true,
          //         fontSize: font,
          //         isColorChanged: true,
          //         textColor: Colors.red.shade700,
          //       ),
          //       buildText(
          //         '- For Colleges & Institutions - Host a Flutter Workshop in your college or tech fest. We conduct full-fledged sessions with coding guidance, certificates, and project-based learning.\n',
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w, right: 20.w),
          //         isColorChanged: true,
          //         // textColor: pink,
          //         isSizeRequired: true,
          //         maxLines: 3,
          //         fontSize: subFont,
          //       ),
          //       buildText(
          //         '- For Individuals & Professionals - Join our upcoming batches and master Flutter development through practical implementation and mentorship.',
          //         Alignment.centerLeft,
          //         isMarginRequired: true,
          //         margin1: EdgeInsets.only(left: 10.w, bottom: 20.h),
          //         isColorChanged: true,
          //         // textColor: pink,
          //         isSizeRequired: true,
          //         fontSize: subFont,
          //       ),
          //       buildFooter(),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
