import 'package:app_settings/app_settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/widgets/system_widgets/safe_area_container.dart'
    show SafeAreaContainer;
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../../../shared/app_style.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  int androidVersion = 28;
  Future<void> checkAndroidVersion() async {
    AndroidDeviceInfo androidInfo;
    final deviceInfo = DeviceInfoPlugin();
    try {
      androidInfo = await deviceInfo.androidInfo;
      androidVersion = androidInfo.version.sdkInt;
    } catch (e) {
      androidVersion = 28;
    }

    setState(() {});
  }

  @override
  void initState() {
    checkAndroidVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaContainer(
      statusBarColor: Theme.of(context).appTheme.kAppBackgroundColor,
      themedark: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).appTheme.kAppBackgroundColor,
        body: _bodyWidget(context),
      ),
    );
  }

  Center _bodyWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(Assets.noInternet, height: 200.h),
          Text(
            'Whoops!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFontSize.extraextralarge.value,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).appTheme.kPrimaryTextColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'No Internet connection was found. Check your connection or try again.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFontSize.large.value,
              color: Theme.of(context).appTheme.kPrimaryTextColor,
            ),
          ),
          const SizedBox(height: 24),
          (androidVersion <= 28 && GetPlatform.isAndroid)
              ? const SizedBox.shrink()
              : GradientButton(
                onPressed: () async {
                  if (GetPlatform.isAndroid) {
                    if (androidVersion <= 28) {
                      await AppSettings.openAppSettings(
                        type: AppSettingsType.settings,
                      );
                    } else {
                      await AppSettings.openAppSettingsPanel(
                        AppSettingsPanelType.internetConnectivity,
                      );
                    }
                  } else if (GetPlatform.isIOS) {
                    await AppSettings.openAppSettings();
                  }
                },
                gradientColors: const [
                  Color.fromARGB(255, 241, 107, 30),
                  Color.fromARGB(255, 250, 101, 51),
                ],
                nameButton: 'Open Setting',
              ),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final List<Color> gradientColors;
  final String nameButton;
  final void Function()? onPressed;

  const GradientButton({
    super.key,
    required this.gradientColors,
    required this.nameButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: gradientColors),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(4.r),
          child: Text(
            nameButton,
            style: TextStyle(
              fontSize: AppFontSize.large.value,
              color: Theme.of(context).appTheme.kWhiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
