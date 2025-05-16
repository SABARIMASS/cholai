import 'package:cholai/app/core/config/utils/enum.dart';
import 'data/app_info_args.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension BaseURLHelper on BaseUrls {
  String get rawValue {
    switch (this) {
      case BaseUrls.live:
        return 'https://fb.fuzionest.com';
      case BaseUrls.demo:
        return 'http://3.220.161.171:8001';
      case BaseUrls.local:
        return 'http://192.168.156.64:4000';
    }
  }
}

class AppInfo {
  static AppDeliveryType kAppDeliveryType = AppDeliveryType.service;
  static String kAppBaseUrl = BaseUrls.local.rawValue;
  static String kAuthApi = '$kAppBaseUrl/api/auth/';
  static String kChatApi = '$kAppBaseUrl/api/chats/';
  static String kContactApi = '$kAppBaseUrl/api/contacts/';
  static String kUserApi = '$kAppBaseUrl/preference/v1/';
  static String kDocumentUpload = '$kAppBaseUrl/api/';
  static String kImageBase = '$kAppBaseUrl/';
  static AppData kAppInfo = AppData();
  static String appCurrencySymbol = "₹";
  static LatLng appLatLng = LatLng(21.0000, 78.0000);
  static String storeAndroidAppId = "";
  static String storeiOSAppId = "";
  static var privacyUrl = '';
}
