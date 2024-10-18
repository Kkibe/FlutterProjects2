import 'package:fgurus/Activities/ActivityRegister.dart';
import 'package:fgurus/Activities/ActivityWalkthrough.dart';
import 'package:fgurus/Activities/ActvityLogin.dart';
import 'package:fgurus/Activities/Settings/AppearanceSettings.dart';
import 'package:fgurus/Activities/Settings/LanguageSettings.dart';
import 'package:fgurus/Activities/Settings/NotificationSettings.dart';
import 'package:fgurus/Activities/Settings/ProfileSettings.dart';
import 'package:fgurus/fragments/ExploreScreen.dart';
import 'package:fgurus/fragments/MeScreen.dart';
import 'package:fgurus/fragments/NewsScreen.dart';
import 'package:fgurus/fragments/ScoresScreen.dart';
import 'package:fgurus/fragments/SettingsScreen.dart';
import 'package:flutter/material.dart';

import 'fragments/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F Gurus 90',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 232, 238, 232)),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavScreen(),
        '/welcome': (context) => const WalkthroughScreen(),
        '/login': (context) => const ActivityLogin(),
        '/register': (context) => const ActivityRegister(),
        '/appearance-settings': (context) => AppearanceSettings(),
        '/notification-settings': (context) => NotificationSettings(),
        '/profile-settings': (context) => ProfileSettings(),
        '/language-settings': (context) => LanguageSettings(),
      },
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const ScoreScreen(),
    const MeScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_outlined),
            activeIcon: Icon(Icons.live_tv_rounded),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
