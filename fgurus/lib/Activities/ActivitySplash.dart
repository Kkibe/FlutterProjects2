import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Set the visibility to true after a delay
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _visible = true;
      });

      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/home");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../../../ViewFoot.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
