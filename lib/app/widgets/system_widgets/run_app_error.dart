import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('An error occurred: $errorMessage')),
      ),
    );
  }
}
