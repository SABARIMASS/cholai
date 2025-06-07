import 'package:cholai/app/controllers/contact_controller.dart';
import 'package:cholai/app/core/helpers/image_helper.dart';
import 'package:cholai/app/views/contacts/widgts/contact_list_item_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/list_view/paginated_list.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          Scaffold(appBar: _appBarWidget(context), body: _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return PaginatedListView(
      backgroundColor: Theme.of(context).appTheme.kAppBackgroundColor,
      itemCount: controller.chatListResponse.value.data?.length ?? 0,
      itemBuilder: (context, index) {
        final chat = controller.chatListResponse.value.data?[index];
        return ContactListItemWidget(
          contactName: chat?.name ?? "",
          contactImage: ImageHelper.networkImageFullUrl(
            chat?.profileImage ?? "",
          ),
          countryCode: chat?.countryCode ?? "",
          phoneNumber: chat?.phoneNumber ?? "",
          onTap: () {},
        );
      },
      separator: SizedBox.shrink(),
    );
  }

  MyAppBar _appBarWidget(BuildContext context) {
    return MyAppBar(
      title: AppBarTitleWidget(
        title: "Contacts",
        alignment: Alignment.centerLeft,

        disableBackButton: false,
        titleStyle: TextStyle(
          color: Theme.of(context).appTheme.kPrimaryTextColor,
          fontSize: AppFontSize.large.value,
          fontWeight: AppFontWeight.bold.value,
        ),
      ),
    );
  }
}
