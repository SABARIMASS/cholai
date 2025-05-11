import 'package:cholai/app/core/helpers/enums.dart';
import 'package:cholai/app/widgets/images/network_image.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ListItemWidget extends StatelessWidget {
  final String? profileImage;
  final String? userName;
  final String? description;
  final String? time;
  final int? unreadCount;
  final MessageStatus? latestMessageStatus;

  const ListItemWidget({
    super.key,
    this.profileImage,
    this.userName,
    this.description,
    this.time,
    this.unreadCount,
    this.latestMessageStatus,
  });

  IconData? _getStatusIcon(MessageStatus? status) {
    switch (status) {
      case MessageStatus.sent:
        return Icons.check;
      case MessageStatus.received:
        return Icons.done_all;
      case MessageStatus.read:
        return Icons.done_all; // Could be blue if styled
      default:
        return null;
    }
  }

  Color? _getStatusColor(MessageStatus? status) {
    if (status == MessageStatus.read) {
      return Colors.blue;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(
          context,
        ).appTheme.kPrimaryColor.withValues(alpha: 0.1),

        child:
            profileImage == null
                ? Icon(Icons.person)
                : CommonCachedNetworkImage(
                  height: 50.h,
                  width: 50.w,
                  imageUrl: profileImage!,
                  isCircle: true,
                  errorWidget: Icon(
                    HugeIcons.strokeRoundedUser,
                    color: Theme.of(context).appTheme.kPrimaryColor,
                  ),
                ),
      ),
      title: Text(
        userName ?? '',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          if (latestMessageStatus != null)
            Icon(
              _getStatusIcon(latestMessageStatus),
              size: 16,
              color: _getStatusColor(latestMessageStatus),
            ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(description ?? '', overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (unreadCount != null && unreadCount! > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          const SizedBox(height: 4),
          if (time != null)
            Text(time!, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {
        // Handle tap
      },
    );
  }
}
