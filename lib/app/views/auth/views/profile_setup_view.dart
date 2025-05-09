import 'package:cholai/app/core/helpers/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/app/core/constants/image_assets.dart';
import 'package:cholai/app/core/helpers/enums.dart';
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/buttons/custom_button.dart';
import 'package:cholai/app/widgets/system_widgets/safe_area_container.dart';
import 'package:cholai/shared/theme.dart';
import 'package:get/get.dart';
import '../../../../shared/app_style.dart';
import '../controller/auth_controller.dart';
import '../widgets/create_profile_widget.dart';

class ProfileSetUpView extends GetView<AuthController> {
  const ProfileSetUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        onPopInvokedWithResult: (didPop, result) {
          controller.resetProfileParams();
        },
        child: SafeAreaContainer(
          child: Scaffold(
            appBar: _myAppBarWidget(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    spacing: 20.h,
                    children: [
                      UserProfileWidget(
                        loadImage: controller.profileImageUrlLoader.value,
                        imageUrl:
                            controller.documentUploadtemp.value.tempPath ?? "",
                        onTap: () {
                          AppDialogHelpers.chooseCameraAction(
                            onTap: (CameraAction action) {
                              controller.openImage(action);
                            },
                          );
                        },
                        errorAssetImage: Assets.noImages,
                        overlayIcon: Icons.camera_alt_rounded,
                        nameController: controller.nameController.value,
                        aboutController: controller.aboutController,
                      ),
                      CustomButton(
                        isLoader: controller.buttonLoader.value,
                        // isDisabled: controller.nameController.value.text.isEmpty,
                        onTap: () {
                          controller.createProfile();
                        },
                        height: 30.h,
                        text: "Save",
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
        ),
      );
    });
  }

  MyAppBar _myAppBarWidget() {
    return MyAppBar(
      title: AppBarTitleWidget(
        title: "Profile Info",
        alignment: Alignment.centerLeft,
        disableBackButton: false,
      ),
    );
  }
}
