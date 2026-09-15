import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: color ?? Theme.of(context).appBarTheme.foregroundColor,
      ),
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      tooltip: 'Back',
    );
  }
}
