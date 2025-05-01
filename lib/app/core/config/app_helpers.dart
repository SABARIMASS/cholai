import 'package:fuzionest_chatai/app/core/config/utils/enum.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import '../languages/languages.dart';
import 'app_info.dart';
import 'package:android_id/android_id.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:get/get.dart';

import 'data/app_info_args.dart';

class AppHelpers {
  static BaseUrls baseUrl = BaseUrls.live;

  static Future<void> getAppInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      const androidIdPlugin = AndroidId();
      var androidID = await androidIdPlugin.getId();
      if (GetPlatform.isAndroid) {
        AndroidDeviceInfo? androidInfo = await deviceInfo.androidInfo;
        AppInfo.kAppInfo = AppData(
          deviceId: "${androidInfo.id}.$androidID",
          deviceType: "a",
          deviceVersion: packageInfo.version,
          build: packageInfo.buildNumber,
          model: androidInfo.model,
          manufacture: androidInfo.manufacturer,
          release: androidInfo.version.release,
        );
      } else if (GetPlatform.isIOS) {
        IosDeviceInfo? iosInfo = await deviceInfo.iosInfo;
        AppInfo.kAppInfo = AppData(
          deviceId: iosInfo.identifierForVendor ?? "",
          deviceType: "i",
          deviceVersion:
              packageInfo.buildNumber == "" ? "0" : packageInfo.buildNumber,
          build: packageInfo.version,
          model: iosInfo.model,
          manufacture: iosInfo.name,
        );
      }
      LoggerUtil.debug("Device info success ${AppInfo.kAppInfo.deviceId}");
    } catch (error) {
      LoggerUtil.debug("Device info not obtained");
    }
  }

  static Map<String, String> appQueryParam({Map<String, String>? customQuery}) {
    final data = {
      'deviceId': AppInfo.kAppInfo.deviceId ?? "",
      'dt': AppInfo.kAppInfo.deviceType ?? "",
      'vn': AppInfo.kAppInfo.build ?? "",
      'bvn': AppInfo.kAppInfo.deviceVersion ?? "",
    };
    return {...data, ...?customQuery};
  }

  static Map<String, String> getAppLanguageQueryParam() {
    final data = {
      'lang': Languages.setAppLanguage.languageCode,
      // 'countryCode': Languages.setAppLanguage.countryCode ?? "",
    };
    return data;
  }
}
