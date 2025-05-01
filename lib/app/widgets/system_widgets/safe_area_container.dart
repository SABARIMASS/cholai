import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cholai/shared/theme.dart';

import '../../../shared/themex_colors.dart';

class SafeAreaContainer extends StatefulWidget {
  final Widget child;
  final bool isTabBarShown;
  final Color? statusBarColor;
  final bool? themedark;
  final Color? systemNavigationBarColor;
  final bool? navigationBarthemedark;

  const SafeAreaContainer({
    super.key,
    required this.child,
    this.isTabBarShown = false,
    this.statusBarColor,
    this.themedark,
    this.systemNavigationBarColor,
    this.navigationBarthemedark,
  });

  @override
  SafeAreaContainerState createState() => SafeAreaContainerState();
}

class SafeAreaContainerState extends State<SafeAreaContainer> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor:
            widget.statusBarColor ??
            Theme.of(context).appTheme.kStatusBarPrimaryColor,
        statusBarBrightness:
            widget.themedark != null
                ? widget.themedark == true
                    ? Brightness.dark
                    : Brightness.light
                : Themex.themeModeType.value == ThemeMode.dark
                ? Brightness.dark
                : Brightness.light,
        statusBarIconBrightness:
            widget.themedark != null
                ? widget.themedark == true
                    ? Brightness.light
                    : Brightness.dark
                : Themex.themeModeType.value == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarColor:
            widget.navigationBarthemedark != null
                ? widget.navigationBarthemedark == true
                    ? widget.systemNavigationBarColor ??
                        Theme.of(context).appTheme.kAppBackgroundColor
                    : widget.systemNavigationBarColor ??
                        Theme.of(context).appTheme.kAppBackgroundColor
                : Themex.themeModeType.value == ThemeMode.dark
                ? Theme.of(context).appTheme.kAppBackgroundColor
                : Theme.of(context).appTheme.kAppBackgroundColor,
        // Set the background color of the navigation bar
        systemNavigationBarIconBrightness:
            widget.navigationBarthemedark != null
                ? widget.navigationBarthemedark == true
                    ? Brightness.light
                    : Brightness.dark
                : Themex.themeModeType.value == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: widget.child,
    );
  }
}
