import 'package:fgurus/fragments/SettingsCard.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Color.fromARGB(255, 233, 221, 49),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SettingsCard(
                  title: 'Edit profile',
                  location: "/profile-settings",
                  icon: Icon(Icons.edit),
                ),
                SettingsCard(
                  title: 'Appearance',
                  location: "/appearance-settings",
                  icon: Icon(Icons.sunny),
                ),
                SettingsCard(
                  title: 'Notifications',
                  location: "/notification-settings",
                  icon: Icon(Icons.notifications_outlined),
                ),
                SettingsCard(
                  title: 'Language',
                  location: "/language-settings",
                  icon: Icon(Icons.language),
                ),
                SettingsCard(
                  title: 'Remove Ads',
                  location: "/language-settings",
                  icon: Icon(Icons.diamond),
                ),
              ],
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "General",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SettingsCard(
                  title: 'Share Fgurus',
                  location: 'Description for page 1',
                  icon: Icon(Icons.share),
                ),
                SettingsCard(
                  title: 'Rate Our App',
                  location: 'Description for page 1',
                  icon: Icon(Icons.star),
                ),
                SettingsCard(
                  title: 'Help & Feedback',
                  location: "/notification-settings",
                  icon: Icon(Icons.help_outline_rounded),
                ),
                SettingsCard(
                  title: 'About Us',
                  location: 'Description for page 1',
                  icon: Icon(Icons.info_outline_rounded),
                ),
                SettingsCard(
                  title: 'Privacy Policy',
                  location: 'Description for page 1',
                  icon: Icon(Icons.privacy_tip_rounded),
                ),
                SettingsCard(
                  title: 'Sign out',
                  location: "/appearance-settings",
                  icon: Icon(Icons.exit_to_app_rounded),
                ),
              ],
            ),
          ],
        ));
  }
}
