import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../utils/custom_widgets/header.dart';
import '../utils/custom_widgets/text_widgets.dart';
import 'package:video_player/video_player.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  bool startedPlaying = false;

  void safeUpdate() {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void getVideos() {
    // Video - 1
    _controller = VideoPlayerController.asset("assets/videos/mobile_dev.mp4")
      ..addListener(safeUpdate)
      ..setLooping(true)
      ..initialize().then((_) {
        if (mounted) setState(() {});
        _controller.play();
      });

    // Video - 2
    _controller1 = VideoPlayerController.asset("assets/videos/web_dev.mp4")
      ..addListener(safeUpdate)
      ..setLooping(true)
      ..initialize().then((_) {
        if (mounted) setState(() {});
        _controller1.play();
      });

    // Video - 3
    _controller2 = VideoPlayerController.asset("assets/videos/ui_ux.mp4")
      ..addListener(safeUpdate)
      ..setLooping(true)
      ..initialize().then((_) {
        if (mounted) setState(() {});
        _controller2.play();
      });

    // Video - 4
    _controller3 = VideoPlayerController.asset("assets/videos/support.mp4")
      ..addListener(safeUpdate)
      ..setLooping(true)
      ..initialize().then((_) {
        if (mounted) setState(() {});
        _controller3.play();
      });
  }

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  @override
  void dispose() {
    for (final c in [_controller, _controller1, _controller2, _controller3]) {
      c.removeListener(safeUpdate);
      c.dispose();
    }
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    _controller1.pause();
    _controller2.pause();
    _controller3.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    double font = 0;
    double subFont = 0;
    Color color = Colors.black54;

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: ResponsiveBuilder(
            builder: (context, sp) {
              if (sp.deviceScreenType == DeviceScreenType.desktop) {
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
                if (ScreenUtil().screenWidth > 500 && ScreenUtil().screenWidth <= 600) {
                  font = 9.sp;
                  subFont = 6.5.sp;
                }
                if (ScreenUtil().screenWidth > 400 && ScreenUtil().screenWidth <= 500) {
                  font = 9.sp;
                  subFont = 6.sp;
                }
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Header(),
                    buildText(
                      "SERVICES",
                      Alignment.center,
                      isMarginRequired: true,
                      isSizeRequired: true,
                      fontSize: 10.sp,
                      margin1: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 20.h),
                      isColorChanged: true,
                      textColor: Colors.green.shade800,
                      isBoldRequired: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "Mobile Application Development",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  "Bring your ideas to life with beautiful, high-performance mobile apps. "
                                  "We design and develop Android and iOS applications using Flutter — ensuring consistent UI, smooth animations, and responsive performance.",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  "What we deliver",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  maxLines: 5,
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - Flutter Android & iOS apps\n"
                                  " - Firebase & REST API integration\n"
                                  " - Real-time data handling\n"
                                  " - Push notifications & authentication\n"
                                  " - App Store & Play Store deployment\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10.r), child: VideoPlayer(_controller)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: VideoPlayer(_controller1)),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "Website & Web Application Development",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  "Deliver powerful web experiences that work everywhere. "
                                  "We create responsive web apps and business dashboards using Flutter Web — combining the performance of native with the flexibility of the web.",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(right: 10.w),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  "We build",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - Business management dashboards\n"
                                  " - Progressive Web Apps (PWAs)\n"
                                  " - Admin panels & portals\n"
                                  " - Web versions of your existing mobile app\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(right: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "UI / UX Design",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  'Design is the soul of any digital product. '
                                  'Our team designs intuitive, clean, and modern interfaces that engage users and communicate your brand identity.',
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  "Our design process includes",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - Wire-framing & prototyping\n"
                                  " - Figma design & branding consistency\n"
                                  " - Smooth animations & micro-interactions\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(left: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: VideoPlayer(_controller2)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/services/api_backend.png')),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "Backend & API Development",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  'A great app needs a powerful engine. '
                                  'We build secure, scalable backend systems that ensure your apps run fast and stay reliable.',
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(right: 10.w),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  "Tech Expertise",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - Node.js / Firebase Cloud Functions\n"
                                  " - REST API creation & integration\n"
                                  " - Cloud database management\n"
                                  " - Authentication & data security\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(right: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "App Maintenance & Support",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  'Technology evolves — and we help you stay ahead. '
                                  'Our ongoing maintenance and support plans keep your apps up-to-date, optimized, and bug-free.',
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  "Includes",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - Version updates\n"
                                  " - Performance optimization\n"
                                  " - Feature enhancements\n"
                                  " - Crash monitoring & fixes\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(left: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: VideoPlayer(_controller3)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/services/additional_service.png')),
                            ),
                          ),
                        ),

                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "Additional Services",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),

                                buildText(
                                  "To give your brand the full digital edge",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - App Store & Play Store publishing\n"
                                  " - App re-design and modernization\n"
                                  " - Cross-platform migration (Native → Flutter)\n"
                                  " - Startup MVP development & consulting\n"
                                  " - Branding & digital presence setup\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(right: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "Tech Stack",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  "We work with technologies that power modern experiences",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  " - Flutter\n"
                                  " - Dart\n"
                                  " - Firebase\n"
                                  " - Node.js\n"
                                  " - Firestore\n"
                                  " - Git\n"
                                  " - Figma\n"
                                  " - REST API\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(left: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/services/tech_stack.png')),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/services/industries.png')),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                buildText(
                                  "Industries We Serve",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.indigo.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " - Education & E-Learning\n"
                                  " - E-Commerce & Retail\n"
                                  " - Healthcare & Fitness\n"
                                  " - Business Tools & Productivity\n"
                                  " - Startups & MVPs\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  // margin1: EdgeInsets.only(right: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                                buildText(
                                  "Why Choose IT Info Partners",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: font,
                                  //margin1: EdgeInsets.only(left: 10.w),
                                  isColorChanged: true,
                                  textColor: Colors.green.shade600,
                                  isBoldRequired: true,
                                ),
                                buildText(
                                  " 🚀 Flutter-first expertise — one codebase, multiple platforms\n"
                                  " 🎨 Clean, modern, and user-focused design\n"
                                  " 💼 Scalable, secure, and startup-friendly solutions\n"
                                  " 🕓 Fast turnaround with transparent communication\n"
                                  " 💡 Continuous innovation and reliable support\n",
                                  Alignment.centerLeft,
                                  isMarginRequired: true,
                                  isSizeRequired: true,
                                  fontSize: subFont,
                                  maxLines: 5,
                                  //margin1: EdgeInsets.only(right: 10.w, bottom: 10.h),
                                  isColorChanged: true,
                                  textColor: color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
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
