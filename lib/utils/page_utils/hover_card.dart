import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ResponsiveHoverCard extends StatefulWidget {
  final Widget child;
  final Color color;
  final BoxConstraints? constraints;
  const ResponsiveHoverCard({super.key, required this.child, this.color = const Color(0xFFFFF3E0), this.constraints});

  @override
  State<ResponsiveHoverCard> createState() => _ResponsiveHoverCardState();
}

class _ResponsiveHoverCardState extends State<ResponsiveHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        constraints: widget.constraints,
        padding: EdgeInsets.all(8.w),
        transform: Matrix4.identity()
          ..translateByVector3(vector.Vector3(0.0, _isHovered ? -5.0 : 0.0, 0.0))
          ..scaleByVector3(vector.Vector3(_isHovered ? 1.05 : 1.0, _isHovered ? 1.05 : 1.0, 1.0)),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/png/bg1.png'), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcATop)),
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          color: widget.color,
          boxShadow: [BoxShadow(color: _isHovered ? Colors.orange.withAlpha(128) : Colors.black12, blurRadius: _isHovered ? 20 : 8, offset: const Offset(0, 6))],
        ),
        child: widget.child,
      ),
    );
  }
}
