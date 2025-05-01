class ProfileCreateRequestData {
  ProfileCreateRequestData({
    required this.phoneNumber,
    required this.countryCode,
    required this.userId,
    required this.name,
    required this.about,
    required this.tempImage,
  });

  final String phoneNumber;
  final String countryCode;
  final String userId;
  final String name;
  final String about;
  final String tempImage;

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "userId": userId,
        "name": name,
        "about": about,
        "tempImage": tempImage,
      };
}

class ProfileCreateResponseData {
  ProfileCreateResponseData({
    required this.status,
    required this.message,
    required this.responseData,
  });

  final num status;
  final String message;
  final UserInfoData? responseData;

  factory ProfileCreateResponseData.fromJson(Map<String, dynamic> json) {
    return ProfileCreateResponseData(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      responseData: json["responseData"] == null
          ? null
          : UserInfoData.fromJson(json["responseData"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responseData": responseData?.toJson(),
      };
}

class UserInfoData {
  UserInfoData({
    this.userId,
    this.name,
    this.countryCode,
    this.phoneNumber,
    this.about,
    this.userStatus,
    this.profileImage,
    this.token,
  });

  final String? userId;
  final String? name;
  final String? countryCode;
  final String? phoneNumber;
  final String? about;
  final String? userStatus;
  final String? profileImage;
  final String? token;

  factory UserInfoData.fromJson(Map<String, dynamic> json) {
    return UserInfoData(
      userId: json["userId"] ?? "",
      name: json["name"] ?? "",
      countryCode: json["countryCode"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      about: json["about"] ?? "",
      userStatus: json["userStatus"] ?? "",
      profileImage: json["profileImage"] ?? "",
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "about": about,
        "userStatus": userStatus,
        "profileImage": profileImage,
        "token": token,
      };
}
