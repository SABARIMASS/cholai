import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/shared/theme.dart';

class CustomInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool? isSelected;
  final Widget child;
  final void Function(TapDownDetails)? onTapDown;
  final EdgeInsetsGeometry? padding;
  const CustomInkWell({
    super.key,
    this.onTap,
    this.onLongPress,
    this.isSelected,
    this.onTapDown,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).appTheme.kPrimaryColor;

    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color:
            isSelected == true
                ? primaryColor.withValues(alpha: 0.1)
                : Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        onTapDown: onTapDown,
        onLongPress: onLongPress,
        splashColor: primaryColor.withValues(alpha: 0.1),
        hoverColor: primaryColor.withValues(alpha: 0.1),
        focusColor: primaryColor.withValues(alpha: 0.1),
        highlightColor: primaryColor.withValues(alpha: 0.1),
        child: Padding(padding: padding ?? EdgeInsets.all(4.r), child: child),
      ),
    );
  }
}
