class OtpResendResponseData {
  OtpResendResponseData({this.status, this.message, this.otp});

  final num? status;
  final String? message;
  final String? otp;

  factory OtpResendResponseData.fromJson(Map<String, dynamic> json) {
    return OtpResendResponseData(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      otp: json["otp"],
    );
  }
}
