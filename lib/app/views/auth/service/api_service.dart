import 'dart:convert';
import 'package:fuzionest_chatai/app/core/constants/api_constants.dart';
import 'package:fuzionest_chatai/app/core/languages/language_global.dart';
import 'package:fuzionest_chatai/app/views/auth/data/resend_otp_response_api_data.dart';
import 'package:fuzionest_chatai/network/api_services/api_service.dart';
import 'package:get/get.dart';
import '../../../../network/api_provider.dart';
import '../data/otp_request_api_data.dart';
import '../data/otp_verify_api_data.dart';
import '../data/profile_create_api_data.dart';

Future<OtpRequestResponseData> otpRequestApi(OtpRequestData request) async {
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

Future<OtpVerifyRequestResponseData> otpVerifyApi(
  OtpVerifyRequestData request,
) async {
  try {
    final response = await apiProvider.httpRequest(
      resource: Resource(
        url: ApiConstants.verifyOtp,
        request: jsonEncode(request.toJson()),
      ),
      requestType: RequestType.kPost,
    );

    return OtpVerifyRequestResponseData.fromJson(json.decode(response));
  } catch (e) {
    throw LanguageGlobal.networkError.tr;
  }
}

Future<ProfileCreateResponseData> profileCreateApi(
  ProfileCreateRequestData request,
) async {
  try {
    final response = await apiProvider.httpRequest(
      resource: Resource(
        url: ApiConstants.setProfile,
        request: jsonEncode(request.toJson()),
      ),
      requestType: RequestType.kPost,
    );

    return ProfileCreateResponseData.fromJson(json.decode(response));
  } catch (e) {
    throw LanguageGlobal.networkError.tr;
  }
}

Future<OtpResendResponseData> resendOtpApi(String userId) async {
  try {
    final response = await apiProvider.httpRequest(
      resource: Resource(
        url: ApiConstants.resendOtp,
        request: json.encode({"userId": userId}),
      ),
      requestType: RequestType.kPost,
    );

    return OtpResendResponseData.fromJson(json.decode(response));
  } catch (e) {
    throw LanguageGlobal.networkError.tr;
  }
}
