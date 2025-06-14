import 'package:cholai/app/core/helpers/image_helper.dart';
import 'package:cholai/app/core/routes/app_routes.dart';
import 'package:cholai/app/core/utils/date_time_util.dart';
import 'package:cholai/app/core/utils/message_status_utils.dart';
import 'package:cholai/app/controllers/chat_list_controller.dart';
import 'package:cholai/app/views/chat/widgets/chat_list_item_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/list_view/custom_icon_button.dart';
import 'package:cholai/app/widgets/list_view/paginated_list.dart';
import 'package:cholai/app/widgets/responsive_body/message_body_widgets/show_message_svg_widget.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          Scaffold(appBar: _appBarWidget(context), body: _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return PaginatedListView(
      listEmptyWidget: ShowMessageSvgWidget(
        message: controller.chatListResponse.value.message,
        onRefresh: () => controller.callChatListApi(),
      ),
      isLoading: controller.chatListResponse.value.isLoading ?? false,
      backgroundColor: Theme.of(context).appTheme.kAppBackgroundColor,
      itemCount: controller.chatListResponse.value.data?.length ?? 0,
      onRefresh: () async {
        controller.callChatListApi();
        return Future.value();
      },
      itemBuilder: (context, index) {
        final chat = controller.chatListResponse.value.data?[index];
        return ListItemWidget(
          profileImage: ImageHelper.networkImageFullUrl(
            chat?.receiver?.profileImage ?? "",
          ),
          userName: chat?.receiver?.name ?? "",
          description: chat?.lastMessage?.text ?? "",
          time: DateTimeUtil.getChatListTime(chat?.lastMessage?.time ?? ''),
          unreadCount: chat?.unreadCount,
          latestMessageStatus: MessageUtills.getMessageStatusFromString(
            controller.userService.userInfo.value.userId ?? '',
            chat?.lastMessage?.senderId ?? '',
            chat?.lastMessage?.status ?? '',
          ),
          onTap:
              () => Get.toNamed(
                AppRoutes.chatDetailView,
                arguments: {
                  'chatId': chat?.chatId,
                  'receiverName': chat?.receiver?.name,
                  'receiverProfileImage': ImageHelper.networkImageFullUrl(
                    chat?.receiver?.profileImage ?? "",
                  ),
                  'receiverId': chat?.receiver?.sId ?? '',
                },
              ),
        );
      },
      separator: SizedBox.shrink(),
    );
  }

  MyAppBar _appBarWidget(BuildContext context) {
    return MyAppBar(
      title: AppBarTitleWidget(
        padding: EdgeInsets.only(left: 14.w, right: 6.w),
        title: "Chats",
        alignment: Alignment.centerLeft,
        actions: [
          CustomIconButton(
            onTap: () {
              Get.toNamed(AppRoutes.contactView);
            },
            icon: HugeIcons.strokeRoundedContact01,
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
}
