import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/shared/app_style.dart';
import 'package:fuzionest_chatai/shared/theme.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatefulWidget {
  final Function(String)? onOtpFilled;
  final TextEditingController otpController;
  const OtpInputField({
    super.key,
    this.onOtpFilled,
    required this.otpController,
  });

  @override
  OtpInputFieldState createState() => OtpInputFieldState();
}

class OtpInputFieldState extends State<OtpInputField> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 40.h,
      textStyle: TextStyle(
        fontSize: AppFontSize.medium.value,
        color: Theme.of(context).appTheme.kPrimaryColor,
        fontWeight: AppFontWeight.semibold.value,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Theme.of(context).appTheme.kLightColor),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Theme.of(context).appTheme.kPrimaryColor),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Theme.of(context).appTheme.kPrimaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Theme.of(context).appTheme.kLightColor),
      ),
    );

    return Pinput(
      autofocus: true,
      length: 6,
      controller: widget.otpController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,15}$')),
      ],
      onCompleted: (otp) {
        if (widget.onOtpFilled != null) {
          widget.onOtpFilled!(otp);
        }
      },
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 2.w,
            height: 10.h,
            color: Theme.of(context).appTheme.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
