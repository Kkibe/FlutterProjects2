import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final String selectedLanguage;

  NextScreen({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Selected Language: $selectedLanguage'),
      ),
    );
  }
}
