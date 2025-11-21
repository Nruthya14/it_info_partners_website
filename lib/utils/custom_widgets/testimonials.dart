import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_info_partners/utils/custom_widgets/text_widgets.dart';

Widget buildFeedback() {
  final participateList = [
    {
      'name': 'Students, Jain Deemed to be University,\nBangalore.',
      'feedback':
          'The Flutter workshop was engaging, interactive, and filled with hands-on sessions. '
          'The trainer explained every concept clearly, and the practical approach helped us understand Flutter '
          'from the basics. It was a great opportunity to gain real-time coding experience.',
    },
    {
      'name': 'Students, Jain Deemed to be University,\nBangalore.',
      'feedback':
          'As beginners, we gained confidence to build Flutter applications after this workshop. '
          'The sessions were well-structured, and the materials were easy to follow. '
          'We could apply what we learned directly in small projects and got clarity on how to continue learning.',
    },
    {
      'name': 'Students, Jain Deemed to be University,\nBangalore.',
      'feedback':
          'The overall quality and coordination of the workshop were excellent. '
          'We, Students, appreciated the trainer’s clarity and the practical sessions the most. '
          'Many of us expressed interest in attending more sessions from IT Info Partners and recommended the workshop to other peers.',
    },
  ];

  double font = 0;
  double fontSize = 0;
  double icon = 0;
  double radius = 0;
  double width = 0;

  return LayoutBuilder(
    builder: (context, sp) {
      if (ScreenUtil().screenWidth > 1000) {
        fontSize = 4.sp;
        font = 4.sp;
        icon = 12.sp;
        radius = 20.r;
        width = MediaQuery.of(context).size.width * 0.3;
      } else if (ScreenUtil().screenWidth > 650) {
        fontSize = 5.sp;
        font = 4.5.sp;
        icon = 14.sp;
        radius = 16.r;
        width = MediaQuery.of(context).size.width * 0.35;
      } else {
        fontSize = 6.sp;
        font = 6.sp;
        icon = 20.sp;
        radius = 16.r;
        width = MediaQuery.of(context).size.width * 0.4;
      }

      return Container(
        margin: EdgeInsets.only(left: 6.w, right: 6.w),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false, dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                children: participateList.map((data) {
                  return Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/images/png/bg3.png'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    width: width,
                    margin: EdgeInsets.all(4.w),
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // 🔹 Let height shrink-wrap content
                      children: [
                        Icon(Icons.rate_review_outlined, color: Colors.deepOrange, size: icon),
                        SizedBox(height: 8.h),
                        Text(
                          '${data['feedback']}',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.acme(fontSize: fontSize),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '${data['name']}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.acme(fontSize: font, color: Colors.pink.shade900),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget buildResponsiveTestimonials() {
  final testimonials = [
    {
      'name': 'Smt. Rachana C R',
      'role': 'Associate Professor & Head, DoS in Computer Science, PG Wing of SBRR MFGC, KRS Road, Metagalli, Mysuru-16.',
      'feedback':
          'It was a pleasure to have our MCA alumna, Mrs. Nruthya Murugesh, back on campus to deliver an invited technical talk for our current MCA students. Her session was insightful, engaging, and truly inspiring — reflecting both her deep technical expertise and her passion for sharing knowledge. As a proud alumna of our department, she exemplifies the spirit of innovation and professionalism that we aim to instill in all our students. Her journey from student to entrepreneur is both commendable and motivating, and we are delighted to see her establish her own company. I wish her continued success in all her endeavors and look forward to many more collaborations in the future.',
      'image': 'assets/images/testimonials/rachana.jpg',
    },
    {
      'name': 'Rakshitha B S',
      'role': 'Assistant Professor, Dept of MSc CS&IT - FSD, Jain Deemed to be University, Bangalore.',
      'feedback':
          'The resource person was very knowledgeable and delivered the content in a clear and engaging manner. I particularly appreciated the hands-on approach, where participants could practice coding alongside the explanations. The examples and real-time demonstrations made the learning experience very effective. The workshop provided a great learning experience on Flutter and cross-platform app development. The resource person’s expertise and interactive approach made the session both insightful and motivating for students.',
      'image': 'assets/images/testimonials/rakshitha.jpg',
    },
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            "TESTIMONIALS",
            style: GoogleFonts.sahitya(fontSize: 8.sp, fontWeight: FontWeight.bold, color: Colors.amber.shade900),
          ),
          SizedBox(height: 10.h),
          Column(
            children: testimonials.map((t) {
              return SizedBox(
                child: buildResponsiveTestimonialCard(name: t['name']!, role: t['role']!, feedback: t['feedback']!, image: t['image']),
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
        ],
      );
    },
  );
}

Widget buildResponsiveTestimonialCard({required String name, required String role, required String feedback, String? image}) {
  double font = 0;
  double subFont = 0;
  double contentFont = 0;
  double radius = 0;
  if (ScreenUtil().screenWidth > 1000) {
    font = 5.sp;
    subFont = 4.sp;
    contentFont = 4.5.sp;
    radius = 100.r;
  } else if (ScreenUtil().screenWidth > 650) {
    font = 6.sp;
    subFont = 5.sp;
    contentFont = 5.sp;
    radius = 80.r;
  } else {
    font = 7.sp;
    subFont = 6.sp;
    contentFont = 7.sp;
    radius = 60.r;
  }

  return Container(
    margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 14.h),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/png/bg.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
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
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    '"$feedback"',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.acme(fontSize: contentFont, color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: font),
            ),
            Text(
              role,
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(color: Colors.pink.shade900, fontSize: subFont),
            ),
          ],
        ),
      ),
    ),
  );
}
