import 'package:cholai/app/core/helpers/enums.dart';
import 'package:cholai/app/views/chat/widgets/chat_list_item_widget.dart'
    show ListItemWidget;
import 'package:cholai/app/widgets/app_bar_widgets/app_bar_title_widget.dart';
import 'package:cholai/app/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:cholai/app/widgets/list_view/paginated_list.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatItem> chatList = [
      ChatItem(
        name: 'Alice',
        message: 'Hey! Are we meeting today?',
        time: '9:30 AM',
        unreadCount: 2,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Bob',
        message: 'Sure, let me check...',
        time: '8:15 AM',
        unreadCount: 0,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Charlie',
        message: 'Can you send the report?',
        time: 'Yesterday',
        unreadCount: 5,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Alice',
        message: 'Hey! Are we meeting today?',
        time: '9:30 AM',
        unreadCount: 2,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Bob',
        message: 'Sure, let me check...',
        time: '8:15 AM',
        unreadCount: 0,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Charlie',
        message: 'Can you send the report?',
        time: 'Yesterday',
        unreadCount: 5,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Alice',
        message: 'Hey! Are we meeting today?',
        time: '9:30 AM',
        unreadCount: 2,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Bob',
        message: 'Sure, let me check...',
        time: '8:15 AM',
        unreadCount: 0,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Charlie',
        message: 'Can you send the report?',
        time: 'Yesterday',
        unreadCount: 5,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Alice',
        message: 'Hey! Are we meeting today?',
        time: '9:30 AM',
        unreadCount: 2,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Bob',
        message: 'Sure, let me check...',
        time: '8:15 AM',
        unreadCount: 0,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Charlie',
        message: 'Can you send the report?',
        time: 'Yesterday',
        unreadCount: 5,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Alice',
        message: 'Hey! Are we meeting today?',
        time: '9:30 AM',
        unreadCount: 2,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Bob',
        message: 'Sure, let me check...',
        time: '8:15 AM',
        unreadCount: 0,
        avatarUrl: null,
      ),
      ChatItem(
        name: 'Charlie',
        message: 'Can you send the report?',
        time: 'Yesterday',
        unreadCount: 5,
        avatarUrl: null,
      ),
    ];

    return Scaffold(
      appBar: MyAppBar(
        title: AppBarTitleWidget(title: "Chats", disableBackButton: true),
      ),
      body: PaginatedListView(
        backgroundColor: Theme.of(context).appTheme.kAppBackgroundColor,
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListItemWidget(
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWAUlJ1jSa-jvz5ATGj4ot2tbA1R-IF2Gdsmf8X7sdRt8xJyBQMH3E5PmEefKDPvKt01s&usqp=CAU',
            userName: chat.name,
            description: chat.message,
            time: chat.time,
            unreadCount: chat.unreadCount,
            latestMessageStatus: MessageStatus.read,
          );
        },
        separator: SizedBox.shrink(),
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String? avatarUrl;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    this.avatarUrl,
  });
}
