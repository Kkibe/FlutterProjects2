import 'package:flutter/material.dart';
import 'package:fgurus/fragments/NewsScreen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          title: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.upcoming_outlined), text: 'Fixtures'),
              Tab(icon: Icon(Icons.sports), text: 'News'),
              Tab(icon: Icon(Icons.person), text: 'Teams'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Content for the first tab
            Center(child: NewsScreen()),
            // Content for the second tab
            Center(child: Text('Favorites')),
            // Content for the third tab
            Center(child: Text('Settings')),
          ],
        ),
      ),
    );
  }
}
