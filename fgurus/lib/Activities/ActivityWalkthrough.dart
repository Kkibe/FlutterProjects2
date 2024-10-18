import 'package:fgurus/Activities/WalktroughPage.dart';
import 'package:flutter/material.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              WalkthroughPage(
                title: 'Follow Favorite Teams',
                description: 'Follow your favorite teams to stay in the loop.',
                image: 'https://i.ibb.co/cJqsPSB/scooter.png',
              ),
              WalkthroughPage(
                title: 'Bookmark your favorite content',
                description:
                    'Bookmark your favorite articles to read at a leisure time.',
                image: 'https://i.ibb.co/420D7VP/building.png',
              ),
              WalkthroughPage(
                title: 'Connect with your friends.',
                description: 'Connect with your friends anytime anywhere.',
                image: 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png',
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 10.0,
                  width: _currentPage == index ? 30.0 : 10.0,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(10.0),
                    color: _currentPage == index ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentPage < 2) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          } else {
            // Navigate to the next screen or perform any action
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
