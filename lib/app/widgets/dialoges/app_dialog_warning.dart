import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/core/languages/language_global.dart';
import 'package:fuzionest_chatai/app/widgets/buttons/custom_button.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../shared/themex_colors.dart';

Future<bool?> showWarningDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? buttonText,
  VoidCallback? cancelOnTap,
  VoidCallback? okayOnTap,
}) async {
  return Get.bottomSheet<bool>(
    // context: context,
    // builder: (BuildContext context) {
    //   return
    ZoomIn(
      duration: const Duration(milliseconds: 400),
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Theme.of(context).appTheme.kAppBackgroundColor,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color:
                      Themex.themeModeType.value == ThemeMode.dark
                          ? Theme.of(
                            context,
                          ).appTheme.kLightColor.withValues(alpha: 0.1)
                          : Theme.of(context).appTheme.kAppBackgroundColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 18.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).appTheme.kPrimaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).appTheme.kPrimaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        onTap:
                            okayOnTap ??
                            () {
                              Navigator.pop(context, true);
                            },
                        color: Theme.of(context).appTheme.kPrimaryColor,
                        text: buttonText ?? LanguageGlobal.okay.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).appTheme.kAppColor,
                        ),
                        borderRadius: 4.r,
                        width: double.maxFinite,
                      ),
                      const SizedBox(height: 10),
                    ],
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
