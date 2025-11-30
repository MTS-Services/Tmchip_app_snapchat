import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'icons_red_dot.dart';

class BottomAppBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final int index;
  final bool hasRedDot;
  final bool showText;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomAppBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    this.hasRedDot = false,
    this.showText = false,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    icon,
                    color: Colors.grey.shade300,
                    height: 20,
                    width: 20,
                  ),
                  if (hasRedDot)
                    Positioned(
                      top: showText ? -8 : -5,
                      right: showText ? -6 : -6,
                      child: IconsRedDot(showText: showText),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
