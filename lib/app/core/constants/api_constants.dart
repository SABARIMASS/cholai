import 'package:cholai/app/core/config/app_info.dart';

class ApiConstants {
  static String get otpRequestUrl => "${AppInfo.kAuthApi}otp-request";
  static String get verifyOtpUrl => "${AppInfo.kAuthApi}verify-otp";
  static String get resendOtpUrl => "${AppInfo.kAuthApi}resend-otp";
  static String get setProfileUrl => "${AppInfo.kAuthApi}set-profile";
  static String get uploadTempUrl =>
      "${AppInfo.kDocumentUpload}documents/upload-temp";
  static String get contactListUrl => "${AppInfo.kContactApi}check-contacts";
  static String get userChatListUrl => "${AppInfo.kChatApi}chat-list";
  static String get userChatDetailUrl => "${AppInfo.kChatApi}chat-details";
  static String get sendMessageUrl => "${AppInfo.kChatApi}send-message";
  static String get markMessagesReadUrl =>
      "${AppInfo.kChatApi}mark-messages_read";
  static String get markMessageStatusUrl =>
      "${AppInfo.kContactApi}mark-message_status";
}
