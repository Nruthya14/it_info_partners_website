import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/api/contact_repository.dart';
import 'package:it_info_partners/utils/custom_widgets/drop_down.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';
import 'package:it_info_partners/utils/widget_utils/controllers.dart';
import 'package:it_info_partners/utils/widget_utils/dropdown_list.dart';
import 'package:it_info_partners/utils/widget_utils/validation_rules.dart';
import '../utils/custom_widgets/buttons.dart';
import '../utils/custom_widgets/header.dart';
import '../utils/custom_widgets/page_utils.dart';
import '../utils/custom_widgets/text_form_widget.dart';
import '../utils/custom_widgets/text_widgets.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  String selectedService = '';
  bool isLoading = false;

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
        subFont = 8.sp;
      }
    }
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Header(),
                    Container(
                      height: ScreenUtil().scaleHeight > 600 ? MediaQuery.of(context).size.height * 0.1 : MediaQuery.of(context).size.height * 0.75,
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 10.w, left: 10.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/png/contact_bg.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.6,

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
                                    fontSize: font,
                                    isBoldRequired: true,
                                    isColorChanged: true,
                                    textColor: Colors.pink.shade900,
                                  ),
                                  buildText("Feel free to contact us any time,\nwe will get back to you as soon as we can!", Alignment.centerLeft, isSizeRequired: true, fontSize: subFont),
                                  Form(
                                    key: _formKey,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Column(
                                        children: [
                                          buildTextFormField(
                                            context: context,
                                            label: "Name",
                                            hint: "Name",
                                            textType: TextInputType.text,
                                            controller: nameController,
                                            validator: ValidationRules.fieldRequired,
                                            isMandatory: true,
                                            autoValidateMode: AutovalidateMode.disabled,
                                            changeAutoValidateMode: true,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: buildTextFormField(
                                                  context: context,
                                                  label: "Phone No",
                                                  hint: "Phone No",
                                                  textType: TextInputType.number,
                                                  controller: phoneController,
                                                  validator: ValidationRules.fieldRequired,
                                                  isMandatory: true,
                                                  autoValidateMode: AutovalidateMode.disabled,
                                                  changeAutoValidateMode: true,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Expanded(
                                                child: buildTextFormField(
                                                  context: context,
                                                  label: "Email",
                                                  hint: "Email",
                                                  textType: TextInputType.text,
                                                  controller: emailController,
                                                  validator: ValidationRules.fieldRequired,
                                                  isMandatory: true,
                                                  autoValidateMode: AutovalidateMode.disabled,
                                                  changeAutoValidateMode: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          buildDropDown(
                                            context: context,
                                            label: "Select Services",
                                            hint: "Select Services",
                                            value: DropdownList.serviceTypes.contains(selectedService) ? selectedService : null,
                                            items: DropdownList.serviceTypes.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: buildText(value, Alignment.centerLeft, isSizeRequired: true, fontSize: subFont),
                                              );
                                            }).toList(),
                                            onChanged: (val) {
                                              if (val != null) {
                                                setState(() {
                                                  selectedService = val;
                                                  serviceController.text = val;
                                                });
                                              }
                                            },
                                            validator: ValidationRules.fieldRequiredDropdown,
                                            isMandatory: true,
                                          ),
                                          buildTextFormField(
                                            context: context,
                                            label: "Message",
                                            hint: "Message",
                                            textType: TextInputType.text,
                                            maxLines: 3,
                                            controller: messageController,
                                            validator: ValidationRules.fieldRequired,
                                            maxLength: 265,
                                            isMandatory: true,
                                            autoValidateMode: AutovalidateMode.disabled,
                                            changeAutoValidateMode: true,
                                          ),
                                          buildButton("Send", () async {
                                            if (_formKey.currentState!.validate()) {
                                              setState(() => isLoading = true);

                                              await ContactRepository()
                                                  .sendEmail(context, isLoading, nameController.text, phoneController.text, emailController.text, serviceController.text, messageController.text)
                                                  .then((response) {
                                                    _formKey.currentState!.reset();
                                                    setState(() {
                                                      selectedService = '';
                                                      nameController.clear();
                                                      emailController.clear();
                                                      phoneController.clear();
                                                      serviceController.clear();
                                                      messageController.clear();
                                                    });
                                                  })
                                                  .whenComplete(() {
                                                    setState(() => isLoading = false);
                                                  });
                                            }
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(width: MediaQuery.of(context).size.width * 0.1, height: MediaQuery.of(context).size.height * 0.45, color: purple),
                              Positioned(
                                left: ScreenUtil().screenWidth < 600 ? -MediaQuery.of(context).size.width * 0.2 : -MediaQuery.of(context).size.width * 0.14,
                                top: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.height * 0.15 : MediaQuery.of(context).size.height * 0.12,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                                  decoration: BoxDecoration(color: orange),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.mail, color: whiteSmoke, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                                          SizedBox(width: 4.w),
                                          buildText(
                                            "info@itinfopartners.com",
                                            Alignment.centerLeft,
                                            isColorChanged: true,
                                            textColor: whiteSmoke,
                                            isMarginRequired: true,
                                            fontSize: subFont,
                                            isSizeRequired: true,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        children: [
                                          Icon(Icons.maps_home_work_outlined, color: whiteSmoke, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                                          SizedBox(width: 4.w),
                                          buildText(
                                            "Mysuru, Karnataka.",
                                            Alignment.centerLeft,
                                            isColorChanged: true,
                                            textColor: whiteSmoke,
                                            isMarginRequired: true,
                                            fontSize: subFont,
                                            isSizeRequired: true,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Stack(
                          //   clipBehavior: Clip.none,
                          //   children: [
                          //     Container(width: MediaQuery.of(context).size.width * 0.1, height: MediaQuery.of(context).size.height * 0.45, color: purple),
                          //     Positioned(
                          //       left: ScreenUtil().screenWidth < 600 ? -MediaQuery.of(context).size.width * 0.2 : -MediaQuery.of(context).size.width * 0.14,
                          //       top: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.height * 0.15 : MediaQuery.of(context).size.height * 0.12,
                          //       child: Container(
                          //         width: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.width * 0.3 : MediaQuery.of(context).size.width * 0.24,
                          //         height: ScreenUtil().screenWidth < 600 ? MediaQuery.of(context).size.height * 0.1 : MediaQuery.of(context).size.height * 0.2,
                          //         color: orange,
                          //         child: SingleChildScrollView(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             crossAxisAlignment: CrossAxisAlignment.center,
                          //             children: [
                          //               Container(
                          //                 margin: EdgeInsets.all(4.w),
                          //                 child: Row(
                          //                   children: [
                          //                     Icon(CupertinoIcons.mail, color: whiteSmoke, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                          //                     SizedBox(width: 2.w),
                          //                     buildText(
                          //                       "info@itinfopartners.com",
                          //                       Alignment.centerLeft,
                          //                       isColorChanged: true,
                          //                       textColor: whiteSmoke,
                          //                       isMarginRequired: true,
                          //                       fontSize: subFont,
                          //                       isSizeRequired: true,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //
                          //               Container(
                          //                 margin: EdgeInsets.all(4.w),
                          //                 child: Row(
                          //                   children: [
                          //                     Icon(Icons.maps_home_work_outlined, color: whiteSmoke, size: ScreenUtil().screenWidth < 600 ? 8.sp : 6.sp),
                          //                     SizedBox(width: 2.w),
                          //                     buildText(
                          //                       "Mysuru, Karnataka.",
                          //                       Alignment.centerLeft,
                          //                       isColorChanged: true,
                          //                       textColor: whiteSmoke,
                          //                       isMarginRequired: true,
                          //                       fontSize: subFont,
                          //                       isSizeRequired: true,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    buildFooter(),
                  ],
                ),
              ),
              if (isLoading) buildPageLoader(),
            ],
          ),
        ),
      ),
    );
  }
}
