import 'dart:convert';

import 'package:cholai/app/core/constants/api_constants.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/auth/data/otp_request_api_data.dart';
import 'package:cholai/app/views/auth/data/otp_verify_api_data.dart';
import 'package:cholai/app/views/auth/data/profile_create_api_data.dart';
import 'package:cholai/app/views/auth/data/resend_otp_response_api_data.dart';
import 'package:cholai/network/api_provider.dart';
import 'package:cholai/network/api_services/api_service.dart';
import 'package:get/get.dart';

class AuthService {
  static Future<OtpRequestResponseData> otpRequestApi(
    OtpRequestData request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.otpRequestUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return OtpRequestResponseData.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<OtpVerifyRequestResponseData> otpVerifyApi(
    OtpVerifyRequestData request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.verifyOtpUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return OtpVerifyRequestResponseData.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<ProfileCreateResponseData> profileCreateApi(
    ProfileCreateRequestData request,
  ) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.setProfileUrl,
          request: jsonEncode(request.toJson()),
        ),
        requestType: RequestType.kPost,
      );

      return ProfileCreateResponseData.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }

  static Future<OtpResendResponseData> resendOtpApi(String userId) async {
    try {
      final response = await apiProvider.httpRequest(
        resource: Resource(
          url: ApiConstants.resendOtpUrl,
          request: json.encode({"userId": userId}),
        ),
        requestType: RequestType.kPost,
      );

      return OtpResendResponseData.fromJson(json.decode(response));
    } catch (e) {
      throw LanguageGlobal.networkError.tr;
    }
  }
}
