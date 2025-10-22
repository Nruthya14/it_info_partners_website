import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

import '../utils/custom_widgets/buttons.dart';
import '../utils/custom_widgets/header.dart';
import '../utils/custom_widgets/text_form_widget.dart';
import '../utils/custom_widgets/text_widgets.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: ScreenUtil().scaleHeight > 600 ? MediaQuery.of(context).size.height * 0.1 : MediaQuery.of(context).size.height * 0.75,
                  margin: EdgeInsets.all(20.h),
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 10.w, left: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        padding: ScreenUtil().screenWidth < 600 ? EdgeInsets.only(left: 8.w) : EdgeInsets.only(left: 15.w),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.64,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(
                                "Get In Touch",
                                Alignment.centerLeft,
                                isMarginRequired: true,
                                isSizeRequired: true,
                                fontSize: ScreenUtil().screenWidth < 600 ? 14.sp : 8.sp,
                                isBoldRequired: true,
                              ),
                              buildText("Feel free to contact us any time,\nwe will get back to you as soon as we can!", Alignment.centerLeft),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  children: [
                                    buildTextFormField(context: context, label: "Name", hint: "Name", textType: TextInputType.text),
                                    buildTextFormField(context: context, label: "Phone No", hint: "Phone No", textType: TextInputType.number),
                                    buildTextFormField(context: context, label: "Email", hint: "Email", textType: TextInputType.text),
                                    buildTextFormField(context: context, label: "Message", hint: "Message", textType: TextInputType.text, maxLines: 3),
                                    buildButton("Send", () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            // height: MediaQuery.of(context).size.height * 0.6,
                            height: MediaQuery.of(context).size.height * 0.45,
                            color: purple,
                          ),
                          Positioned(
                            left: ScreenUtil().screenWidth < 600 ? -MediaQuery.of(context).size.width * 0.2 : -MediaQuery.of(context).size.width * 0.14,
                            top: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.height * 0.15 : MediaQuery.of(context).size.height * 0.12,
                            child: Container(
                              width: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.width * 0.3 : MediaQuery.of(context).size.width * 0.24,
                              //height: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.35,
                              height: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.2,
                              color: orange,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(4.w),
                                      child: Row(
                                        children: [
                                          Icon(CupertinoIcons.mail, color: graphite, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                                          SizedBox(width: 2.w),
                                          buildText("itinfopartners@gmail.com", Alignment.centerLeft, isColorChanged: true, textColor: graphite, isMarginRequired: true),
                                        ],
                                      ),
                                    ),

                                    // Container(
                                    //   margin: EdgeInsets.all(4.w),
                                    //   child: Row(
                                    //     children: [
                                    //       Icon(CupertinoIcons.device_phone_portrait, color: orange, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                                    //       SizedBox(width: 2.w),
                                    //       buildText("+91 9876543210", Alignment.centerLeft, isColorChanged: true, textColor: orange, isMarginRequired: true),
                                    //     ],
                                    //   ),
                                    // ),
                                    Container(
                                      margin: EdgeInsets.all(4.w),
                                      child: Row(
                                        children: [
                                          Icon(Icons.maps_home_work_outlined, color: graphite, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                                          SizedBox(width: 2.w),
                                          buildText("Mysuru, Karnataka.", Alignment.centerLeft, isColorChanged: true, textColor: graphite, isMarginRequired: true),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
