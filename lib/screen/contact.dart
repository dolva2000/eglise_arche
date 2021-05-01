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
        backgroundColor: Colors.yellow.shade800,
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Contatez Nous pour prendre Rendez-Vous avec le pasteur",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 90, right: 90),
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow.shade800)),
                  onPressed: () => launch("tel://+243817087305"),
                  icon: Icon(Icons.call),
                  label: Text(
                    "Appelez-Nous",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 90, right: 90),
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow.shade800)),
                  onPressed: () => launch("sms:+243817087305"),
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Envoyez-Nous Un SMS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 90, right: 90),
                child: TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow.shade800),
                  ),
                  onPressed: () => launch("mailto:dolvaboloko@gmail.com"),
                  icon: Icon(
                    Icons.mail,
                    color: Colors.red,
                  ),
                  label: Text(
                    " Envoyez-nous un mail",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 90, right: 90),
              ),
              Divider(color: Colors.white),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Nous Recevons chaque mardi à 12h00 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
