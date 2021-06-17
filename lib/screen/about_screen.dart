import 'package:flutter/material.dart';
//import 'package:grouped_list/grouped_list.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Propos'),
        //backgroundColor: Colors.indigo,
      ),
      body: Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/bg2.jpg'), fit: BoxFit.cover)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 30),
            children: [
              Text(
                "A propos de l'application",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "L'application Arche Makala est conçue dans le but de vous permettre d'être informé en temps réel sur les differentes activités de l'église et d'être virtuellement connecté à l'evolution ou à la vie de l'église.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Version: 1.0.1",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade100,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Développeurs",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "L' application a été développé par l'entreprise Mbok'Art Concept, qui évolue dans le secteur du numerique pour apporter des solutions digitales dans vos organisations.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Copyright © 2021 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () => launch("https://mbokart-concept.net/"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.language,
                            size: 12,
                            color: Colors.amberAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mbok'Art Concept",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
