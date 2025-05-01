import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status == PermissionStatus.granted;
  }

  static Future<bool> requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    return status == PermissionStatus.granted;
  }
}