import 'package:cholai/app/core/config/app_info.dart';

class ImageHelper {
  static networkImageFullUrl(String imagePath) {
    return "${AppInfo.kDocumentUpload}$imagePath";
  }
}
