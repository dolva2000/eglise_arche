import 'package:apparche/information/information.dart';
import 'package:apparche/programme/programme.dart';
import 'package:apparche/screen/essaie.dart';
import 'package:apparche/youtube/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:apparche/screen//drawer.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// ...
FirebaseMessaging messaging = FirebaseMessaging.instance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Color(0xFF21BFBD),
          elevation: 2,
          title: Text(
            "Arche Apps",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Color.fromRGBO(240, 240, 253, 1),
              ),
              child: Center(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    //le button de home de notre application 1
                    Card(
                      elevation: 10,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35),
                      ),
                      margin: EdgeInsets.all(20.0),
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
                              Image.asset(
                                "asset/img/Actua.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                "Actualite",
                                style: TextStyle(fontSize: 17.0),
                              )
                            ],
                          ))),
                    ),
                    //la fin
                    //le button de home de notre application
                    Card(
                      elevation: 10,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35),
                      ),
                      margin: EdgeInsets.all(20.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homek(),
                                ));
                          },
                          splashColor: Colors.green,
                          child: Center(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "asset/img/med.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                "Affermissement",
                                style: TextStyle(fontSize: 16.0),
                              )
                            ],
                          ))),
                    ),
                    //la fin
                    //le button de home de notre application
                    Card(
                      elevation: 10,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35),
                      ),
                      margin: EdgeInsets.all(20),
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
                              Image.asset(
                                "asset/img/video.png",
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                "Videos",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.red),
                              )
                            ],
                          ))),
                    ),
                    //la fin
                    //le button de home de notre application
                    Card(
                      elevation: 10,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35),
                      ),
                      margin: EdgeInsets.all(20.0),
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
                                Icons.event_note,
                                size: 70,
                                color: Colors.red,
                              ),
                              Text(
                                "Programme",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.red),
                              )
                            ],
                          ))),
                    ),
                    //la fin
                    //le button de home de notre application
                    Card(
                      elevation: 10,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35),
                      ),
                      margin: EdgeInsets.all(20.0),
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
                              Image.asset(
                                "asset/img/par.png",
                                width: 110,
                                height: 70,
                              ),
                              Text(
                                "Parametres",
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.lightBlue),
                              )
                            ],
                          ))),
                    ),
                    //la fin
                    //le button de home de notre application
                    Card(
                        elevation: 10,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(35),
                        ),
                        margin: EdgeInsets.all(20.0),
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
                                  Icons.info_outline,
                                  size: 70,
                                  color: Colors.lightBlue,
                                ),
                                Text(
                                  "Information",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.lightBlue),
                                )
                              ],
                            )))),

                    //la fin
                  ],
                ),
              ),
            ),
            SizedBox(height: 250),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, top: 600, right: 0, bottom: 0),
              child: Container(
                width: 800,
               
                child: Material(
                  
                  elevation: 5.0,
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(17),topStart: Radius.circular(17)),
                  color: Color(0xFF21BFBD),
                  child: MaterialButton(
                      height: 211,
                    onPressed: () {},
                    child: Text(
                      'News Arche',
                      style: TextStyle(fontSize: 16.0),
                    ),
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
        title: const Text('Actualite'),
      ),
      withZoom: true,
      withLocalStorage: true,
      withLocalUrl: true,
      scrollBar: false,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 250),
              Center(
                child: Image.asset("asset/img/undraw_online_articles_79ff.png"),
              )
            ],
          ),
        ),
      ),
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
