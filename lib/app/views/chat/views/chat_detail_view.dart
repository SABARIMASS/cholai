import 'package:cholai/app/controllers/chat_detail_controller.dart';
import 'package:cholai/app/core/utils/date_time_util.dart';
import 'package:cholai/app/core/utils/message_status_utils.dart';
import 'package:cholai/app/views/chat/api_data/chat_detail_api_data.dart';
import 'package:cholai/app/views/chat/widgets/chat_bottom_widget.dart';
import 'package:cholai/app/views/chat/widgets/chat_detail_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/icon_widget/custom_icon_button.dart';
import 'package:cholai/app/widgets/images/network_image.dart';
import 'package:cholai/app/widgets/list_view/paginated_list.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ChatDetailView extends GetView<ChatDetailsController> {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBarWidget(context),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/08/07/13/44/tree-8175062_1280.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PaginatedListView(
                  reverse: true,
                  listEmptyWidget: SizedBox.shrink(),
                  isLoading: controller.chatDetailsResponse.value.isLoading,
                  backgroundColor: Colors.transparent,
                  itemCount:
                      controller.chatDetailsResponse.value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final dateGroup =
                        controller.chatDetailsResponse.value.data![index];
                    final messages = dateGroup.messages ?? [];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _dateLabelWidget(dateGroup),
                        ..._messagesWidget(messages, index),
                      ],
                    );
                  },
                  separator: SizedBox.shrink(),
                ),
              ),
              ChatBottomWidget(
                onTap: () async {
                  await Future.delayed(Duration(milliseconds: 500));
                },
                controller: controller.chatTextcontroller,
                isStreaming: false,
                resetingChat: false,
                sendOnTap: () {
                  controller.sendMessage();
                },
                onStopStreaming: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Iterable<Widget> _messagesWidget(
    List<ChatMessage> messages,
    int gropupIndex,
  ) {
    return messages.asMap().entries.map((entry) {
      final index = entry.key;
      final msg = entry.value;

      return ChatMessageBubble(
        message: msg.message,
        timestamp: DateTimeUtil.chatDetailFormatTime(
          DateTime.tryParse(msg.timestamp ?? '') ?? DateTime.now(),
        ),
        isMe: msg.senderId == controller.userService.userInfo.value.userId,
        status: MessageUtills.getMessageStatusFromString(
          controller.userService.userInfo.value.userId ?? '',
          msg.senderId ?? '',
          msg.status ?? '',
        ),
        messageData: messages[index],
        updatedMessage: (updatedMessage) {
          controller.updateMessage(
            updatedMessage: updatedMessage,
            gropupIndex: gropupIndex,
            index: index,
          );
        },
      );
    });
  }

  Padding _dateLabelWidget(ChatDateGroup dateGroup) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Text(
        dateGroup.dateLabel ?? '',
        style: TextStyle(
          fontWeight: AppFontWeight.bold.value,
          color: Theme.of(Get.context!).appTheme.kWhiteColor,
          fontSize: AppFontSize.small.value,
        ),
      ),
    );
  }

  MyAppBar _myAppBarWidget(BuildContext context) {
    return MyAppBar(
      title: AppBarTitleWidget(
        titleWidget: Row(
          children: [
            CommonCachedNetworkImage(
              height: 30.h,
              width: 35.w,
              imageUrl: controller.receiverProfileImage.value,

              isCircle: true,
              errorWidget: Icon(
                HugeIcons.strokeRoundedUser,
                color: Theme.of(context).appTheme.kPrimaryColor,
              ),
            ),

            SizedBox(width: 10.w),
            Text(
              controller.receiverName.value,
              style: TextStyle(
                color: Theme.of(context).appTheme.kPrimaryColor,
                fontSize: AppFontSize.medium.value,
                fontWeight: AppFontWeight.bold.value,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomIconButton(icon: Icons.call, onTap: () {}),
        CustomIconButton(icon: Icons.video_call, onTap: () {}),
      ],
    );
  }
}
