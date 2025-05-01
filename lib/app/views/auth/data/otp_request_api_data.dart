class OtpRequestData {
  final String phoneNumber;
  final String countryCode;

  OtpRequestData({required this.phoneNumber, required this.countryCode});

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'countryCode': countryCode};
  }
}

class OtpRequestResponseData {
  OtpRequestResponseData({
    this.status,
    this.message,
    this.userStatus,
    this.responseData,
    this.otp,
  });

  final num? status;
  final String? message;
  final String? userStatus;
  final ResponseData? responseData;
  String? otp;

  factory OtpRequestResponseData.fromJson(Map<String, dynamic> json) {
    return OtpRequestResponseData(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      userStatus: json["userStatus"] ?? "",
      responseData:
          json["responseData"] == null
              ? null
              : ResponseData.fromJson(json["responseData"]),
      otp: json["otp"] ?? "",
    );
  }
}

class ResponseData {
  ResponseData({required this.userId});

  final String userId;

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(userId: json["userId"] ?? "");
  }
}
