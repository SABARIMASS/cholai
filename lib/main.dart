import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzionest_chatai/app/app_intialization/app.dart';
import 'package:fuzionest_chatai/app/widgets/system_widgets/run_app_error.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/app_intialization/controller/app_main.dart';

Future<void> main() async {
  try {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await AppMainOnInit.appOnInit();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(AppMain());
    FlutterNativeSplash.remove();
  } catch (e) {
    FlutterNativeSplash.remove();
    runApp(ErrorScreen(e.toString()));
  }
}
