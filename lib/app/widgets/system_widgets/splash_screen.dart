import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/app/core/constants/image_assets.dart';
import 'package:fuzionest_chatai/app/widgets/images/custom_assets_widget.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'safe_area_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeAreaContainer(
      statusBarColor: Theme.of(context).appTheme.kPrimaryColor,
      themedark: true,
      navigationBarthemedark: true,
      systemNavigationBarColor: Theme.of(context).appTheme.kPrimaryColor,
      child: Material(
        child: Container(
          color: Theme.of(context).appTheme.kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _centerTitleWidget(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // AppLoader(
              //   color: Theme.of(context).appTheme.kPrimaryColor,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Center _centerTitleWidget() {
    return Center(
      child: ZoomIn(
        child: CustomAssetWidget(
          width: 200.w,
          radius: 25.r,
          assetPath: Assets.appImage,
          height: 200.h,
        ),
      ),
    );
  }
}
