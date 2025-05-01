import 'dart:io';
import 'package:fuzionest_chatai/app/core/config/data/get_core_api_data.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/app_style.dart';
import '../../widgets/system_widgets/safe_area_container.dart';
import '../config/app_info.dart';
import 'package:store_redirect/store_redirect.dart';

class InAppUpdate {
  static Future<bool> inAppVersionUpdater(
    AppVersionConfig? appVersionConfig,
  ) async {
    //get the app version from the platform android and ios
    final int inAppVersionAndroid = intParse(AppInfo.kAppInfo.build ?? "1");
    final double inAppVersionIos = doubleParse(AppInfo.kAppInfo.build ?? '1.0');
    LoggerUtil.debug(
      "In App Version Updater  =>In App Version android=>$inAppVersionAndroid || ios=>$inAppVersionIos",
    );
    //set the update and force update version values from the parameter
    final int updateVersionAndroid = intParse(
      appVersionConfig?.androidAppVersion ?? "1",
    );

    final double updateVersionIos = doubleParse(
      appVersionConfig?.iosAppVersion ?? '1.0',
    );

    final int forceUpdateVersionAndroid = intParse(
      appVersionConfig?.androidForceUpdateVersion ?? "1",
    );
  
    final double forceUpdateVersionIos = doubleParse(
      appVersionConfig?.iosForceUpdateVersion ?? '1.0',
    );
    
    LoggerUtil.debug(
      "In App Version Updater  =>In App Update Versions androidUpdate=>$updateVersionAndroid || iosUpdate=>$updateVersionIos",
    );
    LoggerUtil.debug(
      "In App Version Updater  =>In App Force Update Versions androidForceUpdate=>$forceUpdateVersionAndroid || iosForceUpdate=>$forceUpdateVersionIos",
    );
    //set the update and force update message from the parameter
    final String updateMessageAndroid =
        appVersionConfig?.androidUpdateMessage ??
        "A new update is available for Android.";
    final String forceUpdateMessageAndroid =
        appVersionConfig?.androidForceUpdateMessage ??
        "This update is required to continue using the app.";
    final String updateMessageIos =
        appVersionConfig?.iosUpdateMessage ??
        "A new update is available for iOS.";
    final String forceUpdateMessageIos =
        appVersionConfig?.iosForceUpdateMessage ??
        "This update is mandatory for iOS.";
    LoggerUtil.debug(
      "In App Version Updater  =>In App Update Message androidUpdate=>$updateMessageAndroid || iosUpdate=>$updateMessageIos",
    );
    LoggerUtil.debug(
      "In App Version Updater  =>In App Force Update Message androidForceUpdate=>$forceUpdateMessageAndroid || iosForceUpdate=>$forceUpdateMessageIos",
    );

    num appVersion = 0;
    num updateVersion = 0;
    num forceUpdateVersion = 0;
    String? updateMessage;
    String? forceUpdateMessage;
    if (Platform.isAndroid) {
      LoggerUtil.debug("In App Version Updater => Android");
      appVersion = inAppVersionAndroid;
      updateVersion = updateVersionAndroid;
      forceUpdateVersion = forceUpdateVersionAndroid;
      updateMessage = updateMessageAndroid;
      forceUpdateMessage = forceUpdateMessageAndroid;
    } else if (Platform.isIOS) {
      LoggerUtil.debug("In App Version Updater => iOS");
      appVersion = inAppVersionIos;
      updateVersion = updateVersionIos;
      forceUpdateVersion = forceUpdateVersionIos;
      updateMessage = updateMessageIos;
      forceUpdateMessage = forceUpdateMessageIos;
    } else {
      LoggerUtil.debug("In App Version Updater => Platform not implemented");
      return true;
    }
    if (forceUpdateVersion > appVersion) {
      bool forceResult = await showUpdateDialog(
        title: "Update App?",
        message: forceUpdateMessage,
        enableLaterButton: false,
        enableUpdateNowButton: true,
      );
      if (forceResult) {
        StoreRedirect.redirect(
          androidAppId: AppInfo.storeAndroidAppId,
          iOSAppId: AppInfo.storeiOSAppId,
        );
        await Future.delayed(Duration(seconds: 1));
        return false;
      } else {
        return false;
      }
    } else if (updateVersion > appVersion) {
      bool updateResult = await showUpdateDialog(
        title: "Update App?",
        message: updateMessage,
        enableLaterButton: true,
        enableUpdateNowButton: true,
      );
      if (updateResult) {
        StoreRedirect.redirect(
          androidAppId: AppInfo.storeAndroidAppId,
          iOSAppId: AppInfo.storeiOSAppId,
        );
        await Future.delayed(Duration(seconds: 1));
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  static double doubleParse(String value) => double.tryParse(value) ?? 1.0;

  static int intParse(String value) => int.tryParse(value) ?? 1;

  static Future<bool> showUpdateDialog({
    required String title,
    required String message,
    bool enableLaterButton = true,
    bool enableUpdateNowButton = true,
  }) async {
    return await Get.dialog(
          SafeAreaContainer(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              backgroundColor:
                  Theme.of(Get.context!).appTheme.kAppBackgroundColor,
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: AppFontWeight.semibold.value,
                    overflow: TextOverflow.ellipsis,
                    fontSize: AppFontSize.large.value,
                    color: Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                  ),
                ),
              ),
              content: Text(
                message,
                maxLines: 20,
                style: TextStyle(
                  fontWeight: AppFontWeight.medium.value,
                  overflow: TextOverflow.ellipsis,
                  fontSize: AppFontSize.medium.value,
                  color: Theme.of(Get.context!).appTheme.kPrimaryTextColor,
                ),
              ),
              actions: [
                if (enableLaterButton)
                  TextButton(
                    onPressed: () => Get.back(result: false),
                    child: Text(
                      "LATER",
                      style: TextStyle(
                        fontWeight: AppFontWeight.semibold.value,
                        overflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.medium.value,
                        color: Theme.of(Get.context!).appTheme.kOnInfoColor,
                      ),
                    ),
                  ),
                if (enableUpdateNowButton)
                  TextButton(
                    onPressed: () => Get.back(result: true),
                    child: Text(
                      "UPDATE NOW",
                      style: TextStyle(
                        fontWeight: AppFontWeight.semibold.value,
                        overflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.medium.value,
                        color: Theme.of(Get.context!).appTheme.kOnInfoColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          barrierDismissible: false,
        ) ??
        false;
  }
}
