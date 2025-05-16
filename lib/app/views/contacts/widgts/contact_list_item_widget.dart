import 'package:cholai/app/widgets/images/network_image.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ContactListItemWidget extends StatelessWidget {
  final String? contactImage;
  final String? contactName;
  final String? countryCode;
  final String? phoneNumber;
  final VoidCallback? onTap;

  const ContactListItemWidget({
    super.key,
    this.contactImage,
    this.contactName,
    this.countryCode,
    this.phoneNumber,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).appTheme.kPrimaryColor.withAlpha(30),
        radius: 20.r,
        child:
            contactImage == null
                ? Icon(
                  Icons.person,
                  size: 22,
                  color: Theme.of(context).appTheme.kPrimaryColor,
                )
                : CommonCachedNetworkImage(
                  height: 50.h,
                  width: 50.w,
                  imageUrl: contactImage!,
                  isCircle: true,
                  errorWidget: Icon(
                    HugeIcons.strokeRoundedUser,
                    color: Theme.of(context).appTheme.kPrimaryColor,
                  ),
                ),
      ),
      title: Text(
        contactName ?? '',
        style: TextStyle(
          fontWeight: AppFontWeight.semibold.value,
          fontSize: AppFontSize.small.value,
          color: Theme.of(context).appTheme.kPrimaryTextColor,
        ),
      ),
      subtitle: Text(
        "${countryCode ?? ''} ${phoneNumber ?? ''}",
        style: TextStyle(
          fontSize: AppFontSize.small.value,
          color: Theme.of(context).appTheme.kPrimaryTextColor,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      onTap: onTap,
    );
  }
}
