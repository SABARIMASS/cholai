import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import '../../../../shared/app_style.dart';

class RichTextWidgetOtp extends StatelessWidget {
  const RichTextWidgetOtp({required this.phoneNumber, super.key});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Enter OTP send to ',
            style: TextStyle(
              fontFamily: Theme.of(context).myFontFamily,
              fontWeight: AppFontWeight.normal.value,
              fontSize: AppFontSize.medium.value,
              color:
                  Theme.of(
                    context,
                  ).appTheme.kPrimaryTextColor, // Specify text color
            ),
          ),
          TextSpan(
            text: phoneNumber,
            style: TextStyle(
              fontFamily: Theme.of(context).myFontFamily,
              fontWeight: AppFontWeight.semibold.value,
              fontSize: AppFontSize.medium.value,
              color:
                  Theme.of(
                    context,
                  ).appTheme.kPrimaryTextColor, // Specify text color
            ),
          ),
        ],
      ),
    );
  }
}
