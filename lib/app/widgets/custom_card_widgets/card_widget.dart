import 'package:flutter/material.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.child,
    this.shadowColor,
    this.spreadRadius,
    this.blurRadius,
    this.margin,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final Color? shadowColor;
  final double? spreadRadius;
  final double? blurRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                shadowColor ??
                Theme.of(
                  context,
                ).appTheme.kHintTextColor.withValues(alpha: 0.1),
            spreadRadius: spreadRadius ?? 2,
            blurRadius: blurRadius ?? 2,
          ),
        ],
        color: Theme.of(context).appTheme.kStatusBarPrimaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
      ),
      child: child,
    );
  }
}
