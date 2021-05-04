import 'package:flutter/material.dart';
import 'vision.dart';
import 'geolocation.dart';
import 'package:apparche/screen/maps_screen.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Information"),
          backgroundColor: Colors.yellow.shade800,
          elevation: 2,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Vision(),
                        ));
                  },
                  child: Center(
                      child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.blue.shade300,
                        child: Center(
                          child: ListView(
                            children: [
                              Container(
                                height: 150,
                                child: Image.asset("asset/img/hhh.png"),
                              ),
                              Center(
                                child: Text(
                                  "Vision et Historique",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pastorale(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.white,
                        child: Center(
                          child: ListView(
                            children: [
                              Container(
                                height: 150,
                                child: Icon(
                                  Icons.person_outline_rounded,
                                  size: 150,
                                  color: Colors.yellow.shade800,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Corps Pastorale",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow.shade800),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsView(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.red.shade300,
                        child: Center(
                          child: ListView(
                            children: [
                              Container(
                                //local_fire_department_sharp
                                height: 150,
                                child: Icon(
                                  Icons.map_rounded,
                                  size: 150,
                                  color: Colors.white,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Retrouve-Nous",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
            ],
          ),
        ));
  }
}
