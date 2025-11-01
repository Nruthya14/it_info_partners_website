import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaveDivider extends StatelessWidget {
  final Color color;

  const WaveDivider({this.color = Colors.orangeAccent, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: CustomPaint(painter: _WavePainter(color)),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;

  _WavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.75, 0, size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
