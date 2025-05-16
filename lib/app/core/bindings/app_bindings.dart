import 'package:cholai/app/controllers/auth_controller.dart';
import 'package:cholai/app/controllers/chat_detail_controller.dart';
import 'package:cholai/app/controllers/chat_list_controller.dart';
import 'package:cholai/app/controllers/contact_controller.dart';
import 'package:cholai/app/views/dashboard/controller/dashboard_controller.dart';
import 'package:cholai/app/controllers/settings_controller.dart';
import 'package:get/get.dart';
import '../../../network/api_provider.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<ChatListController>(() => ChatListController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<ChatDetailController>(() => ChatDetailController());
  }
}
