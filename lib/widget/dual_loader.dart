import 'dart:math' as math;
import 'package:flutter/material.dart';

class DualLoader extends StatefulWidget {
  final double size;
  final Color color1;
  final Color color2;

  const DualLoader({
    super.key,
    this.size = 22,
    this.color1 = Colors.white,
    this.color2 = Colors.blue,
  });

  @override
  State<DualLoader> createState() => _DualLoaderState();
}

class _DualLoaderState extends State<DualLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // outer radius = 1.0, inner radius = 0.6 → need ~1 / 0.6 ≈ 1.67x speed
    const outerRadius = 1.0;
    const innerRadius = 0.6;
    final innerSpeedMultiplier = outerRadius / innerRadius; // ≈ 1.67

    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // OUTER CIRCLE – clockwise
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi, // base speed
                child: SizedBox(
                  height: widget.size,
                  width: widget.size,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: widget.color1,
                  ),
                ),
              );
            },
          ),

          // INNER CIRCLE – anti-clockwise, faster so it *looks* same speed
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: -_controller.value *
                    2 *
                    math.pi *
                    innerSpeedMultiplier, // compensate radius
                child: SizedBox(
                  height: widget.size * innerRadius,
                  width: widget.size * innerRadius,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: widget.color2,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
