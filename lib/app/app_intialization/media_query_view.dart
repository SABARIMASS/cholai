import 'package:flutter/material.dart';
import 'connection_widget/connection_lost_widget.dart';

class MediaQueryView extends StatelessWidget {
  const MediaQueryView({
    super.key,
    required this.child,
    required this.textDirection,
  });
  final Widget child;
  final TextDirection textDirection;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: const TextScaler.linear(1.0)),
        child: Column(
          children: [
            Expanded(child: child),
            ConnectionLostWidget(textDirection: textDirection),
          ],
        ),
      ),
    );
  }
}
