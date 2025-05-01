import 'package:flutter/material.dart';
import 'package:fuzionest_chatai/app/widgets/responsive_body/message_body_widgets/show_message_svg_widget.dart';

class AppGetCoreView extends StatelessWidget {
  final VoidCallback onRefresh; // Callback for refresh
  final String text; // Text to display

  const AppGetCoreView({
    super.key,
    required this.onRefresh,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowMessageSvgWidget(
              message: text,
              onRefresh: onRefresh,
            ), // Assuming this displays an SVG
          ],
        ),
      ),
    );
  }
}
