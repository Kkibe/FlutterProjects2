import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key, required this.title});
  final String title;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
              children: [
                Image.network('../assets/')
              ],
            )
            )
          },
        ),
      ),//
    ); This trailing comma makes auto-formatting nicer for build methods.
  }
}
