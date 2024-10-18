import 'package:flutter/material.dart';
import 'package:sidebar_menu/NavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Hello world!"),
      ),
      drawer: NavBar(),
    );
  }
}
