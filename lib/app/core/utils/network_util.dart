import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
}
