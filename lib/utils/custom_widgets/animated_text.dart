import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget_utils/app_colours.dart';

class AnimatedGradientText extends StatefulWidget {
  const AnimatedGradientText({super.key});

  @override
  State<AnimatedGradientText> createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat(reverse: true); // makes it loop back and forth
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // animate gradient alignment for movement
            return ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [Colors.purple.shade200, Colors.deepOrange],
                  begin: Alignment(-1 + _controller.value * 2, 0),
                  end: Alignment(1 - _controller.value * 2, 0),
                ).createShader(bounds);
              },
              child: Text(
                'IT Info Partners',
                style: TextStyle(fontSize: 8.sp, color: whiteSmoke, fontWeight: FontWeight.bold, letterSpacing: 4),
              ),
            );
          },
        ),
      ),
    );
  }
}
