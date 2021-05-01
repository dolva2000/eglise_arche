import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        backgroundColor: Colors.yellow.shade800,
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: Color.fromRGBO(240, 240, 253, 1),
            image: DecorationImage(
                image: AssetImage('asset/img/bg2.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}
