import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _darkMode = !_darkMode;
    });
    // prefs.setBool('darkMode', _darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                _toggleDarkMode();
              },
              activeColor: Colors.red,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
