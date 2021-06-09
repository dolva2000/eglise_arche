import 'package:apparche/galleryimg/home_page.dart';
import 'package:flutter/material.dart';
import 'vision.dart';
import 'pastoral.dart';
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
          title: new Text("Informations"),
          //backgroundColor: Colors.indigo,
          elevation: 2,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.5),
                  child: Stack(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          color: Color.fromRGBO(240, 240, 253, 1),
                          image: DecorationImage(
                            image: AssetImage('asset/img/pastor.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Gallery(),
                                ));
                          },
                          child: Container(
                            color: Color.fromARGB(200, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 60,
                                    child: Icon(
                                      Icons.person_outline_rounded,
                                      size: 60,
                                      color: Colors.green.shade200,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Corps Pastorale",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade200),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.5),
                  child: Stack(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          color: Color.fromRGBO(240, 240, 253, 1),
                          image: DecorationImage(
                            image: AssetImage('asset/img/church-vision.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Vision(),
                                ));
                          },
                          child: Container(
                            color: Color.fromARGB(200, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 60,
                                    child: Image.asset("asset/img/hhh.png"),
                                  ),
                                ),
                                Center(
                                  child: Text("Vision et Historique",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          color: Color.fromRGBO(240, 240, 253, 1),
                          image: DecorationImage(
                            image: AssetImage('asset/img/find-us.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapsView(),
                                ));
                          },
                          child: Container(
                            color: Color.fromARGB(200, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 60,
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 60,
                                      color: Colors.red.shade200,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Retrouvez-Nous",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade200),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
