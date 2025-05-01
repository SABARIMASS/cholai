import 'package:flutter/material.dart';
import 'package:cholai/app/core/helpers/app_dialog.dart';
import 'package:cholai/app/core/local_storage/storage_service.dart';
import 'package:cholai/app/core/routes/app_routes.dart';
import 'package:cholai/app/views/auth/data/profile_create_api_data.dart';
import 'package:cholai/shared/theme.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  Rx<UserInfoData> userInfo = UserInfoData().obs;
  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  void getUserInfo() async {
    userInfo.value = await StorageX.getUserData() ?? UserInfoData();
    userInfo.refresh();
  }

  void logInUserInfo(UserInfoData userData) {
    StorageX.saveAccessToken('');
    StorageX.saveUserData(userData);
    getUserInfo();
    Get.offAllNamed(AppRoutes.dashboardView);
  }

  void logOutUser() async {
    final result = await AppDialogHelpers.showCustomGetXDialog(
      title: 'Logout Confirmation',
      message: 'Are you sure you want to log out?',
      okText: 'Logout',
      noText: 'Cancel',
      noTextColor: null,
      okTextColor: Theme.of(Get.context!).appTheme.kRed,
      okValue: 'yes',
      noValue: 'no',
    );
    if (result == "yes") {
      StorageX.saveUserData(UserInfoData());
      getUserInfo();
      Get.offAllNamed(AppRoutes.signInView);
    }
  }

  void updateUserInfo(UserInfoData userData) {
    StorageX.saveUserData(userData);
    getUserInfo();
  }
}
