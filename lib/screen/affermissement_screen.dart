import 'package:flutter/material.dart';

class AffermissementScreen extends StatefulWidget {
  @override
  _AffermissementState createState() => _AffermissementState();
}

class _AffermissementState extends State<AffermissementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Affermissement'),
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
