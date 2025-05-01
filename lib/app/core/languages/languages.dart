import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:get/get.dart';
import '../../app_intialization/controller/my_app_controller.dart';
import '../../widgets/menu_widgets/menu_label_widget.dart' show MenuItemWidget;
import '../local_storage/storage_service.dart';
import 'en_language.dart';
import 'language_json.dart';
import 'tn_language.dart';
import 'data/language_api_data.dart';

class Languages extends Translations {
  static Locale setAppLanguage = const Locale('en', 'US');
  static late LanguageResponseData languageContent;
  @override
  Map<String, Map<String, String>> get keys => {
    'tn_IN': TnLanguage().tnLanguage,
    'en_US': EnLanguage().enLanguage,
  };

  static void updateLanguage(String loc) {
    StorageX().updateAppLanguage(loc);
    final controller = Get.find<MyAppController>();
    switch (loc) {
      case 'en':
        controller.setAppLanguage.value = const Locale('en', 'US');
        setAppLanguage = const Locale('en', 'US');

        break;
      case 'tn':
        controller.setAppLanguage.value = const Locale('tn', 'IN');
        setAppLanguage = const Locale('tn', 'IN');
        break;
      default:
        controller.setAppLanguage.value = const Locale('en', 'US');
        setAppLanguage = const Locale('en', 'US');
    }
  }

  static void getLanguage() async {
    languageContent = LanguageResponseData.fromJson(languageJson);
    var loc = await StorageX().getAppLanguage();
    LoggerUtil.debug("APP LANGUAGE $loc");
    LoggerUtil.debug("APP LANGUAGE ${languageContent.tn.online}");
    LoggerUtil.debug("APP LANGUAGE $loc");
    switch (loc) {
      case 'en':
        setAppLanguage = const Locale('en', 'US');
        break;
      case 'tn':
        setAppLanguage = const Locale('tn', 'IN');
        break;
      default:
        setAppLanguage = const Locale('en', 'US');
    }
  }

  static languagesBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Theme.of(Get.context!).appTheme.kAppBackgroundColor,
        child: Wrap(
          children: <Widget>[
            MenuItemWidget(
              duration: const Duration(milliseconds: 0),
              // icon: Icons.brightness_5,
              title: "English",
              onTap: () {
                Get.updateLocale(const Locale('en', 'US'));
                updateLanguage('en');
                Get.back();
              },
              isSidebarOpen: true,
              suffixEnable: setAppLanguage.languageCode == 'en',
            ),
            MenuItemWidget(
              duration: const Duration(milliseconds: 0),
              //icon: Icons.brightness_2,
              title: Languages.languageContent.tn.tamil,
              onTap: () async {
                Get.updateLocale(const Locale('tn', 'IN'));
                updateLanguage('tn');
                Get.back();
              },
              isSidebarOpen: true,
              suffixEnable: setAppLanguage.languageCode == 'tn',
            ),
          ],
        ),
      ),
    );
  }
}
