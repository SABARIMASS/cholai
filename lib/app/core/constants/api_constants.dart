import 'package:fuzionest_chatai/app/core/config/app_info.dart';

class ApiConstants {
  static String get otpRequest => "${AppInfo.kAuthApi}otp-request";
  static String get verifyOtp => "${AppInfo.kAuthApi}verify-otp";
  static String get resendOtp => "${AppInfo.kAuthApi}resend-otp";
  static String get setProfile => "${AppInfo.kAuthApi}set-profile";
  static String get uploadTemp =>
      "${AppInfo.kDocumentUpload}documents/upload-temp";
}
