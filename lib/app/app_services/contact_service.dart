import 'dart:convert';

import 'package:cholai/app/core/constants/api_constants.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/contacts/view/data/contact_api_data.dart';
import 'package:cholai/network/api_provider.dart';
import 'package:cholai/network/api_services/api_service.dart';
import 'package:get/get.dart';

class ContactService {
  static Future<ContactResponse> contactListRequestApi(
    ContactRequestData request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.contactListUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return ContactResponse.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }
}
