import Flutter
import UIKit
import Contacts
import PermissionHandler

public class SwiftContactPlugin: NSObject, FlutterPlugin {
  let store = CNContactStore()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "contact_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftContactPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getContacts" {
      if checkPermission() {
        let contacts = fetchContacts()
        result(contacts)
      } else {
        result(FlutterError(code: "PERMISSION_DENIED", message: "Contact permission not granted", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func checkPermission() -> Bool {
    let status = CNContactStore.authorizationStatus(for: .contacts)
    return status == .authorized
  }

  private func fetchContacts() -> [[String: String]] {
    var contactArray: [[String: String]] = []
    let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
    let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

    do {
        try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
            for number in contact.phoneNumbers {
                let phone = number.value.stringValue.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
                let countryCode = phone.starts(with: "+") ? String(phone.prefix(while: { $0.isNumber || $0 == "+" })) : ""

                contactArray.append([
                    "displayName": "\(contact.givenName) \(contact.familyName)",
                    "phoneNumber": phone,
                    "countryCode": countryCode
                ])
            }
        })
    } catch {
        print("Failed to fetch contact: \(error)")
    }

    return contactArray
}

}
