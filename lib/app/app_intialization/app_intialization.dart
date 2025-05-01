import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/system_widgets/safe_area_container.dart';
import '../widgets/system_widgets/splash_screen.dart';
import 'connection_widget/no_internet.dart';
import 'controller/my_app_controller.dart';
import '../core/helpers/enums.dart';

class AppIntialization extends StatelessWidget {
  const AppIntialization({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeAreaContainer(
      child: GetBuilder<MyAppController>(
        init: MyAppController(),
        builder: (controller) {
          return Obx(() {
            return _appScreenLaunch(
              screenType: controller.appScreen.value,
              splashType: controller.appProgressState.value,
            );
          });
        },
      ),
    );
  }

  Widget _appScreenLaunch({
    required AppLaunckStatus screenType,
    required AppLaunchProgressStatus splashType,
  }) {
    switch (screenType) {
      case AppLaunckStatus.kNoInternet:
        return const NoInternetScreen();
      default:
        return SplashScreen();
    }
  }
}
