import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPlugin {
  static const MethodChannel _channel = MethodChannel('contact_plugin');

  static Future<List<Contact>> getContacts() async {
    final status = await Permission.contacts.request();
    if (!status.isGranted) {
      throw 'Contact permission not granted';
    }

    try {
      final List<dynamic> contacts = await _channel.invokeMethod('getContacts');
      return contacts
          .map((contact) => Contact.fromMap(Map<String, dynamic>.from(contact)))
          .toList();
    } on PlatformException catch (e) {
      throw 'Failed to get contacts: ${e.message}';
    }
  }
}

class Contact {
  final String displayName;
  final String phoneNumber;
  final String countryCode;

  Contact({
    required this.displayName,
    required this.phoneNumber,
    required this.countryCode,
  });

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      displayName: map['displayName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      countryCode: map['countryCode'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
    };
  }
}
