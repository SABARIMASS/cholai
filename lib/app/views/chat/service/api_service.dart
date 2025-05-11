import 'dart:convert';
import 'package:cholai/app/core/constants/api_constants.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/chat/api_data/chat_list_api_data.dart';
import 'package:cholai/network/api_provider.dart';
import 'package:cholai/network/api_services/api_service.dart';
import 'package:get/get.dart';

Future<ChatListResponse> chatListRequestApi(ChatListRequestData request) async {
  try {
    final response = await apiProvider.httpRequest(
      resource: Resource(
        url: ApiConstants.userChatList,
        request: jsonEncode(request.toJson()),
      ),
      requestType: RequestType.kPost,
    );

    return ChatListResponse.fromJson(json.decode(response));
  } catch (e) {
    throw LanguageGlobal.networkError.tr;
  }
}
