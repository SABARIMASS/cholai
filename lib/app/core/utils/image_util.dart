import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/app/core/constants/image_assets.dart';
import 'package:fuzionest_chatai/app/core/helpers/enums.dart';
import 'package:fuzionest_chatai/shared/app_style.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:get/get.dart';

chooseCameraAction({required void Function(CameraAction) onTap}) {
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
                          child: Center(child: Image.asset(Assets.cameraIcon)),
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
                          child: Center(child: Image.asset(Assets.galleryIcon)),
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
