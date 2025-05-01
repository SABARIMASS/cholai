import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:get/get.dart';

enum SnackbarType { error, success, warning, info }

class SnackbarHelper {
  static showGetXSnackBar({
    String? title,
    required String? msg,
    SnackbarType type = SnackbarType.success,
  }) {
    Get.closeCurrentSnackbar();
    final context = Get.context!;
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case SnackbarType.error:
        backgroundColor = Theme.of(
          context,
        ).appTheme.kOnErrorColor.withValues(alpha: 0.3);
        textColor = Theme.of(context).appTheme.kOnErrorColor;
        break;
      case SnackbarType.success:
        backgroundColor = Theme.of(
          context,
        ).appTheme.kPrimaryColor.withValues(alpha: 0.9);
        textColor = Theme.of(context).appTheme.kSecondaryTextColor;
        break;
      case SnackbarType.warning:
        backgroundColor = Theme.of(
          context,
        ).appTheme.kOnWarningColor.withValues(alpha: 0.1);
        textColor = Theme.of(context).appTheme.kOnWarningColor;
        break;
      case SnackbarType.info:
        backgroundColor = Theme.of(
          context,
        ).appTheme.kOnInfoColor.withValues(alpha: 0.2);
        textColor = Theme.of(context).appTheme.kOnInfoColor;
        break;
    }

    return Get.snackbar(
      title ?? "",
      msg ?? "",
      barBlur: 0,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds: 1),
      titleText: const SizedBox.shrink(),
      messageText: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0),
        width: double.maxFinite,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            color: backgroundColor,
          ),
          child: Column(
            children: [
              (title != null && title != '')
                  ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFontSize.small.value,
                          fontWeight: AppFontWeight.medium.value,
                          color: textColor,
                        ),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                  child: Text(
                    msg ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppFontSize.small.value,
                      fontWeight: AppFontWeight.medium.value,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
