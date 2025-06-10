import 'package:cholai/app/app_services/chat_service.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/core/services/user_service.dart';
import 'package:cholai/app/core/utils/logger_util.dart';
import 'package:cholai/app/views/chat/api_data/chat_detail_api_data.dart';
import 'package:cholai/app/views/chat/api_data/mark_messages_read_api_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatDetailsController extends GetxController {
  final userService = Get.find<UserService>();
  Rx<ChatDetailsResponse> chatDetailsResponse = ChatDetailsResponse().obs;
  var chatId = ''.obs;
  var receiverName = ''.obs;
  var receiverProfileImage = ''.obs;
  var receiverId = ''.obs;
  final chatTextcontroller = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    callChatDetailsApi();
  }
}

extension ChatDetailsControllerApi on ChatDetailsController {
  void callChatDetailsApi() {
    chatDetailsResponse.value.isLoading = true;
    final request = ChatDetailsRequest(chatId: Get.arguments['chatId'] ?? '');
    chatId.value = Get.arguments['chatId'] ?? '';
    receiverName.value = Get.arguments['receiverName'] ?? '';
    receiverProfileImage.value = Get.arguments['receiverProfileImage'] ?? '';
    receiverId.value = Get.arguments['receiverId'] ?? '';
    ChatService.chatDetailRequestApi(request)
        .then((response) {
          chatDetailsResponse.value = response;
          chatDetailsResponse.value.isLoading = false;
          chatDetailsResponse.refresh();
          if (response.status == 1) {
            ChatService.markMessagesReadApi(
                  MarkMessagesReadRequest(
                    chatId: request.chatId,
                    userId: userService.userInfo.value.userId ?? '',
                    status: "read",
                  ),
                )
                .then((markResponse) {
                  if (markResponse.status == 1) {
                    LoggerUtil.debug(
                      'markMessagesReadApi ${markResponse.message}',
                    );
                  } else {
                    LoggerUtil.debug(
                      'markMessagesReadApi  marking messages as read: ${markResponse.message}',
                    );
                  }
                })
                .onError((error, stackTrace) {
                  LoggerUtil.debug(
                    'markMessagesReadApi Error markMessagesReadApi marking messages as read: $error',
                  );
                });
          }
        })
        .onError((error, stackTrace) {
          chatDetailsResponse.value.status = -1;
          chatDetailsResponse.value.isLoading = false;
          chatDetailsResponse.value.message = LanguageGlobal.networkError.tr;
          chatDetailsResponse.refresh();
        });
  }
}

extension ChatDetailsControllerUtils on ChatDetailsController {
  void sendMessage() {
    if (chatDetailsResponse.value.data?.firstOrNull?.dateLabel == 'Today') {
      updateNewMessage(isAdd: false);
    } else {
      updateNewMessage(isAdd: true);
    }
    chatTextcontroller.clear();
  }

  void updateNewMessage({bool isAdd = false}) {
    final chatText = chatTextcontroller.text.trim();
    final userId = userService.userInfo.value.userId ?? '';
    final timestamp = DateTime.now().toIso8601String();
    if (userId.isEmpty) {
      return;
    }
    if (chatText.isEmpty) {
      return;
    }
    if (isAdd) {
      chatDetailsResponse.value.data?.insert(
        0,
        ChatDateGroup(
          dateLabel: 'Today',
          messages: [
            ChatMessage(
              senderId: userId,
              receiverId: receiverId.value,
              message: chatText,
              timestamp: timestamp,
              status: 'request',
            ),
          ],
        ),
      );
      chatDetailsResponse.refresh();
    } else {
      chatDetailsResponse.value.data?.first.messages?.add(
        ChatMessage(
          senderId: userId,
          receiverId: receiverId.value,
          message: chatText,
          timestamp: timestamp,
          status: 'request',
        ),
      );
      chatDetailsResponse.refresh();
    }
  }

  void updateMessage({
    required ChatMessage updatedMessage,
    required int index,
    required int gropupIndex,
  }) {
    chatId.value = updatedMessage.chatId ?? chatId.value;
    chatDetailsResponse.value.data?[gropupIndex].messages?[index] =
        updatedMessage;
    chatDetailsResponse.refresh();
  }
}
