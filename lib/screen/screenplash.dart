import 'package:flutter/material.dart';
import 'dart:async';
import 'package:apparche/screen//home.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Stack(
          children: <Widget>[
            new Container(
          
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage("asset/img/splashscreen.jpg"),
                fit: BoxFit.cover,
              )),
            )
          ],
        )
        );
  }
}