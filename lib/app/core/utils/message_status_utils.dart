import 'package:cholai/app/core/helpers/enums.dart';

class MessageUtills {
  static MessageStatus getMessageStatusFromString(
    String userId,
    String senderId,
    String status,
  ) {
    if (userId == senderId) {
      switch (status.toLowerCase()) {
        case 'read':
          return MessageStatus.read;
        case 'sent':
          return MessageStatus.sent;
        case 'received':
          return MessageStatus.received;

        default:
          return MessageStatus.none;
      }
    } else {
      return MessageStatus.none;
    }
  }
}
