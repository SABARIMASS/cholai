import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fuzionest_chatai/app/app_intialization/controller/my_app_controller.dart';

import 'package:fuzionest_chatai/app/core/local_storage/storage_service.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/app/widgets/menu_widgets/menu_label_widget.dart';
import 'package:get/get.dart';

themexOnInit() {
  try {
    Get.put(Themex());
  } catch (e) {
    LoggerUtil.error(e.toString());
  }
}

class Themex extends GetxController {
  static Rx<CustomThemeData> theme = CustomThemeData().obs;
  static Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  static Rx<ThemeMode> themeModeType = ThemeMode.system.obs;
  @override
  void onInit() {
    _getThemeMode();
    super.onInit();
  }

  static Future _getThemeMode() async {
    themeMode.value = await StorageX().getThemeMode();
    LoggerUtil.debug("THEME : ${themeMode.value}");
    if (Get.isRegistered<MyAppController>()) {
      final controller = Get.find<MyAppController>();
      controller.themeMode.value = themeMode.value;
    } else {}
    // theme.value = _lightTheme;
    if (themeMode.value == ThemeMode.system) {
      // ignore: deprecated_member_use
      final isLight =
          // ignore: deprecated_member_use
          SchedulerBinding.instance.window.platformBrightness ==
          Brightness.light;
      if (isLight == true) {
        themeModeType.value = ThemeMode.light;
        theme.value = _lightTheme;

        theme.refresh();
        return;
      } else if (isLight == false) {
        themeModeType.value = ThemeMode.dark;
        theme.value = _darkTheme;
        theme.refresh();
        return;
      } else {
        return;
      }
    } else if (themeMode.value == ThemeMode.light) {
      themeModeType.value = ThemeMode.light;
      theme.value = _lightTheme;
      theme.refresh();

      return;
    } else if (themeMode.value == ThemeMode.dark) {
      themeModeType.value = ThemeMode.dark;
      theme.value = _darkTheme;
      theme.refresh();
      return;
    } else {
      return;
    }
  }

  static void changeThemeMode({required ThemeMode themeMode}) async {
    await StorageX().updateThemeMode(themeMode);
    await _getThemeMode();
    Get.changeThemeMode(themeMode);

    //Get.offAllNamed(AppRoutes.loginPage);
    // Get.offAll(() => const AppIntialization());
  }

  static final CustomThemeData _lightTheme = CustomThemeData(
    kAppColor: const Color(0xFF008080), // Primary CholAi color (Teal)
    kPrimaryColor: const Color(0xFF008080), // Teal for primary elements
    kPrimaryColorShadow: const Color(0xFFADD8E6), // Light Blue shadow
    kPrimaryTextColor: const Color(
      0xFF333333,
    ), // Dark grey text for readability
    kSecondaryTextColor: Colors.white, // Light grey text for secondary elements
    kHintTextColor: const Color(
      0x80333333,
    ), // Hint text with 50% opacity (Dark Grey)
    kTextFieldPrimaryBackgroundColor:
        Colors.white, // White TextField background
    kAppBackgroundColor: const Color(
      0xFFFFFFFF,
    ), // White background for light mode
    kSwitchThumbColorColor: const Color(0xFF008080), // Teal for switch thumb
    kAppBackgroundColorSecondary: const Color(
      0xFFF5F5F5,
    ), // Light grey background for secondary elements
    kStatusBarPrimaryColor: const Color(0xFFFFFFFF), // White status bar
    kIconPrimaryColor: const Color(0xFF008080), // Teal icons
    kInActiveColor: const Color(0xFFDDDDDD), // Light grey for inactive elements
    kPrimaryLoader: const Color(0xFFADD8E6), // Light Blue loader
    kAppbarPrimaryColor: const Color(0xFF008080), // Teal app bar
    kTabBarPrimaryColor: const Color(0xFFADD8E6), // Light Blue tab bar
    kIconSecondaryColor: Colors.white, // White icons on colored backgrounds
    kLightColor: const Color(0xFFF0F0F0), // Light background for light mode
    kIconLightColor: const Color(0xFFAAAAAA), // Light grey icons
    kButtonPrimaryColor: const Color(0xFF008080), // Teal button color
    kLoaderPrimaryColor: const Color(0xFFADD8E6), // Light Blue loader
    kBlack: Colors.black, // Consistent black color
    kCursorColor: const Color(0xFF008080), // Light grey cursor color
    kRed: Colors.red, // Red for warnings/errors
    kGreen: const Color(0xFF4CAF50), // Green for success
    kCheckColor: Colors.white, // White check marks
    kprimaryBorderColor: const Color(0xFF008080), // Teal borders
    kLightBorderColor: const Color(0xFFE0E0E0), // Light grey borders
    kDisableColor: const Color(0xFFDDDDDD), // Disabled elements
    kWhiteColor: Colors.white, // Consistent white color
  );

  static final CustomThemeData _darkTheme = CustomThemeData(
    kAppColor: const Color(0xFF008080), // Primary CholAi color (Teal)
    kPrimaryColor: const Color(
      0xFF006666,
    ), // Dark Teal for primary elements in dark mode
    kPrimaryColorShadow: const Color(0xFFADD8E6), // Light Blue shadow
    kPrimaryTextColor: Colors.white, // White text for dark mode
    kSecondaryTextColor: const Color(
      0xFF333333,
    ), // Light grey text for secondary elements
    kHintTextColor: const Color(
      0x80FFFFFF,
    ), // Hint text with 50% opacity (White)
    kTextFieldPrimaryBackgroundColor: const Color(
      0xFF333333,
    ), // Dark background for TextField
    kAppBackgroundColor: const Color(
      0xFF121212,
    ), // Dark background for dark mode
    kAppBackgroundColorSecondary: const Color(
      0xFF1F1F1F,
    ), // Secondary dark background
    kSwitchThumbColorColor: const Color(0xFF008080), // Teal for switch thumb
    kStatusBarPrimaryColor: const Color(0xFF121212), // Black status bar
    kIconPrimaryColor: Colors.white, // White icons for dark theme
    kInActiveColor: const Color(0xFF555555), // Dark grey for inactive elements
    kPrimaryLoader: const Color(0xFFADD8E6), // Light Blue loader
    kAppbarPrimaryColor: const Color(0xFF008080), // Teal app bar
    kTabBarPrimaryColor: const Color(0xFF1F1F1F), // Dark tab bar
    kIconSecondaryColor: const Color(
      0xFF333333,
    ), // Dark grey icons on light backgrounds
    kLightColor: const Color(0xFF2A2A2A), // Lighter dark elements
    kIconLightColor: const Color(0xFFAAAAAA), // Light grey icons
    kButtonPrimaryColor: const Color(0xFF008080), // Teal buttons
    kLoaderPrimaryColor: const Color(0xFFADD8E6), // Light Blue loader
    kBlack: Colors.black, // Consistent black color
    kCursorColor: const Color(0xFF008080), // Light grey cursor color
    kRed: Colors.red, // Red for warnings/errors
    kGreen: const Color(0xFF4CAF50), // Green for success
    kCheckColor: Colors.white, // White check marks
    kprimaryBorderColor: Colors.white, // White borders for contrast
    kLightBorderColor: const Color(
      0xFF333333,
    ), // Dark grey borders for dark theme
    kDisableColor: const Color(0xFF555555), // Disabled elements
    kWhiteColor: Colors.white, // Consistent white color
  );

  static themeXBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Themex.theme.value.kAppBackgroundColor,
        child: Wrap(
          children: <Widget>[
            MenuItemWidget(
              // duration: const Duration(milliseconds: 300),
              icon: Icons.light_mode,
              title: "Light ",
              onTap: () {
                changeThemeMode(themeMode: ThemeMode.light);
                Get.back();
              },
              isSidebarOpen: true,
              suffixEnable: themeMode.value == ThemeMode.light,
            ),
            MenuItemWidget(
              //duration: const Duration(milliseconds: 300),
              icon: Icons.brightness_2,
              title: "Dark",
              onTap: () async {
                changeThemeMode(themeMode: ThemeMode.dark);
                Get.back();
              },
              isSidebarOpen: true,
              suffixEnable: themeMode.value == ThemeMode.dark,
            ),
            MenuItemWidget(
              //duration: const Duration(milliseconds: 300),
              icon: Icons.brightness_5,
              title: "System Theme",
              onTap: () async {
                changeThemeMode(themeMode: ThemeMode.system);
                Get.back();
              },
              isSidebarOpen: true,
              suffixEnable: themeMode.value == ThemeMode.system,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomThemeData {
  final Color kAppColor;
  Color kPrimaryColor;
  final Color kPrimaryColorShadow;
  final Color kPrimaryTextColor;
  final Color kSecondaryTextColor;
  final Color kHintTextColor;
  final Color kTextFieldPrimaryBackgroundColor;
  final Color kTextFieldSecondaryBackgroundColor;
  final Color kAppBackgroundColor;
  final Color kSwitchThumbColorColor;
  final Color kAppBackgroundColorSecondary;
  final Color kStatusBarPrimaryColor;
  final Color kIconPrimaryColor;
  final Color kInActiveColor;
  final Color kPrimaryLoader;
  final Color kAppbarPrimaryColor;
  final Color kTabBarPrimaryColor;
  final Color kIconSecondaryColor;

  final Color kLightColor;
  final Color kIconLightColor;
  final Color kButtonPrimaryColor;
  final Color kLoaderPrimaryColor;
  final Color kOnline;
  final Color kBlack;
  final Color kCursorColor;
  final Color kRed;
  final Color kGreen;
  final Color kCheckColor;
  final Color kprimaryBorderColor;
  final Color kLightBorderColor;
  final Color kOnInfoColor;
  final Color kOnWarningColor;
  final Color kOnSuccessColor;
  final Color kOnErrorColor;
  final Color kDisableColor;
  final Color kWhiteColor;

  // Constructor
  CustomThemeData({
    //this.primaryColor = const Color(0xFF253640),
    this.kAppColor = const Color(0xFFFFD700),
    this.kPrimaryColor = const Color(0xFF1C1B1F),
    this.kPrimaryColorShadow = const Color.fromARGB(255, 200, 235, 255),
    this.kPrimaryTextColor = Colors.black,
    this.kSecondaryTextColor = const Color(0xFFF3F6F8),
    this.kTextFieldPrimaryBackgroundColor = const Color.fromARGB(
      255,
      250,
      250,
      250,
    ),
    this.kTextFieldSecondaryBackgroundColor = const Color.fromARGB(
      255,
      231,
      231,
      231,
    ),
    this.kAppBackgroundColor = const Color.fromARGB(255, 255, 255, 255),
    this.kAppBackgroundColorSecondary = const Color.fromARGB(
      255,
      222,
      222,
      222,
    ),
    this.kSwitchThumbColorColor = Colors.white,
    this.kStatusBarPrimaryColor = const Color.fromARGB(255, 255, 255, 255),
    this.kIconPrimaryColor = const Color.fromARGB(255, 0, 0, 0),
    this.kInActiveColor = const Color.fromARGB(255, 112, 116, 117),
    this.kPrimaryLoader = const Color.fromARGB(255, 255, 255, 255),
    this.kAppbarPrimaryColor = const Color.fromARGB(255, 243, 92, 42),
    this.kTabBarPrimaryColor = const Color.fromARGB(255, 244, 240, 238),
    this.kIconSecondaryColor = const Color.fromARGB(255, 255, 255, 255),
    this.kLightColor = const Color.fromARGB(255, 200, 203, 203),
    this.kIconLightColor = const Color.fromARGB(255, 200, 203, 203),
    this.kCursorColor = const Color.fromARGB(255, 236, 236, 236),
    this.kButtonPrimaryColor = const Color.fromARGB(255, 243, 92, 42),
    this.kLoaderPrimaryColor = const Color.fromARGB(255, 243, 92, 42),
    this.kOnline = const Color(0xFF18761B),
    this.kBlack = Colors.black,
    this.kRed = Colors.red,
    this.kHintTextColor = const Color.fromARGB(255, 0, 0, 0),
    this.kGreen = const Color(0xFF4F955D),
    this.kCheckColor = Colors.white,
    this.kprimaryBorderColor = const Color.fromARGB(255, 200, 203, 203),
    this.kLightBorderColor = const Color.fromARGB(255, 220, 220, 220),
    this.kOnInfoColor = Colors.blue,
    this.kOnWarningColor = Colors.red,
    this.kOnSuccessColor = Colors.black,
    this.kOnErrorColor = Colors.red,
    this.kDisableColor = Colors.grey,
    this.kWhiteColor = Colors.white,
  });
}
