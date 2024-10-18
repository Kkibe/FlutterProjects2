import 'package:fgurus/fragments/NotificationItem.dart';
import 'package:fgurus/fragments/NotificationItemWidget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> newsItems = [
    NotificationItem(
      title: 'Sample News Title',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkvDviHE49Tqmcwg9tAlm01GZg5G2ROV7mBkBMWacOphgEBCOwoElJQwmZZD3AZQRzRbg&usqp=CAU',
      content: 'Sample news content...',
      importance: false,
      postedOn: '22 Apr 2015',
    ),
    // Add more news items...
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return NotificationItemWidget(item: newsItems[index]);
        },
      ),
    ));
  }
}
