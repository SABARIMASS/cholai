import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/widgets/loader_widgets/app_loader.dart'
    show AppLoader;
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/app_style.dart';

class BodyDataHandler extends StatelessWidget {
  const BodyDataHandler({
    super.key,
    required this.body,
    required this.loader,
    required this.noBodyData,
    required this.errorMessage,
    required this.showBodyWidget,
    this.errorWidget,
    this.loaderWidget,
  });
  final Widget body;
  final bool loader;
  final bool noBodyData;
  final bool showBodyWidget;
  final String? errorMessage;
  final Widget? loaderWidget;
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    if (loader) {
      return loaderWidget ?? const Center(child: AppLoader());
    } else if (noBodyData) {
      return errorWidget ??
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Text(
                errorMessage ?? "No Data Found.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).appTheme.kPrimaryTextColor,
                  fontSize: AppFontSize.small.value,
                  fontWeight: AppFontWeight.semibold.value,
                ),
              ),
            ),
          );
    } else if (!showBodyWidget) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Text(
            "Something Went Wrong .",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).appTheme.kPrimaryTextColor,
              fontSize: AppFontSize.small.value,
              fontWeight: AppFontWeight.semibold.value,
            ),
          ),
        ),
      );
    } else {
      return body;
    }
  }
}
