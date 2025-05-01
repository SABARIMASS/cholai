import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/app/views/auth/data/profile_create_api_data.dart';
import 'package:get/get.dart';
import '../../../shared/themex_colors.dart';
import '../../core/config/app_helpers.dart';
import '../../core/config/data/get_core_api_data.dart';
import '../../core/languages/language_global.dart';
import '../../core/languages/languages.dart';
import '../../core/routes/app_routes.dart';
import '../../core/services/user_service.dart';
import '../../widgets/dialoges/app_dialog_warning.dart';
import 'app_main.dart';
import 'connection_manager_controller.dart';
import '../../core/helpers/enums.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class MyAppController extends GetxController {
  Rx<GetCoreResponseData> appGetCoreData = GetCoreResponseData().obs;
  final _appConnection = Get.put(ConnectionManagerController());
  final userService = Get.find<UserService>();
  Rx<AppLaunchProgressStatus> appProgressState =
      AppLaunchProgressStatus.kNone.obs;
  Rx<AppLaunckStatus> appScreen = AppLaunckStatus.kLoading.obs;
  Rx<Locale> setAppLanguage = const Locale('en', 'US').obs;
  Rx<ThemeMode> themeMode = Themex.themeMode.value.obs;
  Future<bool> appIntialization() async {
    await AppMainOnInit.fireBaseInitialize();
    appProgressState.value = AppLaunchProgressStatus.kNone;
    Get.focusScope?.unfocus();
    await _requestTrackingTransparencyPermission();
    await AppHelpers.getAppInfo();
    if (_appConnection.appIntialNetWorkStatus.value == NetworkType.mobileData ||
        _appConnection.appIntialNetWorkStatus.value == NetworkType.wifi) {
      redirectToView();
    } else {
      appScreen.value = AppLaunckStatus.kNoInternet;
    }
    return true;
  }

  void redirectToView() async {
    UserInfoData userData = userService.userInfo.value;
    LoggerUtil.debug("USER HAVE ${userData.userId}");
    final status = userData.userId != null && userData.userId != '';
    switch (status) {
      case true:
        Get.offAllNamed(AppRoutes.dashboardView);
        break;
      default:
        Get.offAllNamed(AppRoutes.signInView);
        break;
    }
  }

  @override
  void onInit() {
    setAppLanguage.value = Languages.setAppLanguage;
    ever(
      _appConnection.appIntialNetWorkStatus,
      (callback) async => {appIntialization()},
    );

    super.onInit();
  }

  Future<void> _requestTrackingTransparencyPermission() async {
    if (Platform.isIOS) {
      try {
        final TrackingStatus status =
            await AppTrackingTransparency.trackingAuthorizationStatus;
        if (status == TrackingStatus.notDetermined) {
          await showCustomTrackingDialog();

          await AppTrackingTransparency.requestTrackingAuthorization();
        }
        await AppTrackingTransparency.getAdvertisingIdentifier();
        return;
      } catch (e) {
        return;
      }
    } else {
      return;
    }
  }

  Future<void> showCustomTrackingDialog() async {
    await showWarningDialog(
      buttonText: LanguageGlobal.continueText.tr,
      content: LanguageGlobal.permissionToTrack.tr,
      context: Get.context!,
      title: LanguageGlobal.dearUser.tr,
    );
  }
}
