import 'package:flutter/material.dart';

class Pastorale extends StatefulWidget {
  @override
  _PastoraleState createState() => _PastoraleState();
}

class _PastoraleState extends State<Pastorale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Corps Pastorale"),
        //backgroundColor: Colors.indigo,
        elevation: 11,
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/bg2.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image.asset("assets/img/pastor_and_wife.jpg"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
