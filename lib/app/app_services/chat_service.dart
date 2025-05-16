import 'dart:convert';
import 'package:cholai/app/core/constants/api_constants.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/chat/api_data/chat_detail_api_data.dart';
import 'package:cholai/app/views/chat/api_data/chat_list_api_data.dart';
import 'package:cholai/app/views/chat/api_data/mark_message_api_data.dart';
import 'package:cholai/app/views/chat/api_data/mark_messages_read_api_data.dart';
import 'package:cholai/app/views/chat/api_data/send_message_api_data.dart';
import 'package:cholai/network/api_provider.dart';
import 'package:cholai/network/api_services/api_service.dart';
import 'package:get/get.dart';

class ChatService {
  static Future<ChatListResponse> chatListRequestApi(
    ChatListRequestData request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.userChatListUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return ChatListResponse.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<ChatDetailsResponse> chatDetailRequestApi(
    ChatDetailsRequest request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.userChatDetailUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return ChatDetailsResponse.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<SendMessageResponse> sendMessageApi(
    SendMessageRequestData request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.sendMessageUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return SendMessageResponse.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<MarkMessagesReadResponse> markMessagesReadApi(
    MarkMessagesReadRequest request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.markMessagesReadUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return MarkMessagesReadResponse.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<MarkMessageStatusResponse> markMessageReadApi(
    MarkMessageStatusRequest request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.markMessageStatusUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return MarkMessageStatusResponse.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }
}
