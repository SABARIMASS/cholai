import 'package:cholai/app/core/config/app_info.dart';
import 'package:cholai/app/core/utils/logger_util.dart';

class ImageHelper {
  static networkImageFullUrl(String imagePath) {
    LoggerUtil.debug("${AppInfo.kImageBase}$imagePath");
    return "${AppInfo.kImageBase}$imagePath";
  }
}
