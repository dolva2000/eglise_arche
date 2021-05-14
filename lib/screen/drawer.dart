import 'package:flutter/material.dart';
import 'package:apparche/screen/contact.dart';
import 'package:apparche/screen/about_screen.dart';
import 'package:apparche/screen/settings_screen.dart';
import 'package:apparche/screen/events_screen.dart';
import 'package:apparche/screen/account_screen.dart';
import 'package:apparche/programme/programme.dart';
//import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

import 'login_signup.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarManager.setColor(Colors.indigo);
    return Drawer(
        elevation: 65,
        child: new ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
              color: Colors.indigo,
              child: Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: new Icon(Icons.person,
                          color: Colors.indigo, size: 30.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dolva",
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
                          "dolvabolokondi@gmail.com",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Page D'acceuil"),
                  leading: Icon(
                    Icons.home_outlined,
                    color: Colors.indigo,
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Programme()));
              },
              child: ListTile(
                  title: Text("Programme"),
                  leading:
                      Icon(Icons.calendar_today_sharp, color: Colors.indigo)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WebViewPage()));
              },
              child: ListTile(
                  title: Text("Evénément"),
                  leading: Icon(Icons.event_note, color: Colors.indigo)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Mes offrandes"),
                  leading: Icon(Icons.money_outlined, color: Colors.indigo)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginSignupScreen()));
              },
              child: ListTile(
                  title: Text("Mon Compte"),
                  leading: Icon(Icons.account_circle_outlined,
                      color: Colors.indigo)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contact()));
              },
              child: ListTile(
                  title: Text("Contact"),
                  leading:
                      Icon(Icons.contact_phone_outlined, color: Colors.indigo)),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting()));
              },
              child: ListTile(
                  title: Text("Paramètre"),
                  leading: Icon(Icons.settings, color: Colors.blue)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutView()));
              },
              child: ListTile(
                  title: Text("A propos"),
                  leading: Icon(Icons.info_outline, color: Colors.green)),
            ),
          ],
        ));
  }
}
