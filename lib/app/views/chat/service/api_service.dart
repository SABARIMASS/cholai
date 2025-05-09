import 'dart:convert';
import 'package:cholai/app/core/constants/api_constants.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/auth/data/otp_request_api_data.dart';
import 'package:cholai/network/api_provider.dart';
import 'package:cholai/network/api_services/api_service.dart';
import 'package:get/get.dart';

Future<OtpRequestResponseData> chatListRequestApi(
  OtpRequestData request,
) async {
  try {
    final response = await apiProvider.httpRequest(
      resource: Resource(
        url: ApiConstants.otpRequest,
        request: jsonEncode(request.toJson()),
      ),
      requestType: RequestType.kPost,
    );

    return OtpRequestResponseData.fromJson(json.decode(response));
  } catch (e) {
    throw LanguageGlobal.networkError.tr;
  }
}
