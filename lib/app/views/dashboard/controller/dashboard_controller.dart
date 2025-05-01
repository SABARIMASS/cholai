import 'package:cholai/app/core/services/user_service.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  final userService = Get.find<UserService>();
  var dashboardCurrentViewIndex = 0.obs;

  void onChangingDashboardView(int index) {
    dashboardCurrentViewIndex.value = index;
  }
}
