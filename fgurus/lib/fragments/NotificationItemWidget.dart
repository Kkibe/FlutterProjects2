import 'package:fgurus/fragments/NotificationDetailsScreen.dart';
import 'package:fgurus/fragments/NotificationItem.dart';
import 'package:flutter/material.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationItem item;

  const NotificationItemWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5, // Set the elevation (shadow)
      shape: RoundedRectangleBorder(
        // Set the shape
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(item.title),
        subtitle: Text('${item.postedOn}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        leading: Image.network(
          item.imageUrl,
          scale: 3,
          height: 500,
          fit: BoxFit.contain,
        ),
        trailing: const Icon(
          Icons.notification_important,
          color: Colors.red,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NotificationDetailsScreen(item: item)),
          );
        },
      ),
    );
  }
}
