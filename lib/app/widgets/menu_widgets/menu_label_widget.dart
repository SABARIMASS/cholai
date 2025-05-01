import 'package:flutter/material.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/app_style.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.duration,
    required this.isSidebarOpen,
    this.suffixEnable,
  });
  final String title;
  final IconData? icon;
  final Function() onTap;
  final bool isSidebarOpen;
  final Duration? duration;
  final bool? suffixEnable;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).appTheme.kAppBackgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          child: Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).appTheme.kPrimaryTextColor,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold.value,
                  fontSize: AppFontSize.small.value,
                  color: Theme.of(
                    context,
                  ).appTheme.kPrimaryTextColor.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(width: 8.w),
              const Spacer(),
              suffixEnable == true
                  ? Icon(
                    Icons.done,
                    color: Theme.of(context).appTheme.kPrimaryTextColor,
                    size: 22.r,
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
