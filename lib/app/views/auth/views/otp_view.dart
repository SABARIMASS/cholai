import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/app/views/auth/widgets/otp_resend_widget.dart';
import 'package:fuzionest_chatai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:fuzionest_chatai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:fuzionest_chatai/app/widgets/buttons/custom_button.dart';
import 'package:fuzionest_chatai/app/widgets/system_widgets/safe_area_container.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:get/get.dart';
import '../../../../shared/app_style.dart';
import '../controller/auth_controller.dart';
import '../widgets/otp_field_widget.dart';
import '../widgets/rich_text_widget_otp.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        onPopInvokedWithResult: (didPop, result) {
          controller.clearOtpBackPress();
        },
        child: IgnorePointer(
          ignoring: controller.buttonLoader.value,
          child: SafeAreaContainer(
            child: Scaffold(
              appBar: _myAppBarWidget(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      RichTextWidgetOtp(
                        phoneNumber:
                            "${controller.country.value.phoneCode} ${controller.phoneController.text}",
                      ),
                      SizedBox(height: 20.h),
                      OtpInputField(
                        otpController: controller.otpController,
                        onOtpFilled: (otp) {
                          controller.verifyOtp(otp);
                        },
                      ),
                      ResendOtpWidget(
                        userId:
                            controller
                                .otpRequestResponse
                                .value
                                .responseData
                                ?.userId ??
                            "",
                        onOtpResend: (String otp) {
                          controller.otpRequestResponse.value.otp = otp;
                          controller.otpRequestResponse.refresh();
                        },
                      ),
                      CustomButton(
                        isLoader: controller.buttonLoader.value,
                        onTap: () {
                          controller.verifyOtp(controller.otpController.text);
                        },
                        height: 30.h,
                        text: "Verify",
                        style: TextStyle(
                          fontWeight: AppFontWeight.semibold.value,
                          fontSize: AppFontSize.small.value,
                          color:
                              Theme.of(
                                context,
                              ).appTheme.kWhiteColor, // Specify text color
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Text(
                        controller.otpRequestResponse.value.otp ?? "",
                        style: TextStyle(
                          fontWeight: AppFontWeight.semibold.value,
                          fontSize: AppFontSize.small.value,
                          color:
                              Theme.of(context)
                                  .appTheme
                                  .kPrimaryTextColor, // Specify text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  MyAppBar _myAppBarWidget() {
    return MyAppBar(
      title: AppBarTitleWidget(
        onTap: () {
          controller.clearOtpBackPress();
          Get.back();
        },
        title: "OTP Verification",
        disableBackButton: false,
      ),
    );
  }
}
