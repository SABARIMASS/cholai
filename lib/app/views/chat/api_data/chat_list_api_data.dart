class ChatListRequestData {
  final String userId;

  ChatListRequestData({required this.userId});

  Map<String, dynamic> toJson() {
    return {'userId': userId};
  }
}

class ChatListResponse {
  bool? isLoading;
  int? status;
  String? message;
  List<ChatItem>? data;

  // Constructor to create instances directly
  ChatListResponse({this.isLoading, this.status, this.message, this.data});

  // fromJson to create instance from JSON
  ChatListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      for (var v in json['data']) {
        data!.add(ChatItem.fromJson(v));
      }
    }
  }
}

class ChatItem {
  String? chatId;
  LastMessage? lastMessage;
  int? unreadCount;
  Receiver? receiver;

  // Constructor to create instances directly
  ChatItem({this.chatId, this.lastMessage, this.unreadCount, this.receiver});

  // fromJson to create instance from JSON
  ChatItem.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    lastMessage =
        json['lastMessage'] != null
            ? LastMessage.fromJson(json['lastMessage'])
            : null;
    unreadCount = json['unreadCount'];
    receiver =
        json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null;
  }
}

class LastMessage {
  String? text;
  String? status;
  String? time;
  String? senderId;

  // Constructor to create instances directly
  LastMessage({this.text, this.status, this.time, this.senderId});

  // fromJson to create instance from JSON
  LastMessage.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    status = json['status'];
    time = json['time'];
    senderId = json['senderId'];
  }
}

class Receiver {
  String? name;
  String? profileImage;

  // Constructor to create instances directly
  Receiver({this.name, this.profileImage});

  // fromJson to create instance from JSON
  Receiver.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImage = json['profileImage'];
  }
}
