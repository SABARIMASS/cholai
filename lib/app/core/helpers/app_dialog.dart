import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/app/widgets/buttons/custom_button.dart';
import 'package:get/get.dart';
import '../../../shared/app_style.dart';
import '../../../shared/theme.dart';

class AppDialogHelpers {
  static Future<String?> showCustomGetXDialog({
    String? title,
    required String message,
    String? okText,
    String? noText,
    Color? okTextColor,
    Color? noTextColor,
    required String okValue,
    required String noValue,
  }) async {
    Completer<String?> completer = Completer<String?>();

    Get.dialog(
      Dialog(
        backgroundColor: Theme.of(Get.context!).appTheme.kAppBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(Get.context!).appTheme.kLightBorderColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null && title.isNotEmpty)
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: AppFontWeight.bold.value,
                    fontSize: AppFontSize.medium.value,
                    color: Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                message,
                style: TextStyle(
                  fontWeight: AppFontWeight.medium.value,
                  fontSize: AppFontSize.small.value,
                  color: Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    margin: EdgeInsets.symmetric(),
                    color: Colors.transparent,
                    onTap: () {
                      Get.back();
                      completer.complete(noValue);
                    },
                    text: noText ?? "Cancel",
                    style: TextStyle(
                      fontWeight: AppFontWeight.bold.value,
                      fontSize: AppFontSize.small.value,
                      color:
                          noTextColor ??
                          Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                    ),
                  ),
                  CustomButton(
                    margin: EdgeInsets.symmetric(),
                    color: Colors.transparent,
                    onTap: () {
                      Get.back();
                      completer.complete(okValue);
                    },
                    text: okText ?? "Confirm",
                    style: TextStyle(
                      fontWeight: AppFontWeight.bold.value,
                      fontSize: AppFontSize.small.value,
                      color:
                          okTextColor ??
                          Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true, // Allow dismissing by tapping outside
    );

    return completer.future;
  }
}
