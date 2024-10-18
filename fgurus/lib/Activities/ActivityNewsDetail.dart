import 'package:flutter/material.dart';

class ActivityDetailScreen extends StatelessWidget {
  final String news;

  const ActivityDetailScreen(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(news),
      ),
    );
  }
}
