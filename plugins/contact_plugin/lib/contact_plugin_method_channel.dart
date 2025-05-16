import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'contact_plugin_platform_interface.dart';

/// An implementation of [ContactPluginPlatform] that uses method channels.
class MethodChannelContactPlugin extends ContactPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('contact_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
