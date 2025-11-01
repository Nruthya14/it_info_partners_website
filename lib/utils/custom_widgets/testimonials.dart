import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_info_partners/utils/custom_widgets/text_widgets.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

//Widget buildTestimonials(List<Widget> children) {
Widget buildTestimonials() {
  final testimonials = [
    {
      'name': 'Smt. Rachana C R',
      'role': 'Associate Professor & Head,\nDoS in Computer Science,\nPG Wing of SBRR MFGC,\nKRS Road, Metagalli, Mysuru-16.',
      'feedback':
          'It was a pleasure to have our MCA alumna, '
          'Mrs. Nruthya Murugesh, back on campus to deliver an invited technical talk for our '
          'current MCA students. Her session was insightful, engaging, and truly '
          'inspiring — reflecting both her deep technical expertise and her passion for sharing knowledge. '
          'As a proud alumna of our department, she exemplifies the spirit of innovation and professionalism '
          'that we aim to instill in all our students. Her journey from student to entrepreneur is both '
          'commendable and motivating, and we are delighted to see her establish her own company. '
          'I wish her continued success in all her endeavors and look forward to many more collaborations in the future.',
      'image': 'assets/images/testimonials/rachana.jpg', // optional
    },
    {
      'name': 'Rakshitha BS',
      'role': 'Assistant Professor,\nDept of MSc CS&IT - FSD,\nJain Deemed to be University,\nBangalore.',
      'feedback':
          'The resource person was very knowledgeable and delivered the content in a clear and engaging manner. '
          'I particularly appreciated the hands-on approach, where participants could practice coding alongside the explanations. '
          'The examples and real-time demonstrations made the learning experience very effective. The workshop provided a great '
          'learning experience on Flutter and cross-platform app development. '
          'The resource person’s expertise and interactive approach made the session both insightful and motivating for students.',
      'image': 'assets/images/testimonials/rakshitha.jpg',
    },
  ];
  return LayoutBuilder(
    builder: (context, constraints) {
      double fontTitle = 0;
      int pad = 0;
      double minHeight = 0;
      double maxHeight = 0;

      if (!kIsWeb) {
      } else {
        if (ScreenUtil().screenWidth > 1000) {
          fontTitle = 7.sp;
          pad = 2;
          minHeight = 250.h;
          maxHeight = 500.h;
        } else if (ScreenUtil().screenWidth > 650) {
          fontTitle = 8.sp;
          pad = 2;
          minHeight = 250.h;
          maxHeight = 420.h;
        } else {
          fontTitle = 7.sp;
          pad = 1;
          minHeight = 250.h;
          maxHeight = 250.h;
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          Text(
            "TESTIMONIALS",
            style: GoogleFonts.sahitya(fontSize: fontTitle, fontWeight: FontWeight.bold, color: Colors.amber.shade900),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 20.h,
            alignment: WrapAlignment.center,
            children: testimonials.map((t) {
              double cardWidth = (MediaQuery.of(context).size.width / pad) - 20.w;
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),

                child: buildTestimonialCard(name: t['name']!, role: t['role']!, feedback: t['feedback']!, image: t['image'], width: cardWidth),
              );
            }).toList(),
          ),
          SizedBox(height: 40.h),
        ],
      );
    },
  );
}

Widget buildTestimonialCard({required String name, required String role, required String feedback, String? image, required double width}) {
  double font = 0;
  double fontSize = 0;
  double subFont = 0;
  double radius = 0;

  if (!kIsWeb) {
  } else {
    if (ScreenUtil().screenWidth > 1000) {
      fontSize = 4.sp;
      font = 7.sp;
      subFont = 4.sp;
      radius = 120.r;
    } else if (ScreenUtil().screenWidth > 650) {
      fontSize = 5.sp;
      font = 8.sp;
      subFont = 4.5.sp;
      radius = 100.r;
    } else {
      fontSize = 8.sp;
      font = 10.sp;
      subFont = 5.sp;
      radius = 50.r;
    }
  }
  return LayoutBuilder(
    builder: (context, a) {
      return SizedBox(
        width: width,
        child: Card(
          //color: Colors.purple.shade50,
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/png/bg.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
            ),
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange.shade100,
                        radius: radius,
                        child: ClipOval(
                          child: image != null
                              ? Image.asset(image, fit: BoxFit.fill, width: double.infinity, height: double.infinity)
                              : buildText(name[0], Alignment.center, isSizeRequired: true, fontSize: ScreenUtil().screenWidth > 600 ? 6.sp : 6.sp),
                        ),
                      ),

                      SizedBox(height: 8.h),
                      buildText(
                        name,
                        Alignment.centerLeft,
                        isSizeRequired: true,
                        fontSize: font,
                        isMarginRequired: true,
                        isColorChanged: true,
                        textColor: purple,
                        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontText + 1.sp, color: Colors.deepPurple),
                      ),
                      buildText(
                        role,
                        Alignment.center,
                        isSizeRequired: true,
                        fontSize: subFont,
                        isColorChanged: true,
                        textColor: Colors.pink.shade900,
                        textAlign: TextAlign.center,
                        isTextAligned: true,
                        //style: TextStyle(fontSize: fontText - 0.5.sp, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: SingleChildScrollView(child: buildText('"$feedback"', Alignment.topLeft, isSizeRequired: true, fontSize: fontSize)),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildFeedback() {
  final participateList = [
    {
      'name': 'Students, Jain Deemed to be University,\nBangalore.',
      //'role': 'Jain Deemed to be University,\nBangalore.',
      'feedback':
          'The Flutter workshop was engaging, interactive, and filled with hands-on sessions. '
          'The trainer explained every concept clearly, and the practical approach helped us understand Flutter '
          'from the basics. It was a great opportunity to gain real-time coding experience',
    },
    {
      'name': 'Students, Jain Deemed to be University,\nBangalore.',
      // 'role': 'Jain Deemed to be University,\nBangalore.',
      'feedback':
          'As beginners, we gained confidence to build Flutter applications after this workshop. '
          'The sessions were well-structured, and the materials were easy to follow. '
          'We could apply what we learned directly in small projects and got clarity on how to continue learning.',
    },
    {
      'name': 'Students, Jain Deemed to be University,\nBangalore.',
      //'role': 'Jain Deemed to be University,\nBangalore.',
      'feedback':
          'The overall quality and coordination of the workshop were excellent. '
          'We, Students appreciated the trainer’s clarity and the practical sessions the most. '
          'Many of us expressed interest in attending more sessions from IT Info Partners and recommended the workshop to other peers.',
    },
  ];
  double font = 0;
  double fontSize = 0;
  double icon = 0;
  double radius = 0;
  double width = 0;
  double height = 0;

  return LayoutBuilder(
    builder: (context, sp) {
      if (!kIsWeb) {
      } else {
        if (ScreenUtil().screenWidth > 1000) {
          fontSize = 4.sp;
          font = 4.sp;
          icon = 12.sp;
          radius = 20.r;
          width = MediaQuery.of(context).size.width * 0.3;
          height = MediaQuery.of(context).size.height * 0.4;
        } else if (ScreenUtil().screenWidth > 650) {
          fontSize = 5.sp;
          font = 4.5.sp;
          icon = 14.sp;
          radius = 16.r;
          width = MediaQuery.of(context).size.width * 0.35;
          height = MediaQuery.of(context).size.height * 0.25;
        } else {
          fontSize = 8.sp;
          font = 7.5.sp;
          icon = 20.sp;
          radius = 16.r;
          width = MediaQuery.of(context).size.width * 0.4;
          height = MediaQuery.of(context).size.height * 0.35;
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 10.h),
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: participateList.length,
          itemBuilder: (context, index) {
            final data = participateList[index] as Map<String, dynamic>;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/png/bg3.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                border: Border.all(width: 0.1),
                borderRadius: BorderRadius.circular(radius),
              ),
              width: width,
              margin: EdgeInsets.all(2.w),
              padding: EdgeInsets.all(2.w),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Icon(Icons.rate_review_outlined, color: Colors.deepOrange, size: icon),
                  //SizedBox(height: 10.h),
                  Expanded(
                    child: buildText(
                      '${data['feedback']}',
                      Alignment.center,
                      isMarginRequired: true,
                      margin1: EdgeInsets.only(left: 4.w, right: 4.w),
                      isSizeRequired: true,
                      fontSize: fontSize,
                    ),
                  ),
                  //SizedBox(height: 15.h),
                  buildText(
                    data['name'] ?? '',
                    Alignment.center,
                    isMarginRequired: true,
                    isTextAligned: true,
                    textAlign: TextAlign.center,
                    isSizeRequired: true,
                    fontSize: font,
                    isColorChanged: true,
                    textColor: pink,
                  ),
                  // buildText(
                  //   data['role'] ?? '',
                  //   Alignment.center,
                  //   isMarginRequired: true,
                  //   isTextAligned: true,
                  //   textAlign: TextAlign.center,
                  //   isSizeRequired: true,
                  //   fontSize: ScreenUtil().screenWidth > 600 ? 3.5.sp : 6.sp,
                  // ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
