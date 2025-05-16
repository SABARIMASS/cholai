import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CallItem> callHistory = [
      CallItem(
        name: "Alice",
        time: "Today, 9:15 AM",
        callType: CallType.incoming,
        isVideo: false,
      ),
      CallItem(
        name: "Bob",
        time: "Yesterday, 8:45 PM",
        callType: CallType.outgoing,
        isVideo: true,
      ),
      CallItem(
        name: "Charlie",
        time: "Yesterday, 5:30 PM",
        callType: CallType.missed,
        isVideo: false,
      ),
    ];

    return Scaffold(
      appBar: _appBarWidget(context),
      body: ListView.builder(
        itemCount: callHistory.length,
        itemBuilder: (context, index) {
          final call = callHistory[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=4"),
            ),
            title: Text(call.name),
            subtitle: Row(
              children: [
                Icon(
                  _getCallTypeIcon(call.callType),
                  size: 16,
                  color: _getCallTypeColor(call.callType),
                ),
                const SizedBox(width: 4),
                Text(call.time),
              ],
            ),
            trailing: Icon(
              call.isVideo ? Icons.videocam : Icons.call,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              // Handle call action or navigate to call detail
            },
          );
        },
      ),
    );
  }

  MyAppBar _appBarWidget(BuildContext context) {
    return MyAppBar(
      title: AppBarTitleWidget(
        title: "Calls",
        alignment: Alignment.centerLeft,

        disableBackButton: true,
        titleStyle: TextStyle(
          color: Theme.of(context).appTheme.kPrimaryTextColor,
          fontSize: AppFontSize.large.value,
          fontWeight: AppFontWeight.bold.value,
        ),
      ),
    );
  }

  IconData _getCallTypeIcon(CallType type) {
    switch (type) {
      case CallType.incoming:
        return Icons.call_received;
      case CallType.outgoing:
        return Icons.call_made;
      case CallType.missed:
        return Icons.call_missed;
    }
  }

  Color _getCallTypeColor(CallType type) {
    switch (type) {
      case CallType.incoming:
        return Colors.green;
      case CallType.outgoing:
        return Colors.blue;
      case CallType.missed:
        return Colors.red;
    }
  }
}

enum CallType { incoming, outgoing, missed }

class CallItem {
  final String name;
  final String time;
  final CallType callType;
  final bool isVideo;

  CallItem({
    required this.name,
    required this.time,
    required this.callType,
    required this.isVideo,
  });
}
