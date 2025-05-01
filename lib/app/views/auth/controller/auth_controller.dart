import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/core/helpers/enums.dart';
import 'package:fuzionest_chatai/app/core/helpers/snackbar_helper.dart';
import 'package:fuzionest_chatai/app/core/routes/app_routes.dart';
import 'package:fuzionest_chatai/app/core/services/system_local_service.dart';
import 'package:fuzionest_chatai/app/core/services/user_service.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/app/views/auth/widgets/phone_number_field_widget.dart';
import 'package:fuzionest_chatai/network/api_services/api_service.dart';
import 'package:fuzionest_chatai/network/api_services/data.dart';
import 'package:get/get.dart';
import '../data/otp_request_api_data.dart';
import '../data/otp_verify_api_data.dart';
import '../data/profile_create_api_data.dart';
import '../service/api_service.dart';

class AuthController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final TextEditingController aboutController = TextEditingController();
  var profileImageUrl = ''.obs;
  var profileImageUrlLoader = false.obs;
  Rx<Country> country =
      Country(name: '', countryCode: '', phoneCode: '', flag: '').obs;
  var buttonLoader = false.obs;
  Rx<OtpRequestResponseData> otpRequestResponse = OtpRequestResponseData().obs;
  Rx<OtpVerifyRequestResponseData> otpVerifyResponse =
      OtpVerifyRequestResponseData().obs;
  Rx<DocumentTempUploadResponseData> documentUploadtemp =
      DocumentTempUploadResponseData().obs;
  final userServie = Get.find<UserService>();
  void generateOtp() {
    if (GetUtils.isPhoneNumber(phoneController.text)) {
      Get.focusScope!.unfocus();
      callOtpRequestApi();
    } else {
      SnackbarHelper.showGetXSnackBar(
        msg: "Please enter a valid phone number.",
      );
    }
  }

  void verifyOtp(String otp) {
    if (otp.length == 6) {
      Get.focusScope!.unfocus();
      callOtpVerifyApi();
    } else {
      SnackbarHelper.showGetXSnackBar(msg: "Please enter a valid otp");
    }
  }

  void clearOtpBackPress() {
    phoneController.text = '';
    otpController.text = '';
  }

  void createProfile() {
    Get.focusScope!.unfocus();
    callProfileCreateApi();
  }

  void openImage(CameraAction action) async {
    if (action == CameraAction.kCamera) {
      final path = await ImagePickerService.openCamera(crop: true);
      uploadtemp(path);
    } else {
      final path = await ImagePickerService.openGallerySingle(crop: true);
      uploadtemp(path);
    }
  }

  void uploadtemp(String? path) {
    if (path != null) {
      LoggerUtil.debug("Document Path : $path");
      callUploadImageTempApi(path);
    }
  }

  void resetProfileParams() {
    documentUploadtemp.value = DocumentTempUploadResponseData();
    documentUploadtemp.refresh();
    nameController.value.text = '';
    aboutController.text = '';
  }
}

extension AuthControllerApi on AuthController {
  callOtpRequestApi() {
    buttonLoader.value = true;
    final request = OtpRequestData(
      phoneNumber: phoneController.text,
      countryCode: country.value.phoneCode,
    );
    otpRequestApi(request)
        .then((response) {
          buttonLoader.value = false;
          if (response.status == 1 || response.status == 2) {
            otpRequestResponse.value = response;
            otpRequestResponse.refresh();
            Get.toNamed(AppRoutes.otpView);
          } else {
            SnackbarHelper.showGetXSnackBar(msg: response.message);
          }
        })
        .onError((error, st) {
          buttonLoader.value = false;
          SnackbarHelper.showGetXSnackBar(msg: error.toString());
        });
  }

  callOtpVerifyApi() {
    buttonLoader.value = true;
    final request = OtpVerifyRequestData(
      phoneNumber: phoneController.text,
      countryCode: country.value.phoneCode,
      otp: otpController.text,
      userStatus: otpRequestResponse.value.userStatus ?? "",
    );
    otpVerifyApi(request)
        .then((response) {
          buttonLoader.value = false;
          if (response.status == 1 && response.responseData != null) {
            userServie.logInUserInfo(response.responseData!);
          } else if (response.status == 2) {
            otpVerifyResponse.value = response;
            otpVerifyResponse.refresh();
            Get.offAndToNamed(AppRoutes.profileSetUpView);
          } else {
            SnackbarHelper.showGetXSnackBar(msg: response.message);
          }
        })
        .onError((error, st) {
          buttonLoader.value = false;
          SnackbarHelper.showGetXSnackBar(msg: error.toString());
        });
  }

  callProfileCreateApi() {
    buttonLoader.value = true;
    final request = ProfileCreateRequestData(
      phoneNumber: otpVerifyResponse.value.responseData?.phoneNumber ?? "",
      countryCode: otpVerifyResponse.value.responseData?.countryCode ?? "",
      name: nameController.value.text,
      userId: otpVerifyResponse.value.responseData?.userId ?? "",
      about: aboutController.text,
      tempImage: documentUploadtemp.value.fileName ?? "",
    );
    profileCreateApi(request)
        .then((response) {
          buttonLoader.value = false;
          if (response.status == 1 && response.responseData != null) {
            userServie.logInUserInfo(response.responseData!);
          } else {
            SnackbarHelper.showGetXSnackBar(msg: response.message);
          }
        })
        .onError((error, st) {
          buttonLoader.value = false;
          SnackbarHelper.showGetXSnackBar(msg: error.toString());
        });
  }

  callUploadImageTempApi(String path) {
    profileImageUrlLoader.value = true;

    documentUploadTempApi(path)
        .then((response) {
          profileImageUrlLoader.value = false;
          if (response.status == 1) {
            // Get.toNamed(AppRoutes.dashboardView);
            documentUploadtemp.value = response;
            documentUploadtemp.refresh();
          } else {
            SnackbarHelper.showGetXSnackBar(msg: response.message);
          }
        })
        .onError((error, st) {
          profileImageUrlLoader.value = false;
          SnackbarHelper.showGetXSnackBar(msg: error.toString());
        });
  }
}
