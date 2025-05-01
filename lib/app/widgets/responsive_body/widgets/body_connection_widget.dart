import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../app_intialization/controller/connection_manager_controller.dart';
import '../../../core/constants/image_assets.dart';
import '../../../core/helpers/enums.dart';
import '../message_body_widgets/show_message_svg_widget.dart';

class BodyConnectionWidget extends StatefulWidget {
  const BodyConnectionWidget({
    super.key,
    required this.body,
    required this.checkInternet,
    this.refresh, // Optional refresh function
  });

  final Widget body;
  final bool checkInternet;
  final VoidCallback? refresh; // Define the type for the refresh function

  @override
  BodyConnectionWidgetState createState() => BodyConnectionWidgetState();
}

class BodyConnectionWidgetState extends State<BodyConnectionWidget> {
  final netWork = Get.put(ConnectionManagerController());
  bool hasCalledRefresh = false; // Track if refresh has been called

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Call refresh only if network status changes to noNetWork and hasn't been called yet
      if (netWork.netWorkStatus.value != NetworkType.noNetWork &&
          hasCalledRefresh == false) {
        _attemptRefresh();
        hasCalledRefresh = true; // Set to true to prevent further calls
      } else if (netWork.netWorkStatus.value == NetworkType.noNetWork) {
        hasCalledRefresh = false; // Reset when connected
      }

      return connection();
    });
  }

  void _attemptRefresh() {
    // Call the refresh function if provided
    if (widget.refresh != null) {
      Future.microtask(
        widget.refresh!,
      ); // Use Future.microtask to avoid blocking the build
    }
  }

  Widget connection() {
    if (widget.checkInternet) {
      switch (netWork.netWorkStatus.value) {
        case NetworkType.noNetWork:
          return ShowMessageSvgWidget(
            svgPath: Assets.noConnection,
            message: "No Internet Connection",
            onRefresh: widget.refresh,
          );

        default:
          return widget.body; // Use widget.body instead of body
      }
    } else {
      return widget.body;
    }
  }
}
