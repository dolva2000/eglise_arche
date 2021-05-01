import 'package:apparche/information/information.dart';
import 'package:apparche/programme/programme.dart';
import 'package:apparche/youtube/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:apparche/screen/drawer.dart';
import 'package:apparche/screen/affermissement_screen.dart';
import 'package:apparche/screen/settings_screen.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:math';

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
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade800,
          elevation: 2,
          title: Text(
            "Accueil",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(240, 240, 253, 1),
                  image: DecorationImage(
                      image: AssetImage('asset/img/bg.jpg'),
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
                                  "Actualite",
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
                                    builder: (context) => AffermissementScreen(),
                                  ));
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.blue,
                                  size: 70.0,
                                ),
                                Text(
                                  "Affermissement",
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
                                  color: Colors.red,
                                  size: 70.0,
                                ),
                                Text(
                                  "Programme",
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
                                    builder: (context) => SettingsScreen(),
                                  ));
                            },
                            splashColor: Colors.green,
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.settings_rounded,
                                  color: Colors.yellow.shade800,
                                  size: 70.0,
                                ),
                                Text(
                                  "Parametres",
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
                                    color: Colors.yellow.shade800,
                                    size: 70.0,
                                  ),
                                  Text(
                                    "Information",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.yellow.shade800,
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

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key, this.url}) : super(key: key);
  final String url;
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://anaima.vercel.app/',
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: const Text('Actualite'),
      ),
      appCacheEnabled: true,
      withZoom: true,
      withLocalStorage: true,
      withLocalUrl: true,
      scrollBar: false,
      hidden: true,
      initialChild: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/img/undraw_online_articles_79ff.png")
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: const Icon(Icons.autorenew),
          onPressed: () {
            flutterWebViewPlugin.reload();
          },
        ),
      ),
    );
  }
}
