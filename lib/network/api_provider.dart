import 'dart:convert';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:get/get.dart';
import '../app/core/routes/app_routes.dart';
import '../app/core/local_storage/storage_service.dart';
import 'api_provider_data/authorization_api_data.dart';

class ApiProvider extends GetConnect {
  String token = '';

  @override
  void onInit() {
    super.onInit();
    httpClient.maxAuthRetries = 2;
    _setupAuthorizationInterceptor();
  }

  Future<String> httpRequest({
    RequestType requestType = RequestType.kPost,
    required Resource resource,
    bool encryptParams = true,
    bool decryptResponse = false,
    Map<String, String>? queryParam,
    Duration? timeout,
    bool disablePrintLog = false,
    bool anonEnable = false,
    FormData? formData,
    OrganizationHeader? userVerifyHeader,
  }) async {
    httpClient.timeout = timeout ?? const Duration(seconds: 60);

    token = StorageX.getAccessToken();

    LoggerUtil.logRequest(
      resource.url,
      headers: defaultApiHeaders(token, userVerifyHeader),
      body: resource.request,
    );
    switch (requestType) {
      case RequestType.kGet:
        final response = await _get(resource, queryParam, userVerifyHeader);
        LoggerUtil.logResponse(
          resource.url,
          statusCode: response.statusCode,
          responseBody: response.bodyString,
        );
        return response.bodyString ?? "";

      case RequestType.kPut:
        final response = await _put(resource, queryParam, userVerifyHeader);
        LoggerUtil.logResponse(
          resource.url,
          statusCode: response.statusCode,
          responseBody: response.bodyString,
        );
        return response.bodyString ?? "";

      case RequestType.kDelete:
        final response = await _delete(resource, queryParam, userVerifyHeader);
        LoggerUtil.logResponse(
          resource.url,
          statusCode: response.statusCode,
          responseBody: response.bodyString,
        );
        return response.bodyString ?? "";

      case RequestType.kPost:
        if (formData != null) {
          final response = await _postFormData(
            resource.url,
            formData,
            userVerifyHeader,
          );
          LoggerUtil.logResponse(
            resource.url,
            statusCode: response.statusCode,
            responseBody: response.bodyString,
          );
          return response.bodyString ?? "";
        } else {
          final response = await _post(resource, queryParam, userVerifyHeader);
          LoggerUtil.logResponse(
            resource.url,
            statusCode: response.statusCode,
            responseBody: response.bodyString,
          );
          return response.bodyString ?? "";
        }
    }
  }
}

class Resource<T> {
  final String url;
  final String request;
  final T Function(Response response)? parse;

  Resource({required this.url, required this.request, this.parse});
}

enum RequestType { kGet, kPost, kPut, kDelete }

Map<String, String> defaultApiHeaders(
  String token,
  OrganizationHeader? userVerifyHeader, {
  bool form = false,
}) {
  // String bearerToken = userVerifyHeader?.token ?? token;

  return {
    'Content-Type': form ? 'multipart/form-data' : 'application/json',
    // 'Authorization': 'Bearer $bearerToken',
  };
}

extension ApiMethods on ApiProvider {
  Future<Response> _delete(
    Resource resource,
    Map<String, String>? queryParam,
    OrganizationHeader? userVerifyHeader,
  ) {
    return httpClient.delete(
      resource.url,
      query: queryParam,
      headers: defaultApiHeaders(token, userVerifyHeader),
    );
  }

  Future<Response> _put(
    Resource resource,
    Map<String, String>? queryParam,
    OrganizationHeader? userVerifyHeader,
  ) {
    return httpClient.put(
      resource.url,
      body: resource.request,
      query: queryParam,
      headers: defaultApiHeaders(token, userVerifyHeader),
    );
  }

  Future<Response> _post(
    Resource resource,
    Map<String, String>? queryParam,
    OrganizationHeader? userVerifyHeader,
  ) {
    return httpClient.post(
      resource.url,
      body: resource.request,
      query: queryParam,
      headers: defaultApiHeaders(token, userVerifyHeader),
    );
  }

  Future<Response> _postFormData(
    String url,
    FormData formData,
    OrganizationHeader? userVerifyHeader,
  ) {
    return httpClient.post(
      url,
      body: formData,
      // headers: defaultApiHeaders(token, userVerifyHeader, form: true),
    );
  }

  Future<Response> _get(
    Resource resource,
    Map<String, String>? queryParam,
    OrganizationHeader? userVerifyHeader,
  ) {
    return httpClient.get(
      resource.url,
      query: queryParam,
      headers: defaultApiHeaders(token, userVerifyHeader),
    );
  }
}

extension Authorization on ApiProvider {
  void _setupAuthorizationInterceptor() {
    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode == 401 && response.bodyString != null) {
        final responseBody = AuthorizationResponse.fromJson(
          json.decode(response.bodyString!),
        );

        if (responseBody.status == -999) {
          if (await _refreshToken()) {
            request.headers['Authorization'] = 'Bearer $token';
            return await httpClient.request(
              request.url.toString(),
              request.method,
              headers: request.headers,
              query: request.url.queryParameters,
            );
          }
          return response;
        } else if (responseBody.status == -9999 && response.statusCode == 419) {
          _handleForceLogout(responseBody.message);
          return null;
        }
      }
      return response;
    });
  }

  Future<bool> _refreshToken() async {
    String? refreshToken = StorageX.getRefreshToken();
    if (refreshToken.isNotEmpty) {
      final response = await httpClient.post(
        '${'AppInfo.kAppTokenUrl'}token',
        // query: {"refresh_token": refreshToken, "grant_type": "refresh_token"},
        // headers: defaultApiHeaders(AppInfo.anonKey, null),
      );

      if (response.bodyString != null) {
        final responseBody = AuthorizationResponse.fromJson(
          json.decode(response.bodyString!),
        );

        if (responseBody.status == 1 && responseBody.accessToken != null) {
          StorageX.saveAccessToken(responseBody.accessToken!);
          token = responseBody.accessToken!;
          return true;
        } else if (responseBody.status == -9999) {
          _handleForceLogout(responseBody.message);
        }
      }
    }
    return false;
  }

  void _handleForceLogout(String? message) {
    StorageX.appCommonRemover();
    StorageX.saveForceLogOutMessage(message ?? '');
    Get.offAllNamed(AppRoutes.signInView);
  }
}
