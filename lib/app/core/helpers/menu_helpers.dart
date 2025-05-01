import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/shared/app_style.dart';
import 'package:fuzionest_chatai/shared/theme.dart';

class MenuHelpers {
  static void showPopupMenu({
    required BuildContext context,
    required TapDownDetails details,
    required List<PopupMenuEntry> menuItems,
  }) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final result = await showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r), // Adjust the radius as needed
        side: BorderSide(color: Theme.of(context).appTheme.kLightBorderColor),
      ),
      menuPadding: EdgeInsets.symmetric(),
      elevation: 0.0,
      color: Theme.of(context).appTheme.kAppBackgroundColor,
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & const Size(40, 40), // Position based on tap
        Offset.zero & overlay.size,
      ),
      items: menuItems,
    );

    if (result != null) {
      LoggerUtil.debug("Selected: $result");
    }
  }

  static PopupMenuItem buildPopupMenuItem({
    IconData? icon,
    Color? iconColor,
    required String value,
    Color? valueColor,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: icon != null ? 4.w : 12.w),
      value: value,
      child: Row(
        children: [
          icon != null
              ? Icon(
                icon,
                size: 16.r,
                color:
                    iconColor ?? Theme.of(context).appTheme.kIconPrimaryColor,
              )
              : SizedBox.shrink(),
          icon != null
              ? const SizedBox(width: 4)
              : SizedBox.shrink(), // Spacing between icon and text
          Text(
            value,
            style: TextStyle(
              fontWeight: AppFontWeight.medium.value,
              fontSize:
                  AppFontSize.small.value, // Replace with your AppFontSize
              color: valueColor ?? Theme.of(context).appTheme.kPrimaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
