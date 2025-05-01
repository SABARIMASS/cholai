import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/body_connection_widget.dart';
import 'widgets/body_data_handler.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.body,
    this.loader = false,
    this.noBodyData = false,
    this.showBodyWidget = true,
    this.checkInternet = true,
    this.errorMessage,
    this.padding,
    this.color,
    this.noBodyWidget,
    this.loaderWidget,
    this.autoRefresh,
  });
  final Widget body;
  final bool loader;
  final bool checkInternet;
  final bool noBodyData;
  final bool showBodyWidget;
  final String? errorMessage;
  final Widget? loaderWidget;
  final Widget? noBodyWidget;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final void Function()? autoRefresh;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color ?? Theme.of(context).appTheme.kAppBackgroundColor,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
          child: BodyConnectionWidget(
            checkInternet: checkInternet,
            refresh: autoRefresh,
            body: BodyDataHandler(
              loaderWidget: loaderWidget,
              body: body,
              loader: loader,
              noBodyData: noBodyData,
              showBodyWidget: showBodyWidget,
              errorMessage: errorMessage,
              errorWidget: noBodyWidget,
            ),
          ),
        ),
      ),
    );
  }
}
