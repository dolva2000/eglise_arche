import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo,
        title: Text("Contact"),
      ),
      body: new Center(
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("asset/img/bg.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.luminosity))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Souhaitez-vous contacter le CEF ARCHE DE L'ALLIANCE MAKALA ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          side: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () => launch("tel://+243821805785"),
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Par Appel",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          side: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () => launch("sms:+243821805785"),
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Par SMS",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 30),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          side: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () => launch("mailto:archemakala@gmail.com"),
                        icon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Par Mail",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 90, right: 90),
              ),
              Divider(color: Colors.white),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Nous sommes toujours disponibles pour répondre à tout type de préocupations.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
