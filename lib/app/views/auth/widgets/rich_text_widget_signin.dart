import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/shared/theme.dart';

import '../../../../shared/app_style.dart';

class RichTextWidgetSignIn extends StatelessWidget {
  const RichTextWidgetSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'We will send you an ',
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
            text: 'One Time Password ',
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
          TextSpan(
            text: 'on this mobile number',
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
        ],
      ),
    );
  }
}
