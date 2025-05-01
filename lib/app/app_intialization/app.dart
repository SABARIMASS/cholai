import 'package:flutter/material.dart';
import 'package:cholai/app/core/constants/app_constants.dart';
import 'package:cholai/app/widgets/system_widgets/run_app_error.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import '../core/bindings/app_bindings.dart';
import '../core/helpers/app_directional.dart';
import '../core/helpers/app_screen_size.dart';
import '../core/languages/languages.dart';
import '../core/routes/app_pages.dart';
import 'app_intialization.dart';
import 'controller/my_app_controller.dart';
import 'media_query_view.dart';

class AppMain extends StatelessWidget {
  AppMain({super.key});
  final myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppResponsiveScreenSize.screenSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const AppIntialization(),
      builder: (BuildContext context, Widget? child) {
        return _runMainApp(child: child);
      },
    );
  }

  Widget _runMainApp({required Widget? child}) {
    return Obx(
      () => MediaQueryView(
        textDirection: AppDirectional.getDirectional(
          myAppController.setAppLanguage.value.languageCode,
        ),
        child: GetMaterialApp(
          translations: Languages(),
          textDirection: AppDirectional.getDirectional(
            myAppController.setAppLanguage.value.languageCode,
          ),
          locale: Languages.setAppLanguage,
          fallbackLocale: Languages.setAppLanguage,
          debugShowCheckedModeBanner: false,
          title: AppConstants.kAppName,
          theme: themeData,
          darkTheme: themeDataDark,
          themeMode: myAppController.themeMode.value,
          home: child,
          initialBinding: AppBindings(),
          getPages: routes,
          initialRoute: "/",
          builder: (context, child) {
            return child ??
                const ErrorScreen("..........**************..........");
          },
        ),
      ),
    );
  }
}
