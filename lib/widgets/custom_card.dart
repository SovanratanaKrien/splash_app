import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Define Defaults
    // If the developer doesn't pass a value, these clean defaults are used automatically.
    final currentPadding = padding ?? const EdgeInsets.all(16.0);
    final currentMargin = margin ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0);
    final currentRadius = borderRadius ?? 12.0;
    final currentBackgroundColor = backgroundColor ?? AppColors.white;
    
    // Default to a subtle modern border if no shadow is provided, or use custom styles
    final currentBorder = border ?? Border.all(color: AppColors.grayLight, width: 1);
    
    // Default to a very soft shadow for depth
    final currentShadow = boxShadow ?? [
      BoxShadow(
        color: AppColors.black.withOpacity(0.03),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ];

    // 2. Build Content
    Widget cardContent = Padding(
      padding: currentPadding,
      child: child,
    );

    // 3. Build Wrapper with Conditional InkWell
    return Container(
      margin: currentMargin,
      decoration: BoxDecoration(
        color: currentBackgroundColor,
        borderRadius: BorderRadius.circular(currentRadius),
        border: currentBorder,
        boxShadow: currentShadow,
      ),
      // ClipRRect ensures the InkWell ripple effect doesn't bleed outside the rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(currentRadius),
        child: Material(
          type: MaterialType.transparency,
          child: onTap != null
              ? InkWell(
                  onTap: onTap,
                  splashColor: AppColors.black.withOpacity(0.05),
                  highlightColor: AppColors.black.withOpacity(0.02),
                  child: cardContent,
                )
              : cardContent,
        ),
      ),
    );
  }
}