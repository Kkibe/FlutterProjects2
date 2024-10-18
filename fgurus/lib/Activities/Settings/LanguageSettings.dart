import 'package:flutter/material.dart';

import 'NextScreen.dart';

class LanguageSettings extends StatefulWidget {
  @override
  _LanguageSettingsState createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  String _selectedLanguage = 'English';

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('English'),
            onTap: () => _selectLanguage('English'),
            trailing: _selectedLanguage == 'English' ? Icon(Icons.check) : null,
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () => _selectLanguage('Spanish'),
            trailing: _selectedLanguage == 'Spanish' ? Icon(Icons.check) : null,
          ),
          ListTile(
            title: Text('French'),
            onTap: () => _selectLanguage('French'),
            trailing: _selectedLanguage == 'French' ? Icon(Icons.check) : null,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save the selected language and navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NextScreen(selectedLanguage: _selectedLanguage),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
