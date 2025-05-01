import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/core/helpers/app_dialog.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelpers {
  /// Shows a dialog to ask the user to open settings for audio permission
  static Future<void> showAudioPermissionDialog() async {
    final result = await AppDialogHelpers.showCustomGetXDialog(
      title: 'Microphone Permission Required',
      message:
          'Microphone permission is not granted. To continue, please enable it in your device settings.',
      okText: 'Continue',
      noText: 'Cancel',
      okTextColor: Theme.of(Get.context!).appTheme.kOnInfoColor,
      noTextColor: null,
      okValue: 'yes',
      noValue: 'no',
    );

    if (result == 'yes') {
      openAppSettings();
    }
  }

  /// Checks and requests audio permission, if not granted shows dialog
  static Future<void> checkAndRequestAudioPermission() async {
    final status = await Permission.microphone.status;

    if (!status.isGranted) {
      final request = await Permission.microphone.request();

      if (!request.isGranted) {
        await showAudioPermissionDialog();
      }
    }
  }
}
