import 'package:firebase_core/firebase_core.dart';
import 'package:cholai/app/core/services/notification_service.dart';
import 'package:cholai/app/core/utils/logger_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../shared/themex_colors.dart';
import '../../core/languages/languages.dart';
import '../../core/services/user_service.dart';

class AppMainOnInit {
  static Future appOnInit() async {
    try {
      await GetStorage.init();
      await fireBaseInitialize();
      themexOnInit();
      Languages.getLanguage();
      Get.put(UserService());
      return;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<void> fireBaseInitialize() async {
    try {
      await Firebase.initializeApp();
      await NotificationService.init();
      return;
    } catch (e) {
      LoggerUtil.debug("ERROR FireBaseInitialize $e");
      return;
    }
  }
}
