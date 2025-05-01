import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cholai/shared/theme.dart';

class CustomSvgIcon extends StatelessWidget {
  final String assetName;

  final double? size;
  final Color? color;

  const CustomSvgIcon({
    super.key,
    required this.assetName,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: size ?? 14.w,
      height: size ?? 14.h,
      // ignore: deprecated_member_use
      color:
          color == Colors.transparent
              ? null
              : color ?? Theme.of(context).appTheme.kIconPrimaryColor,
    );
  }
}
