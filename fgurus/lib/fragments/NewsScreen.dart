import 'package:fgurus/fragments/NewsItem.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  DateTime now = DateTime.now();
  List<NewsItem> newsItems = [
    NewsItem(
      title: 'Sample Notifications Title',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkvDviHE49Tqmcwg9tAlm01GZg5G2ROV7mBkBMWacOphgEBCOwoElJQwmZZD3AZQRzRbg&usqp=CAU',
      publicationDate: '22 Apr 2015',
      content: 'Sample news content...',
      readingTime: 5,
    ),
    // Add more news items...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News Popular / Latest'),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView.builder(
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                return NewsItemWidget(item: newsItems[index]);
              },
            ),
          ),
        ));
  }
}

class NewsItemWidget extends StatelessWidget {
  final NewsItem item;

  const NewsItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 136,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(item.imageUrl),
                    ))),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '${item.publicationDate} • ${item.readingTime} min read',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icons.bookmark_border_rounded,
                    Icons.share,
                  ].map((e) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                        child: Icon(e, size: 24),
                      ),
                    );
                  }).toList(),
                )
              ],
            )),
          ],
        ));
  }
}
