import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final Color disabledBackColor,disabledForeColor;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.icon,
    this.disabledBackColor =Colors.blue,
    this.disabledForeColor =Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          disabledBackgroundColor: disabledBackColor,
          disabledForegroundColor: disabledForeColor,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Transform.translate(offset: Offset(0, -2), child: icon!),
                    SizedBox(width: 5),
                  ],
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
