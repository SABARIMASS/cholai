import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/buttons/custom_button.dart';
import 'package:cholai/app/widgets/system_widgets/safe_area_container.dart';
import 'package:cholai/shared/theme.dart';
import 'package:get/get.dart';
import '../../../../shared/app_style.dart';
import '../controller/auth_controller.dart';
import '../widgets/phone_number_field_widget.dart';
import '../widgets/rich_text_widget_signin.dart';

class SignInView extends GetView<AuthController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop:
            !controller.buttonLoader.value &&
            !controller.profileImageUrlLoader.value,
        child: SafeAreaContainer(
          child: IgnorePointer(
            ignoring:
                controller.buttonLoader.value ||
                controller.profileImageUrlLoader.value,
            child: Scaffold(
              appBar: _myAppBarWidget(),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  spacing: 20.h,
                  children: [
                    RichTextWidgetSignIn(),
                    CountryCodePickerTextField(
                      textController: controller.phoneController,
                      onCountrySelected: (country) {
                        controller.country.value = country;
                        controller.country.refresh();
                      },
                      onSubmitted: (p0) {
                        controller.generateOtp();
                      },
                    ),
                    CustomButton(
                      width: double.maxFinite,
                      isLoader: controller.buttonLoader.value,
                      onTap: () {
                        controller.generateOtp();
                      },
                      height: 30.h,
                      text: "Generate OTP",
                      style: TextStyle(
                        fontWeight: AppFontWeight.semibold.value,
                        fontSize: AppFontSize.small.value,
                        color:
                            Theme.of(
                              context,
                            ).appTheme.kWhiteColor, // Specify text color
                      ),
                    ),
                  ],
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
        title: "OTP Verification",
        disableBackButton: true,
      ),
    );
  }
}
