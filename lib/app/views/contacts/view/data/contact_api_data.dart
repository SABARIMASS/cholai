class ContactRequestData {
  List<ContactModel>? contacts;

  ContactRequestData({this.contacts});

  factory ContactRequestData.fromJson(Map<String, dynamic> json) {
    return ContactRequestData(
      contacts:
          (json['contacts'] as List?)
              ?.map((e) => ContactModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'contacts': contacts?.map((e) => e.toJson()).toList()};
  }
}

class ContactModel {
  String? countryCode;
  String? phoneNumber;
  String? name;
  String? profileImage;
  ContactModel({
    this.countryCode,
    this.phoneNumber,
    this.name,
    this.profileImage,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      countryCode: json['countryCode'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'countryCode': countryCode, 'phoneNumber': phoneNumber};
  }
}

class ContactResponse {
  int? status;
  String? message;
  bool? isLoading;
  List<ContactModel>? data;

  ContactResponse({this.status, this.message, this.data, this.isLoading});

  factory ContactResponse.fromJson(Map<String, dynamic> json) {
    return ContactResponse(
      status: json['status'],
      message: json['message'],
      data:
          (json['data'] as List?)
              ?.map((e) => ContactModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}
