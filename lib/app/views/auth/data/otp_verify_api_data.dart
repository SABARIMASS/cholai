import 'profile_create_api_data.dart';

class OtpVerifyRequestData {
  OtpVerifyRequestData({
    required this.phoneNumber,
    required this.countryCode,
    required this.otp,
    required this.userStatus,
  });

  final String phoneNumber;
  final String countryCode;
  final String otp;
  final String userStatus;

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "otp": otp,
        "userStatus": userStatus,
      };
}

class OtpVerifyRequestResponseData {
  OtpVerifyRequestResponseData({
     this.status,
     this.message,
     this.responseData,
  });

  final num? status;
  final String? message;
  final UserInfoData? responseData;

  factory OtpVerifyRequestResponseData.fromJson(Map<String, dynamic> json) {
    return OtpVerifyRequestResponseData(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      responseData: json["responseData"] == null
          ? null
          : UserInfoData.fromJson(json["responseData"]),
    );
  }
}
