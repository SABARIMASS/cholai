import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomBarWidget extends StatefulWidget {
  final int initialIndex;
  final Function(int index) onTap;
  final List<int> badges; // Should contain exactly 4 items

  const BottomBarWidget({
    super.key,
    required this.initialIndex,
    required this.onTap,
    required this.badges,
  }) : assert(badges.length == 4, "Badges list must have 4 items");

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  late int _currentIndex;

  final List<IconData> _icons = [
    HugeIcons.strokeRoundedMessage01,

    HugeIcons.strokeRoundedVideo02,
    HugeIcons.strokeRoundedCall,
    HugeIcons.strokeRoundedSettings01,
  ];

  final List<String> _labels = ['Chats', 'Reels', 'Calls', 'Settings'];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).appTheme.kAppBackgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),

        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_icons.length, (index) {
            final isSelected = index == _currentIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                  widget.onTap(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? Theme.of(context).appTheme.kBlack
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: Theme.of(context).appTheme.kAppBackgroundColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Icon(
                            _icons[index],
                            color:
                                isSelected
                                    ? Theme.of(context).appTheme.kWhiteColor
                                    : Theme.of(context).appTheme.kBlack,
                            size: 22.r,
                          ),
                          if (widget.badges[index] > 0)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: EdgeInsets.all(0.r),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 12.w,
                                  minHeight: 12.w,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.r),
                                  child: Text(
                                    '${widget.badges[index]}',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: AppFontWeight.medium.value,
                                      color:
                                          Theme.of(
                                            context,
                                          ).appTheme.kWhiteColor,
                                      fontSize: 8.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (isSelected)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            _labels[index],
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: AppFontWeight.medium.value,
                              color: Theme.of(context).appTheme.kWhiteColor,
                              fontSize: AppFontSize.extraSmall.value,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
