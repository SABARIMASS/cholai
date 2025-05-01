import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/views/calls/views/calls_view.dart';
import 'package:fuzionest_chatai/app/views/chat/views/chats_view.dart';
import 'package:fuzionest_chatai/app/views/dashboard/controller/dashboard_controller.dart';
import 'package:fuzionest_chatai/app/views/dashboard/widgets/bottom_bar_widget.dart';
import 'package:fuzionest_chatai/app/views/home/views/home_view.dart';
import 'package:fuzionest_chatai/app/views/settings/views/settings_view.dart';
import 'package:fuzionest_chatai/app/widgets/system_widgets/safe_area_container.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:get/get.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeAreaContainer(
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: Theme.of(context).appTheme.kLightColor,
            child: Stack(
              children: [
                IndexedStack(
                  index: controller.dashboardCurrentViewIndex.value,
                  children: [
                    const HomeView(),
                    const ReelsView(),
                    const CallsView(),
                    const SettingsView(),
                  ],
                ),
                BottomBarWidget(
                  initialIndex: controller.dashboardCurrentViewIndex.value,
                  badges: [2, 0, 1, 1],
                  onTap: (index) {
                    //updating the dashboardCurrentViewIndex number
                    controller.onChangingDashboardView(index);
                  },
                ),
              ],
            ),
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
