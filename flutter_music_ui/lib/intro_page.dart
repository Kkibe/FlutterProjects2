import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_music_ui/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 80.0, right: 80, bottom: 80, top: 120),
          child: Image.asset('assets/Toyota.png'),
        ),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            "We deliver groceries at your doorstep",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Fresh groceries everyday",
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          })),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
            child: const Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
