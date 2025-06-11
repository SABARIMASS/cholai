import 'dart:convert';

import 'package:cholai/app/app_services/chat_service.dart';
import 'package:cholai/app/app_services/socket_service.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/core/services/user_service.dart';
import 'package:cholai/app/core/utils/logger_util.dart';
import 'package:cholai/app/views/chat/api_data/chat_list_api_data.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  final userService = Get.find<UserService>();
  Rx<ChatListResponse> chatListResponse = ChatListResponse().obs;
  @override
  void onInit() {
    super.onInit();
    callChatListApi();
    listenToChatList();
  }
}

extension ChatListControllerApi on ChatListController {
  callChatListApi() {
    chatListResponse.value.isLoading = true;
    final userInfo = userService.userInfo.value;
    final chatListRequestData = ChatListRequestData(
      userId: userInfo.userId ?? "",
    );
    ChatService.chatListRequestApi(chatListRequestData)
        .then((response) {
          chatListResponse.value = response;
          chatListResponse.value.isLoading = false;
          chatListResponse.refresh();
        })
        .onError((error, strace) {
          chatListResponse.value.status = -1;
          chatListResponse.value.isLoading = false;
          chatListResponse.value.message = LanguageGlobal.networkError.tr;
          chatListResponse.refresh();
        });
  }
}

extension ChatListControllerHelper on ChatListController {
  void listenToChatList() {
    final socket = SocketService().socketInstance;

    socket.on('updateChatList', (data) {
      ///data response is  [{chatId: 680fa5f04b745800ca2a95b3_681ec865a38788fd15206747, lastMessage: {text: secerereond, status: read, time: 2025-06-11T17:50:31.103Z, senderId: 681ec865a38788fd15206747, receiverId: 680fa5f04b745800ca2a95b3}, unreadCount: 3, opponent: {id: 681ec865a38788fd15206747, name: Nithiya, profileImage: local/userProfile/Actress-Aishwarya-Lekshmi-Latest-Photos-2-1-1280x720.jpg}}, {chatId: 680fa5f04b745800ca2a95b3_680fa5f04b745800ca2a95b3, lastMessage: {text: okay, status: read, time: 2025-06-11T17:30:54.029Z, senderId: 680fa5f04b745800ca2a95b3, receiverId: 680fa5f04b745800ca2a95b3}, unreadCount: 0, opponent: {id: 680fa5f04b745800ca2a95b3, name: Sabari.M, profileImage: local/userProfile/ba831feacf8c1121167d58a4b079e464.jpg}}]
      List<Chat>? newChatList = [];
      if (data is List) {
        newChatList = data.map((e) => Chat.fromJson(e)).toList();
      } else if (data is String) {
        newChatList =
            (jsonDecode(data) as List).map((e) => Chat.fromJson(e)).toList();
      }
      // Replace or update the item in list
      // final index = chatList.indexWhere((c) => c['chatId'] == data['chatId']);
      // if (index != -1) {
      //   chatList[index] = data;
      // } else {
      //   chatList.add(data);
      // }
      // chatList.refresh();
      LoggerUtil.debug('Chat list updated: ${newChatList.firstOrNull?.chatId}');
      if (newChatList.isNotEmpty) {
        final chatId = newChatList.first.chatId ?? '';
        final existingChatIndex = chatListResponse.value.data?.indexWhere(
          (chat) => chat.chatId == chatId,
        );
        if (existingChatIndex != null && existingChatIndex >= 0) {
          chatListResponse.value.data!.removeAt(existingChatIndex);
          chatListResponse.value.data?.insert(0, newChatList.first);
        } else {
          chatListResponse.value.data?.insert(0, newChatList.first);
        }
        chatListResponse.refresh();
      }
      LoggerUtil.debug(
        'Chat list response: ${chatListResponse.value.data?.length}',
      );
    });
  }
}
