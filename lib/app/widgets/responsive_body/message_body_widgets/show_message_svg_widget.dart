import 'package:flutter/material.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../shared/app_style.dart';
import '../../../core/constants/image_assets.dart';
import '../../../core/languages/language_global.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowMessageSvgWidget extends StatelessWidget {
  final String? svgPath;
  final double? size;
  final String? message;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onRefresh;

  const ShowMessageSvgWidget({
    super.key,
    this.svgPath,
    this.size,
    this.message,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.onRefresh,
  });

  Future<String> _loadSvgAndReplaceColor(
    String path, {
    required Color color,
  }) async {
    try {
      String svgString = await rootBundle.loadString(path);
      String replacementColor =
          // ignore: deprecated_member_use
          '#${color.value.toRadixString(16).substring(2)}';
      return svgString.replaceAll('#FF725E', replacementColor);
    } catch (e) {
      debugPrint('Error loading SVG: $e');
      return ''; // Return an empty string on error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appTheme.kAppBackgroundColor,
      child: Center(
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder<String>(
                future: _loadSvgAndReplaceColor(
                  svgPath ?? Assets.showMessage,
                  color: Theme.of(context).appTheme.kPrimaryColor,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      width: size ?? 250.w,
                      height: size ?? 250.h,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (snapshot.hasError || snapshot.data!.isEmpty) {
                    return SvgPicture.asset(
                      svgPath ?? Assets.showMessage,
                      width: size ?? 250.w,
                      height: size ?? 250.h,
                      fit: BoxFit.cover,
                    );
                  }
                  return SvgPicture.string(
                    snapshot.data!,
                    width: size ?? 250.w,
                    height: size ?? 250.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  message ?? "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    color:
                        textColor ??
                        Theme.of(context).appTheme.kPrimaryTextColor,
                    fontSize: fontSize ?? AppFontSize.small.value,
                    fontWeight: fontWeight ?? AppFontWeight.semibold.value,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              if (onRefresh != null)
                RefreshButtonWidget(
                  onRefresh: onRefresh,
                  textColor: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class RefreshButtonWidget extends StatelessWidget {
  final VoidCallback? onRefresh;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const RefreshButtonWidget({
    super.key,
    required this.onRefresh,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRefresh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh,
            size: 20.r,
            color: Theme.of(context).appTheme.kAppColor,
          ),
          SizedBox(width: 10.w),
          Text(
            LanguageGlobal.refresh.tr,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor ?? Theme.of(context).appTheme.kAppColor,
              fontSize: fontSize ?? AppFontSize.small.value,
              fontWeight: fontWeight ?? AppFontWeight.semibold.value,
            ),
          ),
        ],
      ),
    );
  }
}
