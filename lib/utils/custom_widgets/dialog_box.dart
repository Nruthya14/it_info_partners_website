import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_info_partners/utils/widget_utils/app_colours.dart';

import 'buttons.dart';

//-------------------------------------Animated Dialog--------------------------

//Success or Error Dialog
class AnimatedDialog extends StatefulWidget {
  final String message;
  final bool isSuccess;
  final bool autoClose;
  final bool isTimeChanged;
  final int time;
  final bool isNavigationRequired;
  final void Function()? onPressed;
  final void Function()? onPressedButton1;
  final void Function()? onPressedButton2;
  final void Function()? onPressedButton3;
  final bool isButton1Required;
  final bool isButton2Required;
  final bool isButton3Required;
  final String buttonText;
  final String button1Text;
  final String button2Text;
  final String button3Text;
  final Widget? child;

  const AnimatedDialog({
    super.key,
    required this.message,
    this.isSuccess = true,
    this.autoClose = false,
    this.isTimeChanged = false,
    this.time = 0,
    this.isNavigationRequired = false,
    this.isButton1Required = false,
    this.isButton2Required = false,
    this.isButton3Required = false,
    this.buttonText = "",
    this.button1Text = "",
    this.button2Text = "",
    this.button3Text = "",
    this.child,
    this.onPressed,
    this.onPressedButton1,
    this.onPressedButton2,
    this.onPressedButton3,
  });

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  late AnimationController checkController;
  late Animation<double> checkAnimation;

  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);

    checkController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);

    scaleController.forward();
    checkController.forward();

    if (widget.autoClose) {
      Future.delayed(Duration(seconds: widget.isTimeChanged ? widget.time : 2), () {
        if (mounted && Navigator.of(context).canPop()) {
          Navigator.of(context).pop(); // Close the dialog
        }
      });
    }
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedIcon({required Color color, required IconData icon}) {
    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: checkAnimation,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(child: Icon(icon, color: Colors.white, size: 30)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = 0;
    double messageFontSize = 0;
    double height = 0;
    double borderRadius = 0;
    if (!kIsWeb) {
      fontSize = ScreenUtil().screenWidth >= 600 ? 10.sp : 14.sp;
      messageFontSize = ScreenUtil().screenWidth >= 600 ? 10.sp : 16.sp;
      height = ScreenUtil().screenWidth >= 600 ? 16 : 16;
      borderRadius = ScreenUtil().screenWidth >= 600 ? 3.w : 3.w;
    } else {
      fontSize = ScreenUtil().screenWidth >= 600 ? 4.sp : 10.sp;
      messageFontSize = ScreenUtil().screenWidth >= 600 ? 6.sp : 10.sp;
      height = ScreenUtil().screenWidth >= 600 ? 16.h : 16.h;
      borderRadius = ScreenUtil().screenWidth >= 600 ? 1.w : 1.w;
    }
    return AlertDialog(
      title: Column(
        children: [
          _buildAnimatedIcon(color: widget.isSuccess ? Colors.green : Colors.red, icon: widget.isSuccess ? Icons.check_rounded : Icons.close),
          SizedBox(height: height),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: messageFontSize),
          ),
        ],
      ),
      actions: widget.autoClose
          ? null
          : [
              SizedBox(
                // width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            alignment: Alignment.center,
                            height: 40.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: purple,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                              ),
                              onPressed: widget.isNavigationRequired
                                  ? widget.onPressed
                                  : () {
                                      Navigator.of(context).pop();
                                    },
                              child: Text(
                                widget.buttonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: whiteSmoke, fontSize: fontSize, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        if (widget.isButton1Required) SizedBox(width: 4.w),
                        if (widget.isButton1Required)
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20.h),
                              alignment: Alignment.center,
                              height: 40.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: purple,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                                ),
                                onPressed: widget.isButton1Required
                                    ? widget.onPressedButton1
                                    : () {
                                        Navigator.of(context).pop();
                                      },
                                child: Text(
                                  widget.button1Text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: whiteSmoke, fontSize: fontSize, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        if (widget.isButton1Required) SizedBox(width: 4.w),
                      ],
                    ),
                    if (widget.isButton2Required || widget.isButton3Required)
                      Row(
                        children: [
                          if (widget.isButton2Required)
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                alignment: Alignment.center,
                                height: 40.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: purple,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                                  ),
                                  onPressed: widget.isButton2Required
                                      ? widget.onPressedButton2
                                      : () {
                                          Navigator.of(context).pop();
                                        },
                                  child: Text(
                                    widget.button2Text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: whiteSmoke, fontSize: fontSize, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.isButton3Required)
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                alignment: Alignment.center,
                                height: 40.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: purple,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                                  ),
                                  onPressed: widget.isButton3Required
                                      ? widget.onPressedButton3
                                      : () {
                                          Navigator.of(context).pop();
                                        },
                                  child: Text(
                                    widget.button3Text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: whiteSmoke, fontSize: fontSize, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
      content: widget.child,
    );
  }
}

void showAnimatedDialog(
  BuildContext context,
  String message,
  bool isSuccess, {
  bool autoClose = true,
  bool isTimeChanged = false,
  int time = 0,
  bool isNavigationRequired = false,
  bool isButton1Required = false,
  bool isButton2Required = false,
  bool isButton3Required = false,
  String buttonText = "",
  String button1Text = "",
  String button2Text = "",
  String button3Text = "",
  Widget? child,
  void Function()? onPressed,
  void Function()? onPressedButton1,
  void Function()? onPressedButton2,
  void Function()? onPressedButton3,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AnimatedDialog(
          message: message,
          isSuccess: isSuccess,
          autoClose: autoClose,
          isTimeChanged: isTimeChanged,
          time: time,
          isNavigationRequired: isNavigationRequired,
          onPressed: onPressed,
          onPressedButton1: onPressedButton1,
          onPressedButton2: onPressedButton2,
          onPressedButton3: onPressedButton3,
          isButton1Required: isButton1Required,
          isButton2Required: isButton2Required,
          isButton3Required: isButton3Required,
          buttonText: buttonText,
          button1Text: button1Text,
          button2Text: button2Text,
          button3Text: button3Text,
          child: child,
        ),
      );
    },
  );
}

//--------------------------------Animated Alert Dialog------------------------
//Alert Dialog
class AnimatedAlertDialog extends StatefulWidget {
  final String message;
  final bool isButton1NavigationRequired;
  final bool isButton2NavigationRequired;
  final String buttonText1;
  final String buttonText2;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final bool isSuccess;

  const AnimatedAlertDialog({
    super.key,
    required this.message,
    this.isButton1NavigationRequired = false,
    this.isButton2NavigationRequired = false,
    required this.buttonText1,
    required this.buttonText2,
    required this.onPressed1,
    required this.onPressed2,
    this.isSuccess = false,
  });

  @override
  State<AnimatedAlertDialog> createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  late AnimationController checkController;
  late Animation<double> checkAnimation;

  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);

    checkController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);

    scaleController.forward();
    checkController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedIcon({required Color color, required IconData icon}) {
    double iconSize = 0.0;
    double height = 0.0;
    double width = 0.0;

    if (Platform.isAndroid || Platform.isIOS) {
      if (ScreenUtil().screenWidth < 600) {
        iconSize = 30.sp;
        height = 50.h;
        width = 40.w;
      }
      if (ScreenUtil().screenWidth >= 600) {
        iconSize = 14.sp;
        height = 35.h;
        width = 40.w;
      }
    } else {
      if (ScreenUtil().screenWidth < 600) {}
      if (ScreenUtil().screenWidth >= 600) {
        iconSize = 8.sp;
        height = 50.h;
        width = 44.w;
      }
    }
    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: checkAnimation,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Center(
              child: Icon(icon, color: whiteSmoke, size: iconSize),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = 0.0;
    double dialogWidth = 0.0;

    if (!kIsWeb) {
      if (ScreenUtil().screenWidth < 600) {
        fontSize = 16.sp;
        dialogWidth = MediaQuery.of(context).size.width * 0.4;
      }
      if (ScreenUtil().screenWidth >= 600) {
        fontSize = 10.sp;
        dialogWidth = MediaQuery.of(context).size.width * 0.6;
      }
    } else {
      if (ScreenUtil().screenWidth < 600) {}
      if (ScreenUtil().screenWidth >= 600) {
        fontSize = 5.sp;
        dialogWidth = MediaQuery.of(context).size.width * 0.3;
      }
    }
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!widget.isSuccess) _buildAnimatedIcon(color: orange, icon: Icons.question_mark),
          if (widget.isSuccess) _buildAnimatedIcon(color: Colors.green, icon: Icons.check_rounded),

          SizedBox(height: 16.h),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
      actions: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: dialogWidth,
            height: MediaQuery.of(context).size.height * 0.08,
            margin: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildButton(
                  widget.buttonText1,
                  widget.isButton1NavigationRequired
                      ? widget.onPressed1
                      : () {
                          Navigator.of(context).pop();
                        },
                ),
                SizedBox(width: 10.w),
                buildWhiteButton(
                  widget.buttonText2,
                  widget.isButton1NavigationRequired
                      ? widget.onPressed2
                      : () {
                          Navigator.of(context).pop();
                        },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Function to show dialog
Future showAnimatedAlertDialog(
  BuildContext context,
  String message, {
  bool isButton1NavigationRequired = false,
  bool isButton2NavigationRequired = false,
  String buttonText1 = '',
  String buttonText2 = '',
  void Function()? onPressed1,
  void Function()? onPressed2,
  bool isSuccess = false,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AnimatedAlertDialog(
        message: message,
        isButton1NavigationRequired: isButton1NavigationRequired,
        isButton2NavigationRequired: isButton2NavigationRequired,
        buttonText1: buttonText1,
        buttonText2: buttonText2,
        onPressed1: onPressed1,
        onPressed2: onPressed2,
        isSuccess: isSuccess,
      );
    },
  );
}

//------------------------------------------------------------------------------

//Show Input Model
Future showInputModel({required BuildContext parentContext, required String heading, required Widget child, double? height, double? titleWidth, bool isCloseDisabled = true}) {
  return showDialog(
    barrierDismissible: false,
    context: parentContext,
    builder: (dialogContext) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = 0.0;
          double iconSize = 0.0;
          double titleHeight = 0.0;
          if (!kIsWeb) {
            if (ScreenUtil().screenWidth < 600) {
              fontSize = 18.sp;
              iconSize = 30.sp;
              titleHeight = 50.h;
            } else if (ScreenUtil().screenWidth >= 600) {
              fontSize = 10.sp;
              iconSize = 15.sp;
              titleHeight = 40.h;
            }
          } else {
            if (ScreenUtil().screenWidth < 600) {
              fontSize = 18.sp;
              iconSize = 30.sp;
              titleHeight = 50.h;
            } else if (ScreenUtil().screenWidth >= 600) {
              fontSize = 6.sp;
              iconSize = 8.sp;
              titleHeight = 50.h;
            }
          }
          return AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            alignment: Alignment.center,
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            title: Container(
              padding: EdgeInsets.only(left: 8.w, right: 6.w),
              alignment: Alignment.center,
              width: titleWidth,
              height: titleHeight,
              color: purple,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      heading,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: whiteSmoke, fontWeight: FontWeight.w600, fontSize: fontSize, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  isCloseDisabled
                      ? IconButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                          icon: Icon(Icons.cancel, color: whiteSmoke, size: iconSize),
                        )
                      : Container(),
                ],
              ),
            ),
            content: SizedBox(
              height: height,
              width: titleWidth,
              child: SingleChildScrollView(child: child),
            ),
          );
        },
      );
    },
  );
}
