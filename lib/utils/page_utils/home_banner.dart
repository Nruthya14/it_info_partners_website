import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  //-------------------------Initialization-----------------------------
  //Variables
  int current = 0;

  //Controller
  final CarouselSliderController controller = CarouselSliderController();

  //List of Banner Cards
  List<String> imgList = ["assets/images/banner/banner.png", "assets/images/banner/banner1.png", "assets/images/banner/banner2.png"];

  //----------------------------------------END---------------------------------

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
            child: Image.asset(width: double.infinity, height: double.infinity, item, fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
        )
        .toList();

    double imageHeight = 0;
    if (!kIsWeb) {
    } else {
      if (ScreenUtil().screenWidth > 600) {
        imageHeight = MediaQuery.of(context).size.height * 0.6;
      }
      if (ScreenUtil().screenWidth <= 600) {
        imageHeight = MediaQuery.of(context).size.height * 0.25;
      }
      if (ScreenUtil().screenHeight > 600) {
        imageHeight = MediaQuery.of(context).size.height * 0.25;
      }
      if (ScreenUtil().screenHeight <= 200) {
        imageHeight = MediaQuery.of(context).size.height * 0.8;
      }
    }
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: imageHeight,
          child: CarouselSlider(
            items: imageSliders,
            controller: controller,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.height * 0.0025,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
            final isActive = current == entry.key; // active dot
            final theme = Theme.of(context).brightness;

            Color dotColor;
            if (theme == Brightness.dark) {
              dotColor = isActive ? Colors.purple : graphite; // active/inactive in dark
            } else {
              dotColor = isActive ? Colors.orange : graphite; // active/inactive in light
            }
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 10.w,
                height: 10.h,
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.h),
                decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
