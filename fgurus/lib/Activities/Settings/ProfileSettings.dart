import 'package:flutter/material.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello world!"),
            SizedBox(height: 16.0),
            Text("Hello world!"),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Login button pressed
              },
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
