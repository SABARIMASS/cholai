import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/themex_colors.dart';
import '../loader_widgets/app_loader.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String? secondaryText;
  final TextStyle? style;
  final TextStyle? secondaryTextStyle;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? disabledColor;
  final Color borderColor;
  final double? height;
  final double? width;
  final bool? isLoader;
  final double? borderRadius;
  final LinearGradient? linearColor;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    this.secondaryText,
    this.onTap,
    this.style,
    this.secondaryTextStyle,
    this.margin,
    this.color,
    this.disabledColor,
    this.height,
    this.width,
    this.borderColor = Colors.transparent,
    this.borderRadius,
    this.isLoader = false,
    this.linearColor,
    this.padding,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor =
        isDisabled
            ? disabledColor ?? Theme.of(context).appTheme.kLightColor
            : color ?? Theme.of(context).appTheme.kButtonPrimaryColor;

    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: 0.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        child: Material(
          color: buttonColor,
          child: InkWell(
            onTap: isDisabled ? null : onTap,
            child: Container(
              padding:
                  padding ??
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
                border: Border.all(color: borderColor),
                gradient: isDisabled ? null : linearColor,
              ),
              child:
                  isLoader == true
                      ? Center(
                        child: AppLoader(
                          color: Theme.of(context).appTheme.kIconSecondaryColor,
                        ),
                      )
                      : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style:
                                  style ??
                                  TextStyle(
                                    color:
                                        isDisabled
                                            ? Theme.of(
                                              context,
                                            ).appTheme.kLightColor
                                            : Theme.of(
                                              context,
                                            ).appTheme.kSecondaryTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            if (secondaryText?.isNotEmpty ?? false) ...[
                              Text(
                                "$secondaryText",
                                style:
                                    secondaryTextStyle ??
                                    TextStyle(
                                      color:
                                          isDisabled
                                              ? Theme.of(
                                                context,
                                              ).appTheme.kLightColor
                                              : Themex
                                                  .theme
                                                  .value
                                                  .kSecondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ],
                        ),
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
