import 'package:flutter/material.dart';

class WalkthroughPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const WalkthroughPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            scale: 3.0,
          ),
          const SizedBox(height: 20.0),
          Text(title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  )),
          const SizedBox(height: 10.0),
          Text(description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
