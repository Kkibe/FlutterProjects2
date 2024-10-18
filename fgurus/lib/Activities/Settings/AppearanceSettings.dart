import 'package:flutter/material.dart';

class AppearanceSettings extends StatefulWidget {
  @override
  _AppearanceSettingsState createState() => _AppearanceSettingsState();
}

class _AppearanceSettingsState extends State<AppearanceSettings> {
  bool _darkThemeEnabled = false;
  bool _largeTextEnabled = false;

  String _selectedTheme = 'Device';

  void _selectTheme(String theme) {
    setState(() {
      _selectedTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Match my device settings'),
            onTap: () => _selectTheme('Device'),
            trailing: _selectedTheme == 'Device' ? Icon(Icons.check) : null,
          ),
          ListTile(
            title: Text('Light Theme'),
            onTap: () => _selectTheme('Light'),
            trailing: _selectedTheme == 'Light' ? Icon(Icons.check) : null,
          ),
          ListTile(
            title: Text('Dark Theme'),
            onTap: () => _selectTheme('Dark'),
            trailing: _selectedTheme == 'Dark' ? Icon(Icons.check) : null,
          ),
        ],
      ),
    );
  }

  void _applyTheme() {
    ThemeData newTheme = ThemeData.light();
    if (_darkThemeEnabled) {
      newTheme = ThemeData.dark();
    }

    if (_largeTextEnabled) {
      newTheme = newTheme.copyWith(
          textTheme: newTheme.textTheme.apply(fontSizeFactor: 1.5));
    }

    setState(() {
      //Theme.of(context).setTheme(newTheme);
    });
  }
}
