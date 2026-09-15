import 'package:flutter/material.dart';
import 'package:splash_app/constants/colors.dart';

class CustomPopupModal extends StatelessWidget {
  const CustomPopupModal({
    super.key,
    this.backgroundColor,
    this.title,
    required this.content,
    this.action1,
    this.action2,
    this.onAction1Pressed,
    this.onAction2Pressed,
  });

  final Color? backgroundColor;
  final Widget? title;
  final Widget content;
  final String? action1;
  final String? action2;
  final VoidCallback? onAction1Pressed;
  final VoidCallback? onAction2Pressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? AppColors.white,
      title: title,
      content: content,
      actions: [
        if (action1 != null)
          TextButton(
            onPressed: onAction1Pressed ?? () => Navigator.pop(context),
            child: Text(
              action1!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ),
        if (action2 != null)
          TextButton(
            onPressed: onAction2Pressed ?? () => Navigator.pop(context),
            child: Text(
              action2!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
