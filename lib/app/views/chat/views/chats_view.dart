import 'package:flutter/material.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  final List<ReelItem> reels = List.generate(
    5,
    (index) => ReelItem(
      userName: "user$index",
      caption: "This is reel #$index 🔥",
      imageUrl: "https://picsum.photos/800/1400?random=$index",
      likes: 100 + index,
      comments: 20 + index,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          final reel = reels[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(reel.imageUrl, fit: BoxFit.cover),
              Container(color: Colors.black.withValues(alpha: 0.2)),
              Positioned(
                left: 16,
                bottom: 80,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@${reel.userName}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reel.caption,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _iconText(Icons.favorite, '${reel.likes}'),
                    const SizedBox(height: 16),
                    _iconText(Icons.comment, '${reel.comments}'),
                    const SizedBox(height: 16),
                    _iconText(Icons.share, 'Share'),
                    const SizedBox(height: 16),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/100',
                      ), // Dummy profile pic
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _iconText(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class ReelItem {
  final String userName;
  final String caption;
  final String imageUrl;
  final int likes;
  final int comments;

  ReelItem({
    required this.userName,
    required this.caption,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });
}
