import 'package:cholai/app/app_services/chat_service.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/core/services/user_service.dart';
import 'package:cholai/app/views/chat/api_data/chat_list_api_data.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  final userService = Get.find<UserService>();
  Rx<ChatListResponse> chatListResponse = ChatListResponse().obs;
  @override
  void onInit() {
    super.onInit();
    callChatListApi();
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
