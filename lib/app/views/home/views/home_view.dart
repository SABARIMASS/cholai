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
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Text(
                chat.name[0],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(chat.name),
            subtitle: Text(
              chat.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                if (chat.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // Navigate to chat detail page
            },
          );
        },
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
