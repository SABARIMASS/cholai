import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/app/views/auth/data/profile_create_api_data.dart';
import 'package:get_storage/get_storage.dart';
import '../config/data/app_access_urls_api_data.dart';
import '../constants/storage_keys.dart';

class StorageX {
  static final GetStorage storage = GetStorage();

  static void saveUserData(UserInfoData value) {
    try {
      String jsonData = json.encode(value.toJson());
      storage.write(StorageKeys.kUserInfo, jsonData);
    } catch (e) {
      LoggerUtil.error("saveUserDataError", error: e.toString());
    }
  }

  static Future<UserInfoData?> getUserData() async {
    try {
      String? jsonData = storage.read(StorageKeys.kUserInfo);
      if (jsonData != null) {
        Map<String, dynamic> jsonMap = jsonDecode(jsonData);
        return UserInfoData.fromJson(jsonMap);
      }
    } catch (e) {
      LoggerUtil.error("getUserDataError", error: e.toString());
      return null;
    }
    return null;
  }

  static void saveAccessToken(String id) {
    storage.write(StorageKeys.kAccessToken, id);
  }

  static String getAccessToken() {
    return storage.read(StorageKeys.kAccessToken) ?? "";
  }

  static void saveRefreshToken(String token) {
    storage.write(StorageKeys.kRefreshToken, token);
  }

  static String getRefreshToken() {
    return storage.read(StorageKeys.kRefreshToken) ?? "";
  }

  static void saveDeviceToken(String token) {
    storage.write(StorageKeys.deviceToken, token);
  }

  static String getDeviceToken() {
    return storage.read(StorageKeys.deviceToken) ?? "";
  }

  static void saveOrgId(String id) {
    storage.write(StorageKeys.orgId, id);
  }

  static String getOrgId() {
    return storage.read(StorageKeys.orgId) ?? '';
  }

  static void saveOrgName(String name) {
    storage.write(StorageKeys.orgName, name);
  }

  static String getOrgName() {
    return storage.read(StorageKeys.orgName) ?? "";
  }

  Future<ThemeMode> getThemeMode() async {
    try {
      final value = await StorageX.storage.read(StorageKeys.themeMode);
      if (value == "light") {
        return ThemeMode.light;
      } else if (value == "dark") {
        return ThemeMode.dark;
      } else {
        return ThemeMode.system;
      }
    } catch (e) {
      return ThemeMode.light;
    }
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    try {
      String theme =
          themeMode == ThemeMode.dark
              ? "dark"
              : themeMode == ThemeMode.light
              ? "light"
              : "system";
      await StorageX.storage.write(StorageKeys.themeMode, theme);
    } catch (e) {
      // Handle error
    }
  }

  static void clearStorage() {
    storage.erase();
  }

  static void appCommonRemover() {}

  static void saveForceLogOutMessage(String value) {
    storage.write(StorageKeys.forceMessage, value);
  }

  static String getForceLogOutMessage() {
    return storage.read(StorageKeys.forceMessage) ?? "";
  }

  Future<String> getAppLanguage() async {
    try {
      final value = await StorageX.storage.read(StorageKeys.appLanguage);
      return value ?? 'en';
    } catch (e) {
      return 'en';
    }
  }

  Future<void> updateAppLanguage(String language) async {
    try {
      switch (language) {
        case 'en':
        case 'tn':
          await StorageX.storage.write(StorageKeys.appLanguage, language);
          break;
        default:
          await StorageX.storage.write("appLanguage", 'en');
      }
    } catch (e) {
      // Handle error
    }
  }

  // Save the AppAccessTokenAndBaseUrlsResponseData object
  static void saveAppAccessTokenAndBaseUrl(OrganizationResponseData data) {
    final jsonData = data.toJson(); // Convert the object to JSON
    StorageX.storage.write(StorageKeys.appAccessTokenAndBaseUrl, jsonData);
  }

  // Retrieve the AppAccessTokenAndBaseUrlsResponseData object
  static OrganizationResponseData getAppAccessTokenAndBaseUrl() {
    try {
      final jsonData = StorageX.storage.read(
        StorageKeys.appAccessTokenAndBaseUrl,
      );
      if (jsonData != null && jsonData is Map<String, dynamic>) {
        return OrganizationResponseData.fromJson(
          jsonData,
        ); // Convert JSON to object
      } else {
        return OrganizationResponseData(); // Return default object if no data is found
      }
    } catch (e) {
      return OrganizationResponseData(); // Return default object on error
    }
  }
}
