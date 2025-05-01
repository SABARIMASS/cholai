import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../shared/app_style.dart';
import '../custom_card_widgets/card_widget.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({this.color, this.size, super.key});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? LoadingAnimationWidget.discreteCircle(
          color: color ?? Theme.of(context).appTheme.kPrimaryColor,
          size: size ?? 30,
        )
        : CupertinoActivityIndicator(
          radius: 16.r,
          color: color ?? Theme.of(context).appTheme.kPrimaryColor,
        );
  }
}

class ImageLoader extends StatelessWidget {
  const ImageLoader({this.color, this.size, super.key});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeRotatingDots(
      color: color ?? Colors.black,
      size: size ?? 30,
    );
  }
}

class DotLoader extends StatelessWidget {
  const DotLoader({this.color, this.size, super.key});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: color ?? Colors.black,
      size: size ?? 30,
    );
  }
}

class AppLoaderWidget extends StatelessWidget {
  const AppLoaderWidget({this.color, this.size, this.value, super.key});

  final Color? color;
  final double? size;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      borderRadius: 4.r,
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Platform.isAndroid
              ? LoadingAnimationWidget.hexagonDots(
                color: color ?? Theme.of(context).appTheme.kPrimaryColor,
                size: size ?? 30,
              )
              : CupertinoActivityIndicator(
                radius: 16.r,
                color: color ?? Theme.of(context).appTheme.kPrimaryColor,
              ),
          SizedBox(height: 10.h),
          Text(
            value ?? "Please Wait...",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).appTheme.kPrimaryTextColor,
              fontSize: AppFontSize.small.value,
              fontWeight: AppFontWeight.semibold.value,
            ),
          ),
        ],
      ),
    );
  }
}
