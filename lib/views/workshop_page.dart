import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/custom_widgets/header.dart';
import '../utils/custom_widgets/text_widgets.dart';
import '../utils/widget_utils/app_colours.dart';

class WorkshopPage extends StatefulWidget {
  const WorkshopPage({super.key});

  @override
  State<WorkshopPage> createState() => _WorkshopPageState();
}

class _WorkshopPageState extends State<WorkshopPage> {
  @override
  Widget build(BuildContext context) {
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
                  "HANDS-ON WORKSHOPS",
                  Alignment.center,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: 10.sp,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isColorChanged: true,
                  textColor: Colors.amber.shade900,
                  isBoldRequired: true,
                ),
                buildText(
                  "Empowering developers and students to build real Flutter apps — hands-on, project-driven, and industry-ready.",
                  Alignment.center,
                  isMarginRequired: true,
                  isSizeRequired: true,
                  fontSize: 5.sp,
                  //margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isColorChanged: true,
                  textColor: Colors.greenAccent.shade700,
                ),
                buildText(
                  "About the Workshop",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isSizeRequired: true,
                  fontSize: 8.sp,
                  isColorChanged: true,
                  textColor: Colors.red.shade700,
                ),
                buildText(
                  "The Flutter Hands-On Workshop by IT Info Partners is a complete learning experience crafted for students, IT professionals, and tech enthusiasts. We focus on building functional, real-world apps using Flutter & Dart through practical sessions and project-based learning.\n\nNo theory overload — just pure, interactive coding sessions that let you learn by building.",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, right: 50.h),
                  isSizeRequired: true,
                  fontSize: 5.sp,
                  maxLines: 3,
                ),
                buildText(
                  "Workshop Categories",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isSizeRequired: true,
                  fontSize: 8.sp,
                  isColorChanged: true,
                  textColor: Colors.red.shade700,
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
                            'Individual Workshop',
                            Alignment.center,
                            isMarginRequired: true,
                            margin1: EdgeInsets.all(4.w),
                            isBoldRequired: true,
                            isColorChanged: true,
                            textColor: purple,
                            isSizeRequired: true,
                            fontSize: 6.sp,
                          ),
                          buildText(
                            '• Beginner-friendly & guided coding\n'
                            '• Mini project and personal mentoring\n'
                            '• Certificate of completion\n'
                            '• Small group sessions',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                            isColorChanged: true,
                            textColor: pink,
                            isSizeRequired: true,
                            fontSize: 4.sp,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.orange.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(
                            'College / Institutional Workshop',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.all(4.w),
                            isBoldRequired: true,
                            isColorChanged: true,
                            textColor: purple,
                            isSizeRequired: true,
                            fontSize: 6.sp,
                          ),
                          buildText(
                            '• 1–2 day on-site / online bootcamps\n'
                            '• Tailored syllabus for student level\n'
                            '• Certification for participants\n'
                            '• Institutional MoU available',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                            isColorChanged: true,
                            textColor: pink,
                            isSizeRequired: true,
                            fontSize: 4.sp,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.orange.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(
                            'Corporate / Tech Professional Workshop',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.all(4.w),
                            isBoldRequired: true,
                            isColorChanged: true,
                            textColor: purple,
                            isSizeRequired: true,
                            fontSize: 6.sp,
                          ),
                          buildText(
                            '• Advanced Flutter & Firebase integration\n'
                            '• App architecture & performance focus\n'
                            '• Team-based project sessions\n'
                            '• Post-workshop technical support',
                            Alignment.centerLeft,
                            isMarginRequired: true,
                            margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                            isColorChanged: true,
                            textColor: pink,
                            isSizeRequired: true,
                            fontSize: 4.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                buildText(
                  "What You'll Learn",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isSizeRequired: true,
                  fontSize: 8.sp,
                  isColorChanged: true,
                  textColor: Colors.red.shade700,
                ),
                buildText(
                  '• Understand Flutter’s architecture and app-building process\n'
                  '• Learn UI design, interactivity, and navigation\n'
                  '• State management (Provider / Bloc / Riverpod)\n'
                  '• Firebase integration – Authentication & Firestore\n'
                  '• Gain industry insights and a career roadmap in Flutter development\n',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w),
                  isColorChanged: true,
                  // textColor: pink,
                  isSizeRequired: true,
                  fontSize: 5.sp,
                ),

                buildText(
                  "Want to Collaborate?",
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, top: 10.h),
                  isSizeRequired: true,
                  fontSize: 8.sp,
                  isColorChanged: true,
                  textColor: Colors.red.shade700,
                ),
                buildText(
                  '- For Colleges & Institutions - Host a Flutter Workshop in your college or tech fest. We conduct full-fledged sessions with coding guidance, certificates, and project-based learning.\n',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, right: 20.w),
                  isColorChanged: true,
                  // textColor: pink,
                  isSizeRequired: true,
                  maxLines: 3,
                  fontSize: 5.sp,
                ),
                buildText(
                  '- For Individuals & Professionals - Join our upcoming batches and master Flutter development through practical implementation and mentorship.',
                  Alignment.centerLeft,
                  isMarginRequired: true,
                  margin1: EdgeInsets.only(left: 10.w, bottom: 20.h),
                  isColorChanged: true,
                  // textColor: pink,
                  isSizeRequired: true,
                  fontSize: 5.sp,
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
