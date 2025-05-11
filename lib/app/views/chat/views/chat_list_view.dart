import 'package:cholai/app/core/utils/date_time_util.dart';
import 'package:cholai/app/core/utils/message_status_utils.dart';
import 'package:cholai/app/views/chat/controller/chat_list_controller.dart';
import 'package:cholai/app/views/chat/widgets/chat_list_item_widget.dart'
    show ListItemWidget;
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/list_view/paginated_list.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeView extends GetView<ChatListController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MyAppBar(
          title: AppBarTitleWidget(
            title: "Chats",
            disableBackButton: true,
            titleStyle: TextStyle(
              color: Theme.of(context).appTheme.kPrimaryTextColor,
              fontSize: AppFontSize.large.value,
              fontWeight: AppFontWeight.bold.value,
            ),
          ),
        ),
        body: PaginatedListView(
          backgroundColor: Theme.of(context).appTheme.kAppBackgroundColor,
          itemCount: controller.chatListResponse.value.data?.length ?? 0,
          itemBuilder: (context, index) {
            final chat = controller.chatListResponse.value.data?[index];
            return ListItemWidget(
              profileImage: chat?.receiver?.profileImage ?? "",
              userName: chat?.receiver?.name ?? "",
              description: chat?.lastMessage?.text ?? "",
              time: DateTimeUtil.getChatListTime(chat?.lastMessage?.time ?? ''),
              unreadCount: chat?.unreadCount,
              latestMessageStatus: MessageUtills.getMessageStatusFromString(
                chat?.lastMessage?.status ?? '',
              ),
            );
          },
          separator: SizedBox.shrink(),
        ),
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String? avatarUrl;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    this.avatarUrl,
  });
}
