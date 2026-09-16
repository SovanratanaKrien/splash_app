import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.frontIcon,
    this.backIcon,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.borderRadius,
    required this.width,
    required this.height,
  });
  final String text;
  final IconData? frontIcon;
  final IconData? backIcon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (frontIcon != null) Icon(frontIcon, color: textColor),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                if (backIcon != null) Icon(backIcon, color: textColor),
              ],
            ),
          ),
        ));
  }
}
