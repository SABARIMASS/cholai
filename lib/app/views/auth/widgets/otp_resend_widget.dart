import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/app/core/helpers/snackbar_helper.dart';
import 'package:cholai/app/core/languages/language_global.dart';
import 'package:cholai/app/views/auth/service/api_service.dart';
import 'package:cholai/app/widgets/inkwell/list_inkwell_widget.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:get/get.dart';

class ResendOtpWidget extends StatefulWidget {
  final void Function(String otp) onOtpResend;
  final String userId;

  const ResendOtpWidget({
    super.key,
    required this.onOtpResend,
    required this.userId,
  });

  @override
  State<ResendOtpWidget> createState() => _ResendOtpWidgetState();
}

class _ResendOtpWidgetState extends State<ResendOtpWidget> {
  int secondsRemaining = 10;
  late Timer timer;
  bool showResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining == 1) {
        setState(() {
          showResend = true;
        });
        t.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  Future<void> resendOtp() async {
    final userId = widget.userId;

    resendOtpApi(userId)
        .then((response) {
          if (response.status == 1) {
            widget.onOtpResend(response.otp ?? "");
            setState(() {
              secondsRemaining = 10;
              showResend = false;
            });
            startTimer();
          } else {
            SnackbarHelper.showGetXSnackBar(msg: response.message);
          }
        })
        .onError((er, st) {
          SnackbarHelper.showGetXSnackBar(msg: LanguageGlobal.networkError.tr);
        });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10.h),
        Text(
          "Don't receive the OTP?",
          style: TextStyle(
            fontWeight: AppFontWeight.semibold.value,
            fontSize: AppFontSize.small.value,
            color: theme.kHintTextColor,
          ),
        ),
        SizedBox(height: 10.h),
        showResend
            ? CustomInkWell(
              onTap: resendOtp,
              child: Text(
                "RESEND OTP",
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold.value,
                  fontSize: AppFontSize.small.value,
                  color: theme.kPrimaryColor,
                ),
              ),
            )
            : Text(
              "Resend in $secondsRemaining s",
              style: TextStyle(
                fontWeight: AppFontWeight.semibold.value,
                fontSize: AppFontSize.small.value,
                color: theme.kHintTextColor,
              ),
            ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
