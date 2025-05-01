import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/helpers/enums.dart';

class ConnectionManagerController extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  final Rx<NetworkType> netWorkStatus = NetworkType.waiting.obs;
  final Rx<NetworkType> appIntialNetWorkStatus = NetworkType.waiting.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  final _appLaunched = false.obs;
  late Timer? _connectionStartTimer;

  @override
  void onInit() {
    super.onInit();
    _getConnectivityType();
    _getStartConnectionTimer();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(
      _updateState,
    );
  }

  _getStartConnectionTimer() {
    _connectionStartTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (appIntialNetWorkStatus.value == NetworkType.waiting ||
          appIntialNetWorkStatus.value == NetworkType.noNetWork) {
        getConnectivityTypeStart();
      } else {
        _cancelConnectionStartTimer();
      }
    });
  }

  void _cancelConnectionStartTimer() {
    try {
      _connectionStartTimer?.cancel();
    } catch (e) {
      return;
    }
  }

  Future<void> _getConnectivityType() async {
    late List<ConnectivityResult> connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  Future<void> getConnectivityTypeStart() async {
    late List<ConnectivityResult> connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return appCheck(result: connectivityResult.first);
  }

  _updateState(List<ConnectivityResult> result) {
    switch (result.first) {
      case ConnectivityResult.wifi:
        netWorkStatus.value = NetworkType.wifi;
        _appLaunched.value = true;
        break;
      case ConnectivityResult.mobile:
        netWorkStatus.value = NetworkType.mobileData;
        _appLaunched.value = true;

        break;
      case ConnectivityResult.none:
        netWorkStatus.value = NetworkType.noNetWork;
        break;
      default:
      // showGetXSnackBar(title: 'Error', msg: 'Failed to get connection type');
    }
  }

  Future<int> appStartConnectivity() async {
    late List<ConnectivityResult> connectivityResult;
    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return appCheck(result: connectivityResult.first);
  }

  appCheck({required ConnectivityResult result}) {
    switch (result) {
      case ConnectivityResult.wifi:
        appIntialNetWorkStatus.value = NetworkType.wifi;
        _appLaunched.value = true;
        return 1;
      case ConnectivityResult.mobile:
        appIntialNetWorkStatus.value = NetworkType.mobileData;
        _appLaunched.value = true;
        return 2;
      case ConnectivityResult.none:
        appIntialNetWorkStatus.value = NetworkType.noNetWork;
        return 0;
      default:
        //showGetXSnackBar(title: 'Error', msg: 'Failed to get connection type');
        appIntialNetWorkStatus.value = NetworkType.noNetWork;
        return 0;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

  void appLaunchedMethod() {
    _appLaunched.value = true;
  }

  getAppStatus() {
    return _appLaunched.value;
  }
}
