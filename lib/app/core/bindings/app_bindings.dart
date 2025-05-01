import 'package:cholai/app/views/auth/controller/auth_controller.dart';
import 'package:cholai/app/views/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import '../../../network/api_provider.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
