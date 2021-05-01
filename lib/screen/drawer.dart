import 'package:apparche/screen/contact.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 65,
        child: new ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
              color: Colors.yellow.shade800,
              child: Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: new Icon(Icons.person,
                          color: Colors.yellow.shade800, size: 30.0),
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
                          "Dolvabolokondi@gmail.com",
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
                    Icons.home,
                    color: Colors.yellow.shade800,
                  )),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //  context,
                // MaterialPageRoute(
                //builder: (context) => Programme(),
              },
              child: ListTile(
                  title: Text("Programme"),
                  leading: Icon(Icons.calendar_today_sharp,
                      color: Colors.yellow.shade800)),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //  context,
                // MaterialPageRoute(
                //builder: (context) => Programme(),
              },
              child: ListTile(
                  title: Text("Evénément"),
                  leading:
                      Icon(Icons.event_note, color: Colors.yellow.shade800)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Mes offrandes"),
                  leading:
                      Icon(Icons.dashboard, color: Colors.yellow.shade800)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Mon Compte"),
                  leading: Icon(Icons.favorite, color: Colors.yellow.shade800)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contact()));
              },
              child: ListTile(
                  title: Text("Contact"),
                  leading:
                      Icon(Icons.contact_phone, color: Colors.yellow.shade800)),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Parametre"),
                  leading: Icon(Icons.settings, color: Colors.blue)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Apropos"),
                  leading: Icon(Icons.help, color: Colors.green)),
            ),
          ],
        ));
  }
}
