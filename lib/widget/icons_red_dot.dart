import 'package:flutter/material.dart';

class IconsRedDot extends StatelessWidget {
  const IconsRedDot({super.key, required this.showText});
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(showText ? 5 : 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red.shade600,
        shape: BoxShape.circle,
      ),
      child: showText
          ? Text(
              '2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
