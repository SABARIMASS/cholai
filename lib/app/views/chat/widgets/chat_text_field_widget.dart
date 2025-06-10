import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:cholai/shared/themex_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final void Function()? onTap;
  const ChatTextWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      keyboardAppearance:
          Themex.themeModeType.value == ThemeMode.light
              ? Brightness.light
              : Brightness.dark,
      onTap: onTap,
      cursorHeight: 15.h,
      controller: controller,
      style: TextStyle(
        color: Theme.of(context).appTheme.kPrimaryTextColor,
        fontSize: AppFontSize.small.value,
        fontWeight: AppFontWeight.semibold.value,
      ),
      keyboardType: TextInputType.multiline, // Supports multi-line input
      textInputAction: TextInputAction.newline, // Moves to next line on Enter
      maxLines: 7, // Expands dynamically
      minLines: 1,
      expands: false,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Theme.of(context).appTheme.kHintTextColor,
          fontSize: AppFontSize.small.value,
          fontWeight: AppFontWeight.semibold.value,
        ),
        hintText: hint,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 0.w,
        ), // Adds padding
      ),
      cursorColor:
          Theme.of(context).appTheme.kCursorColor, // Customize cursor color
    );
  }
}
