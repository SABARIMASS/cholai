import 'package:fuzionest_chatai/app/core/helpers/enums.dart'
    show AppLaunchProgressStatus;
import 'package:get/get.dart';

import '../languages/language_global.dart';

class MyUtilsGetString {
  static String appLaunchProgressing(AppLaunchProgressStatus status) {
    if (status == AppLaunchProgressStatus.kGetCore) {
      return LanguageGlobal.coreDataFetching.tr;
    } else if (status == AppLaunchProgressStatus.kLocation) {
      return LanguageGlobal.accessingLocation.tr;
    } else {
      return LanguageGlobal.settingUp.tr;
    }
  }
}
