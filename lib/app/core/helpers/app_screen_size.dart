import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppResponsiveScreenSize {
  static Size screenSize(BuildContext context) {
    // Determine the screen size and return appropriate design size based on the device type
    if (kIsWeb) {
      // For web, you might want to use a different design size
      return const Size(1024, 768); // Example size for desktop web
    } else if (Platform.isAndroid || Platform.isIOS) {
      if (MediaQuery.of(context).size.shortestSide > 600) {
        // For mobile devices
        // You can consider larger design size for tablets
        return const Size(600, 1024); // Example size for tablets
      } else {
        return const Size(360, 640); // Example size for mobile phones
      }
    } else {
      // For other platforms (e.g., desktop)
      return const Size(1280, 720); // Example size for desktop
    }
  }
}
