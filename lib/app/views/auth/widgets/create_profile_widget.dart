import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuzionest_chatai/app/core/config/app_info.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';
import 'package:fuzionest_chatai/app/widgets/inkwell/list_inkwell_widget.dart';
import 'package:fuzionest_chatai/shared/theme.dart';

import '../../../../shared/app_style.dart';

class UserProfileWidget extends StatefulWidget {
  final String imageUrl;
  final String errorAssetImage;
  final IconData overlayIcon;
  final bool loadImage;
  final TextEditingController nameController;
  final TextEditingController aboutController;
  final void Function() onTap;
  const UserProfileWidget({
    super.key,
    required this.imageUrl,
    required this.errorAssetImage,
    required this.overlayIcon,
    required this.loadImage,
    required this.nameController,
    required this.aboutController,
    required this.onTap,
  });

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late String currentImageUrl;
  late bool loadImage;
  @override
  void initState() {
    super.initState();
    currentImageUrl = widget.imageUrl; // Initialize with the initial imageUrl
    loadImage = widget.loadImage;
  }

  @override
  void didUpdateWidget(covariant UserProfileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update currentImageUrl if the new imageUrl is different
    if (oldWidget.imageUrl != widget.imageUrl) {
      setState(() {
        currentImageUrl = '${AppInfo.kImageBase}${widget.imageUrl}';
        LoggerUtil.debug("UPLOADED PROFILE IMAGE $currentImageUrl");
      });
    }
    // Update currentImageUrl if the new imageUrl is different
    if (oldWidget.loadImage != widget.loadImage) {
      setState(() {
        loadImage = widget.loadImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor:
                      Theme.of(context).appTheme.kAppBackgroundColor,
                  child: CustomInkWell(
                    onTap: widget.onTap,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: currentImageUrl,
                        placeholder:
                            (context, url) => const CircularProgressIndicator(),
                        errorWidget:
                            (context, url, error) => Image.asset(
                              widget.errorAssetImage,
                              fit: BoxFit.cover,
                            ),
                        fit: BoxFit.cover,
                        width: 80.w,
                        height: 80.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2.h,
                  right: 0.w,
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).appTheme.kAppBackgroundColor,
                    radius: 12.r,
                    child: CustomInkWell(
                      onTap: widget.onTap,
                      child: Icon(
                        widget.overlayIcon,
                        size: 16.r,
                        color: Theme.of(context).appTheme.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                autofocus: true,
                cursorColor: Theme.of(context).appTheme.kCursorColor,
                controller: widget.nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                    fontWeight: AppFontWeight.normal.value,
                    fontSize: AppFontSize.medium.value,
                    color:
                        Theme.of(
                          context,
                        ).appTheme.kHintTextColor, // Specify text color
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold.value,
                  fontSize: AppFontSize.medium.value,
                  color: Theme.of(context).appTheme.kPrimaryTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Column(
          spacing: 8.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(
                fontWeight: AppFontWeight.semibold.value,
                fontSize: AppFontSize.medium.value,
                color: Theme.of(context).appTheme.kPrimaryTextColor,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).appTheme.kLightBorderColor,
                ),
              ),
              child: TextField(
                cursorColor: Theme.of(context).appTheme.kCursorColor,
                controller: widget.aboutController,
                decoration: InputDecoration(
                  hintText: 'info...',
                  hintStyle: TextStyle(
                    fontWeight: AppFontWeight.medium.value,
                    fontSize: AppFontSize.medium.value,
                    color: Theme.of(context).appTheme.kHintTextColor,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold.value,
                  fontSize: AppFontSize.medium.value,
                  color: Theme.of(context).appTheme.kPrimaryTextColor,
                ),
                maxLines: 4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
