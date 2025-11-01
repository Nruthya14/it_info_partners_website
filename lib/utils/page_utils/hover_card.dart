import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final Color color;

  const HoverCard({super.key, required this.child, this.width = 0, this.height = 0, this.color = const Color(0xFFFFF3E0)});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: widget.width.w,
        height: widget.height.h,
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05)) // slightly zoom in
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [BoxShadow(color: _isHovered ? Colors.orange.withValues(alpha: 0.5) : Colors.black12, blurRadius: _isHovered ? 20 : 8, offset: const Offset(0, 6))],
        ),
        child: widget.child,
      ),
    );
  }
}
