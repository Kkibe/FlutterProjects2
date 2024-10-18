import 'package:flutter/material.dart';

import 'NewsItem.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsItem item;

  const NewsDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(item.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.title,
                  style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                  'Published on ${item.publicationDate} • ${item.readingTime} min read'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.content),
            ),
            // Add comment section and voice reading button here
          ],
        ),
      ),
    );
  }
}
