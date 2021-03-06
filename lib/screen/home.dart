import 'package:apparche/pages/settings.dart';
import 'package:apparche/quiz/home_quiz.dart';
import 'package:flutter/material.dart';
import 'package:apparche/information/information.dart';
import 'package:apparche/programme/programme.dart';
import 'package:apparche/youtube/home_screen.dart';
import 'package:apparche/screen/drawer.dart';
import 'package:apparche/screen/affermissement_screen.dart';
import 'package:apparche/screen/events_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

// ...
FirebaseMessaging messaging = FirebaseMessaging.instance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color generateRandomColor3() {
    Random random = Random();

    return Color.fromARGB(
        100, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          //backgroundColor: Colors.indigo,
          foregroundColor: Colors.white10,
          shadowColor: Colors.white10,
          elevation: 2,
          centerTitle: true,
          title: Text(
            "Arche Makala",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(240, 240, 253, 1),
                  image: DecorationImage(
                      image: AssetImage('assets/img/bg.jpg'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      //le button de home de notre application 1
                      Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        elevation: 2,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebViewPage(),
                                ),
                              );
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.article_rounded,
                                  color: Colors.blue,
                                  size: 70.0,
                                ),
                                Text(
                                  "Actualit??s",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ))),
                      ),
                      //la fin
                      //le button de home de notre application
                      Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        elevation: 2,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AffermissementScreen(),
                                  ));
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.yellow.shade800,
                                  size: 70.0,
                                ),
                                Text(
                                  "Affermissements",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.yellow.shade800,
                                  ),
                                )
                              ],
                            ))),
                      ),
                      //la fin
                      //le button de home de notre application
                      Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        elevation: 2,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.ondemand_video_rounded,
                                  color: Colors.red,
                                  size: 70.0,
                                ),
                                Text(
                                  "Videos",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ))),
                      ),
                      //la fin
                      //le button de home de notre application
                      Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        elevation: 2,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Programme(),
                                  ));
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.event_note_rounded,
                                  color: Colors.indigo,
                                  size: 70.0,
                                ),
                                Text(
                                  "Programmes",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.indigo,
                                  ),
                                )
                              ],
                            ))),
                      ),
                      //la fin
                      //le button de home de notre application
                      Card(
                        color: Color.fromARGB(240, 255, 255, 255),
                        elevation: 2,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.all(15.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeQuiz(),
                                  ));
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.question_answer_rounded,
                                  color: Color(0xff123456),
                                  size: 70.0,
                                ),
                                Text(
                                  "Quiz",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff123456),
                                  ),
                                )
                              ],
                            ))),
                      ),
                      //la fin
                      //le button de home de notre application
                      Card(
                          color: Color.fromARGB(240, 255, 255, 255),
                          elevation: 2,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8),
                          ),
                          margin: EdgeInsets.all(15.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Information(),
                                    ));
                              },
                              splashColor: Colors.green,
                              child: Center(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.info_rounded,
                                    color: Colors.green,
                                    size: 70.0,
                                  ),
                                  Text(
                                    "Informations",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              )))),

                      //la fin
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
