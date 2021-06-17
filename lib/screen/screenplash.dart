import 'package:apparche/programme/programme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:apparche/screen//home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'alerte.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AlerteNothification()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.indigo,
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/img/splashscreen.jpg"),
            fit: BoxFit.cover,
          )),
        )
      ],
    ));
  }
}
