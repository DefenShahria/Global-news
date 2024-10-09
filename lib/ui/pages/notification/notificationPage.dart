import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Notification Page'),
        ),
      ),
    );
  }
}
