import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_info_partners/api/contact_repository.dart';
import 'package:it_info_partners/utils/custom_widgets/animated_text.dart';
import 'package:it_info_partners/utils/custom_widgets/text_widgets.dart';
import '../../routes/routes_name.dart';
import '../widget_utils/app_colours.dart';

Widget buildHeader() {
  double font = 0;
  double subFont = 0;
  double iconSize = 0;
  double spaceWidth = 0;
  double imageWidth = 0;
  double imageHeight = 0;
  double fontHeight = 0;
  if (!kIsWeb) {
  } else {
    if (ScreenUtil().screenWidth > 600) {
      font = 4.sp;
      subFont = 4.sp;
      iconSize = 7.sp;
      spaceWidth = 6.w;
      imageWidth = 80.w;
      imageHeight = 100.h;
      fontHeight = 50.h;
    }
    if (ScreenUtil().screenWidth <= 600) {
      font = 6.sp;
      subFont = 4.5.sp;
      iconSize = 10.sp;
      spaceWidth = 6.w;
      imageHeight = 60.h;
      imageWidth = 120.w;
      fontHeight = 20.h;
    }
  }

  List<String> navItems = ['HOME', 'ABOUT', 'SERVICES', 'PROGRAMS', 'CONTACT'];
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        color: graphite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: imageHeight, child: Image.asset('assets/images/png/logo1.png')),
                Column(
                  children: [
                    SizedBox(height: fontHeight, width: imageWidth, child: AnimatedGradientText()),
                    Text(
                      'Inspire. Innovate. Impact.',
                      style: TextStyle(fontSize: subFont, color: silver, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: navItems.map((item) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (item == 'HOME') {
                          Navigator.pushReplacementNamed(context, RouteNames.homePage);
                        }
                        if (item == 'ABOUT') {
                          Navigator.pushReplacementNamed(context, RouteNames.aboutUs);
                        }
                        if (item == 'SERVICES') {
                          Navigator.pushReplacementNamed(context, RouteNames.services);
                        }
                        if (item == 'PROGRAMS') {
                          Navigator.pushReplacementNamed(context, RouteNames.programs);
                        }
                        if (item == 'CONTACT') {
                          Navigator.pushReplacementNamed(context, RouteNames.contactUs);
                        }
                      },
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.purple.shade100, fontWeight: FontWeight.bold, fontSize: font),
                      ),
                    ),
                    SizedBox(width: spaceWidth),
                  ],
                );
              }).toList(),
            ),
            Row(
              children: [
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.phone, color: orange),
                // ),
                Tooltip(
                  message: "info@itinfopartners.com",
                  child: IconButton(
                    onPressed: () async {
                      await ContactRepository().launchEmail();
                    },
                    icon: Icon(CupertinoIcons.mail, color: orange, size: iconSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget buildFooter() {
  double font = 0;
  //double spaceHeight = 0;

  List<String> navItems = ['HOME', 'ABOUT', 'SERVICES', 'WORKSHOPS', 'CONTACT'];
  return LayoutBuilder(
    builder: (context, constraints) {
      if (!kIsWeb) {
      } else {
        if (ScreenUtil().screenWidth > 600) {
          font = 4.sp;
          //spaceHeight = MediaQuery.of(context).size.height * 0.3;
        }
        if (ScreenUtil().screenWidth <= 600) {
          font = 6.sp;
          //spaceHeight = MediaQuery.of(context).size.height * 0.15;
        }
      }
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        color: graphite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- Left Side (Quick Links) ----------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText("QUICK LINK", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isBoldRequired: true, isSizeRequired: true, fontSize: font),
                    SizedBox(height: 8.h),
                    ...navItems.map((item) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: GestureDetector(
                          onTap: () {
                            if (item == 'HOME') {
                              Navigator.pushNamed(context, RouteNames.homePage);
                            } else if (item == 'ABOUT') {
                              Navigator.pushNamed(context, RouteNames.aboutUs);
                            } else if (item == 'SERVICES') {
                              Navigator.pushNamed(context, RouteNames.services);
                            } else if (item == 'WORKSHOPS') {
                              Navigator.pushNamed(context, RouteNames.programs);
                            } else if (item == 'CONTACT') {
                              Navigator.pushNamed(context, RouteNames.contactUs);
                            }
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: buildText(item, Alignment.center, fontSize: font, isSizeRequired: true, isColorChanged: true, textColor: whiteSmoke),
                          ),
                        ),
                      );
                    }),
                  ],
                ),

                // ---------------- Right Side (Contact Info) ----------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText("CONTACT US", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isBoldRequired: true, isSizeRequired: true, fontSize: font),
                    buildText("IT Info Partners(R),", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isMarginRequired: true),
                    buildText(
                      "(MSME Certified Company)",
                      Alignment.center,
                      isColorChanged: true,
                      textColor: whiteSmoke,
                      isMarginRequired: true,
                      fontStyle: FontStyle.italic,
                      isFontStyleRequired: true,
                    ),
                    buildText("Mysuru, Karnataka.", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isMarginRequired: true),
                    buildText("info@itinfopartners.com", Alignment.center, isColorChanged: true, textColor: whiteSmoke, isMarginRequired: true),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildText("MSME No: UDYAM-KR-22-0107284", Alignment.center, fontSize: font, isSizeRequired: true, isColorChanged: true, textColor: whiteSmoke),
                    buildText("GST No: 29AAKFI5345L1ZT", Alignment.center, fontSize: font, isSizeRequired: true, isColorChanged: true, textColor: whiteSmoke),
                    //SizedBox(height: spaceHeight, child: Image.asset('assets/images/png/logo.png')),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Divider(color: Colors.white10),
            ),
            buildText(
              "©2025 All Rights Reserved www.itinfopartners.com | Designed and Developed by IT Info Partners",
              Alignment.center,
              isColorChanged: true,
              textColor: whiteSmoke,
              isSizeRequired: true,
              fontSize: font,
            ),
          ],
        ),
      );
    },
  );
}

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String activeItem = 'HOME'; // Default active page
  String hoverItem = ''; // For hover effects

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _navigate(String item) {
    setState(() => activeItem = item);

    final routes = {'HOME': RouteNames.homePage, 'ABOUT': RouteNames.aboutUs, 'SERVICES': RouteNames.services, 'PROGRAMS': RouteNames.programs, 'CONTACT': RouteNames.contactUs};

    Navigator.pushReplacementNamed(context, routes[item]!);
  }

  @override
  Widget build(BuildContext context) {
    double font = 0;
    double subFont = 0;
    double iconSize = 0;
    double spaceWidth = 0;
    double imageWidth = 0;
    double imageHeight = 0;
    double fontHeight = 0;
    int pad = 0;

    if (ScreenUtil().screenWidth > 1000) {
      font = 4.sp;
      subFont = 5.sp;
      iconSize = 7.sp;
      spaceWidth = 6.w;
      imageWidth = 70.w;
      imageHeight = 100.h;
      fontHeight = 50.h;
      pad = 1;
    } else if (ScreenUtil().screenWidth > 650) {
      font = 5.sp;
      subFont = 5.sp;
      iconSize = 7.sp;
      spaceWidth = 6.w;
      imageWidth = 70.w;
      imageHeight = 100.h;
      fontHeight = 50.h;
      pad = 1;
    } else {
      font = 6.sp;
      subFont = 4.5.sp;
      iconSize = 10.sp;
      spaceWidth = 6.w;
      imageHeight = 60.h;
      imageWidth = 120.w;
      fontHeight = 20.h;
      pad = 2;
    }

    List<String> navItems = ['HOME', 'ABOUT', 'SERVICES', 'PROGRAMS', 'CONTACT'];
    final route = ModalRoute.of(context)?.settings.name;
    if (route != null) {
      String newActiveItem = activeItem;
      if (route == RouteNames.aboutUs) {
        newActiveItem = 'ABOUT';
      } else if (route == RouteNames.services) {
        newActiveItem = 'SERVICES';
      } else if (route == RouteNames.programs) {
        newActiveItem = 'PROGRAMS';
      } else if (route == RouteNames.contactUs) {
        newActiveItem = 'CONTACT';
      } else if (route == RouteNames.homePage) {
        newActiveItem = 'HOME';
      }

      if (newActiveItem != activeItem) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => activeItem = newActiveItem);
        });
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.only(left: 10.w, right: 15.w, top: 10.h, bottom: 10.h),
          color: graphite, // graphite
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (ScreenUtil().screenWidth > 600) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: imageHeight, child: Image.asset('assets/images/png/logo1.png')),
                    Column(
                      children: [
                        SizedBox(
                          height: fontHeight,
                          width: imageWidth,
                          child: AnimatedGradientText(), // your widget
                        ),
                        Text(
                          'Inspire. Innovate. Impact.',
                          style: GoogleFonts.adventPro(fontSize: subFont, color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                          //style: TextStyle(fontSize: subFont, color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ] else ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: imageHeight, child: Image.asset('assets/images/png/logo1.png')),
                    SizedBox(
                      height: fontHeight,
                      width: imageWidth,
                      child: AnimatedGradientText(), // your widget
                    ),
                    Text(
                      'Inspire. Innovate. Impact.',
                      style: GoogleFonts.adventPro(fontSize: subFont, color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                      //style: TextStyle(fontSize: subFont, color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: navItems.map((item) {
                  final bool isActive = activeItem == item;
                  final bool isHovering = hoverItem == item;

                  return MouseRegion(
                    onEnter: (_) => setState(() => hoverItem = item),
                    onExit: (_) => setState(() => hoverItem = ''),
                    child: GestureDetector(
                      onTap: () => _navigate(item),
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: font,
                          fontWeight: FontWeight.bold,
                          color: isActive
                              ? Colors.pinkAccent
                              : isHovering
                              ? Colors.white
                              : Colors.purple.shade100,
                          //decoration: isActive ? TextDecoration.underline : TextDecoration.none,
                          decorationThickness: 2,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: spaceWidth / pad),
                          child: Text(item, style: GoogleFonts.acme()),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // 📧 Email icon
              Row(
                children: [
                  Tooltip(
                    message: "info@itinfopartners.com",
                    child: IconButton(
                      onPressed: () async {
                        await ContactRepository().launchEmail();
                      },
                      icon: Icon(CupertinoIcons.mail, color: Colors.orange, size: iconSize),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
