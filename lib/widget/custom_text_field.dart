import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.obscureText,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.blue.shade400,
            fontSize: 13,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 8),

        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText ? isHidden : false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

            // Full Border Here
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),

            suffixIcon: widget.obscureText
                ? IconButton(
              onPressed: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
              icon: Icon(
                isHidden ? Icons.visibility_off : Icons.visibility,color: Colors.grey.shade400
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}
