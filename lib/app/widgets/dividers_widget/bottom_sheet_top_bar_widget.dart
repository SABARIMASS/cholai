import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/shared/theme.dart';

class BottomSheetTopBarWidget extends StatelessWidget {
  const BottomSheetTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      height: 4.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).appTheme.kPrimaryTextColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(25.r),
      ),
    );
  }
}
