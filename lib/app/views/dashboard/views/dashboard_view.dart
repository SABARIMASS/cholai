import 'package:flutter/material.dart';
import 'package:cholai/app/views/calls/views/calls_view.dart';
import 'package:cholai/app/views/reels/views/reels_view.dart';
import 'package:cholai/app/views/dashboard/controller/dashboard_controller.dart';
import 'package:cholai/app/views/dashboard/widgets/bottom_bar_widget.dart';
import 'package:cholai/app/views/chat/views/chat_list_view.dart';
import 'package:cholai/app/views/settings/views/settings_view.dart';
import 'package:cholai/app/widgets/system_widgets/safe_area_container.dart';
import 'package:cholai/shared/theme.dart';
import 'package:get/get.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeAreaContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Theme.of(context).appTheme.kLightColor,
            child: Stack(
              children: [
                IndexedStack(
                  index: controller.dashboardCurrentViewIndex.value,
                  children: [
                    const ChatListView(),
                    const ReelsView(),
                    const CallsView(),
                    const SettingsView(),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomBarWidget(
            initialIndex: controller.dashboardCurrentViewIndex.value,
            badges: [2, 0, 1, 1],
            onTap: (index) {
              //updating the dashboardCurrentViewIndex number
              controller.onChangingDashboardView(index);
            },
          ),
        ),

        // Scaffold(
        //   appBar: MyAppBar(
        //     title: AppBarTitleWidget(
        //       disableBackButton: true,
        //       title: 'CholAi',
        //       actions: [
        //         CustomIconButton(
        //           icon: Icons.logout_outlined,
        //           onTap: () {
        //             controller.userService.logOutUser();
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        //   body: BodyWidget(
        //     body: SafeArea(
        //       child: SingleChildScrollView(child: Column(children: [])),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
