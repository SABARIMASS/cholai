import 'package:cholai/app/core/helpers/image_helper.dart';

import 'package:cholai/app/controllers/settings_controller.dart';
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/icon_widget/custom_icon_button.dart';
import 'package:cholai/app/widgets/images/network_image.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hugeicons/hugeicons.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBarWidget(context), body: _bodyWidget(context));
  }

  ListView _bodyWidget(BuildContext context) {
    return ListView(children: [_buildProfileSection(context)]);
  }

  MyAppBar _appBarWidget(BuildContext context) {
    return MyAppBar(
      title: AppBarTitleWidget(
        title: "Settings",
        alignment: Alignment.centerLeft,
        actions: [
          CustomIconButton(
            onTap: () {
              controller.userService.logOutUser();
            },
            icon: HugeIcons.strokeRoundedLogout01,
            iconColor: Theme.of(context).appTheme.kIconPrimaryColor,
          ),
        ],
        disableBackButton: true,
        titleStyle: TextStyle(
          color: Theme.of(context).appTheme.kPrimaryTextColor,
          fontSize: AppFontSize.large.value,
          fontWeight: AppFontWeight.bold.value,
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return ListTile(
      leading: CommonCachedNetworkImage(
        height: 50.h,
        width: 50.w,
        isCircle: true,
        imageUrl: ImageHelper.networkImageFullUrl(
          controller.userService.userInfo.value.profileImage ?? "",
        ),
      ),
      title: Text(controller.userService.userInfo.value.name ?? ""),
      subtitle: Text(controller.userService.userInfo.value.about ?? ""),
      trailing: CustomIconButton(
        onTap: () {},
        icon: HugeIcons.strokeRoundedEdit01,
        iconColor: Theme.of(context).appTheme.kIconPrimaryColor,
      ),
    );
  }
}
