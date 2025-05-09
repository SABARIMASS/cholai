import 'dart:async';

import 'package:cholai/app/core/constants/image_assets.dart';
import 'package:cholai/app/core/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/app/widgets/buttons/custom_button.dart';
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

  static chooseCameraAction({required void Function(CameraAction) onTap}) {
    FocusScope.of(Get.context!).unfocus();
    return Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).appTheme.kAppBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 25.h, top: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose the Action",
                style: TextStyle(
                  fontSize: AppFontSize.large.value,
                  fontWeight: AppFontWeight.bold.value,
                  color: Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          onTap(CameraAction.kCamera);
                          Get.back();
                        },
                        child: SizedBox(
                          height: 75.h,
                          width: 75.h,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Center(
                              child: Image.asset(Assets.cameraIcon),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                          fontWeight: AppFontWeight.bold.value,
                          color:
                              Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () async {
                          onTap(CameraAction.kGallery);
                          Get.back();
                          // var status = await Permission.mediaLibrary.request();
                          // printLog("PERMISSION ${status}");
                          // if (status.isGranted) {
                          //   onTap(CameraAction.kGallery);
                          //   Get.back();
                          // } else {
                          //   // Permission denied, show an error message or request again
                          //   // You can also check if the permission is permanently denied
                          //   if (status.isPermanentlyDenied || status.isDenied) {
                          //     openAppSettings();
                          //   }
                          // }
                        },
                        child: SizedBox(
                          height: 75.h,
                          width: 75.h,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Center(
                              child: Image.asset(Assets.galleryIcon),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          fontWeight: AppFontWeight.bold.value,
                          color:
                              Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
