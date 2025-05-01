import 'package:flutter/material.dart';
import 'package:cholai/app/widgets/svg_widget/svg_icon_widget.dart';
import 'package:cholai/shared/theme.dart';

class CircleSvgIconWidget extends StatelessWidget {
  final String icon;
  final double radius;
  final Color color;
  final double iconSize;
  final VoidCallback? onTap;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  const CircleSvgIconWidget({
    super.key,
    required this.icon,
    this.radius = 20,
    this.color = Colors.black,
    this.iconSize = 20,
    this.onTap,
    this.shadowColor = Colors.black26,
    this.shadowBlurRadius = 10.0,
    this.shadowOffset = const Offset(0, 4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: Theme.of(context).appTheme.kAppBackgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: CustomSvgIcon(
            assetName: icon,
            size: iconSize,
            color: Theme.of(context).appTheme.kIconPrimaryColor,
          ),
        ),
      ),
    );
  }
}
