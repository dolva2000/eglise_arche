import 'package:flutter/material.dart';

class Authetification extends StatefulWidget {
  @override
  _AuthetificationState createState() => _AuthetificationState();
}

class _AuthetificationState extends State<Authetification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text("Welcome Back",
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(
                height: 20.0,
              ),
              Text("Ea sit elit non sunt consequat aliquip irure elit."),
            ],
          ),
        ),
      ),
    );
  }
}
