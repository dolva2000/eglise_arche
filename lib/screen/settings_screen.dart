import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        //backgroundColor: Colors.indigo,
      ),
      body:ElevatedButton(
        child: Text("Security"),
        onPressed: () {
         
        },
      )
    );
  }
}
