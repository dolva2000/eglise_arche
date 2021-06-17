import 'package:apparche/pages/settings.dart';
import 'package:apparche/screen/offrande.dart';
import 'package:flutter/material.dart';
import 'package:apparche/youtube/home_screen.dart';
import 'package:apparche/screen/contact.dart';
import 'package:apparche/screen/about_screen.dart';
import 'package:apparche/screen/events_screen.dart';
import 'package:apparche/screen/account_screen.dart';
import 'package:apparche/auth/Welcome/welcome_screen.dart';
import 'package:apparche/information/information.dart';
import 'package:apparche/programme/programme.dart';
//import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

import 'login_signup.dart';
import 'edit_profile.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarManager.setColor(Colors.indigo);
    return Drawer(
        elevation: 65,
        child: Container(
          color: Color(0xff123456),
          child: new ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Information()));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff123456),
                        backgroundImage: AssetImage("assets/img/hhh.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Arche Makala",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                            height: 5,
                          ),
                          Text(
                            "C.E.F Arche De L' Alliance Makala",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white60,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Programme()));
                },
                child: ListTile(
                    title: Text(
                      "Programme",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.calendar_today_sharp,
                      color: Colors.white70,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WebViewPage()));
                },
                child: ListTile(
                    title: Text(
                      "Evénément",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.event_note,
                      color: Colors.white70,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: ListTile(
                    title: Text(
                      "Videos",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.ondemand_video_rounded,
                      color: Colors.white70,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Offrande()));
                },
                child: ListTile(
                    title: Text(
                      "Mes offrandes",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.money_outlined,
                      color: Colors.white70,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: ListTile(
                    title: Text(
                      "Mon Compte",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white70,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contact()));
                },
                child: ListTile(
                    title: Text(
                      "Contact",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.contact_phone_outlined,
                      color: Colors.white70,
                    )),
              ),
              Divider(
                color: Colors.white60,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                child: ListTile(
                    title: Text(
                      "Paramètre",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white70,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutView()));
                },
                child: ListTile(
                    title: Text(
                      "A propos",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.white70,
                    )),
              ),
            ],
          ),
        ));
  }
}
