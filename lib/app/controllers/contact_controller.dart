import 'package:cholai/app/core/helpers/app_dialog.dart';
import 'package:cholai/app/core/utils/logger_util.dart';
import 'package:contact_plugin/contact_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cholai/app/app_services/contact_service.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/contacts/view/data/contact_api_data.dart';

class ContactController extends GetxController with WidgetsBindingObserver {
  Rx<ContactResponse> chatListResponse = ContactResponse().obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    checkAndFetchContacts();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkAndFetchContacts();
    }
  }

  void callChatListApi() async {
    chatListResponse.value.isLoading = true;
    final contacts = await fetchContacts();
    ContactRequestData systemContactListRequestData = ContactRequestData(
      contacts:
          contacts.map((value) {
            return ContactModel(
              countryCode: value.countryCode,
              phoneNumber: value.phoneNumber,
            );
          }).toList(),
    );
    ContactService.contactListRequestApi(systemContactListRequestData)
        .then((response) {
          chatListResponse.value = response;
          chatListResponse.value.isLoading = false;
          chatListResponse.refresh();
        })
        .onError((error, stacktrace) {
          chatListResponse.value.status = -1;
          chatListResponse.value.isLoading = false;
          chatListResponse.value.message = LanguageGlobal.networkError.tr;
          chatListResponse.refresh();
        });
  }

  Future<void> checkAndFetchContacts() async {
    final status = await Permission.contacts.status;
    if (status.isGranted) {
      callChatListApi();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      final result = await AppDialogHelpers.showCustomGetXDialog(
        title: 'Contact Permission Required',
        message: 'Please allow contact permission from settings to continue.',
        okText: 'Open Settings',
        noText: 'Cancel',
        okTextColor: Theme.of(Get.context!).primaryColor,
        okValue: 'yes',
        noValue: 'no',
      );
      if (result == 'yes') {
        await openAppSettings();
      }
    } else {
      final requestResult = await Permission.contacts.request();
      if (requestResult.isGranted) {
        callChatListApi();
      }
    }
  }

  Future<List<Contact>> fetchContacts() async {
    try {
      final contacts = await ContactPlugin.getContacts();
      return contacts.map((contact) {
        String fullNumber = contact.phoneNumber;
        RegExp regex = RegExp(r'^\+(\d+)[^\d]*(\d.*)$');
        Match? match = regex.firstMatch(fullNumber);

        if (match != null) {
          String countryCode = '+${match.group(1)}';
          String phoneNumber =
              match.group(2)?.replaceAll(RegExp(r'\D'), '') ?? '';

          return Contact(
            countryCode: countryCode,
            phoneNumber: phoneNumber,
            displayName: contact.displayName,
          );
        } else {
          // fallback if regex fails
          return Contact(
            countryCode: '',
            phoneNumber: fullNumber.replaceAll(RegExp(r'\D'), ''),
            displayName: contact.displayName,
          );
        }
      }).toList();
    } catch (e) {
      LoggerUtil.debug('fetchContacts: $e');
      return [];
    }
  }
}
