import 'package:flutter/material.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/helpers/enums.dart';
import '../controller/connection_manager_controller.dart';

class ConnectionLostWidget extends StatelessWidget {
  ConnectionLostWidget({super.key, required this.textDirection});
  final TextDirection textDirection;
  final connection = Get.put(ConnectionManagerController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          connection.appIntialNetWorkStatus.value != NetworkType.noNetWork
              ? Obx(
                () => _nointerconnectionWidget(
                  connection:
                      connection.netWorkStatus.value == NetworkType.noNetWork,
                  context: context,
                ),
              )
              : const SizedBox.shrink(),
    );
  }

  Widget _nointerconnectionWidget({
    required bool connection,
    required BuildContext context,
  }) {
    return connection == true
        ? Directionality(
          textDirection: textDirection,
          child: Container(
            height: 30,
            width: double.maxFinite,
            color: Theme.of(context).appTheme.kAppBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.signal_wifi_off,
                    size: 14.r,
                    color: Theme.of(context).appTheme.kPrimaryColor,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "No internet connection",
                    style: TextStyle(
                      color: Theme.of(context).appTheme.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        : const SizedBox.shrink();
  }
}
