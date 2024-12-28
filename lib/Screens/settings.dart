import 'package:flutter/material.dart';
import 'package:funfacts_app/widgets/theme_switcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title:Text('Settings',style: TextStyle(fontFamily: 'Ga Maamli'),),
      ),
      body: Column(children: [
       ThemeSwitcher(),
      ],),
    );
  }
}
