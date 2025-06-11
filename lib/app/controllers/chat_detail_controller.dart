import 'package:cholai/app/app_services/chat_service.dart';
import 'package:cholai/app/app_services/socket_service.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/core/services/user_service.dart';
import 'package:cholai/app/core/utils/logger_util.dart';
import 'package:cholai/app/views/chat/api_data/chat_detail_api_data.dart';
import 'package:cholai/app/views/chat/api_data/mark_messages_read_api_data.dart';
import 'package:cholai/app/views/chat/api_data/socket_chat_message_data.dart';
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

  @override
  void onClose() {
    SocketService().leaveChat(chatId.value);
    super.onClose();
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
            listenToChatDetail();
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
    if (chatId.value.isEmpty) {
      listenToChatDetail(updatedMessage.chatId);
    }
    chatId.value = updatedMessage.chatId ?? chatId.value;
    chatDetailsResponse.value.data?[gropupIndex].messages?[index] =
        updatedMessage;
    chatDetailsResponse.refresh();
  }

  void listenToChatDetail([String? userChatId]) {
    final socket = SocketService().socketInstance;

    SocketService().joinChat(userChatId ?? chatId.value);

    socket.on('updateChatDetails', (data) {
      LoggerUtil.debug('New message received: $data');
      SocketChatMessageData socketChatMessageData =
          SocketChatMessageData.fromJson(data);
      if (socketChatMessageData.chatId != chatId.value) {
        LoggerUtil.debug(
          'Received message for different chatId: ${socketChatMessageData.chatId}',
        );
        return;
      }
      if (chatDetailsResponse.value.data?.isEmpty ?? true) {
        // If the data is empty, initialize it with today's date
        chatDetailsResponse.value.data = [
          ChatDateGroup(dateLabel: 'Today', messages: []),
        ];
      }
      final todayDateGroup = chatDetailsResponse.value.data?.firstWhere(
        (group) => group.dateLabel == 'Today',
        orElse: () => ChatDateGroup(dateLabel: 'Today', messages: []),
      );
      if (todayDateGroup != null) {
        todayDateGroup.messages?.add(
          ChatMessage(
            senderId: socketChatMessageData.senderId,
            receiverId: socketChatMessageData.receiverId,
            message: socketChatMessageData.message,
            timestamp:
                DateTime.fromMillisecondsSinceEpoch(
                  socketChatMessageData.timestamp * 1000,
                ).toIso8601String(),
            status: socketChatMessageData.status,
          ),
        );
        chatDetailsResponse.refresh();
      } else {
        // If no 'Today' group exists, create it
        LoggerUtil.debug('No "Today" group found, creating a new one.');
        LoggerUtil.debug(
          'Creating new ChatDateGroup with message: ${socketChatMessageData.message}',
        );
        LoggerUtil.debug(
          'ChatDetailsResponse before adding new group: ${chatDetailsResponse.value.data}',
        );
        LoggerUtil.debug(
          'ChatDetailsResponse data length before adding new group: ${chatDetailsResponse.value.data?.length}',
        );
        LoggerUtil.debug(
          'ChatDetailsResponse data first message: ${chatDetailsResponse.value.data?.first.messages?.firstOrNull?.message}',
        );
        chatDetailsResponse.value.data = [
          ChatDateGroup(dateLabel: 'Today', messages: []),
        ];
      }
    });
  }
}
