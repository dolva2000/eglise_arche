import 'package:apparche/screen/contact.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text("Dolva"),
          accountEmail: Text(
            "Dolvabolokondi@gmail.com",
          ),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: new Icon(Icons.person, color: Color(0xFF21BFBD)),
            ),
          ),
          decoration: new BoxDecoration(color: Color(0xFF21BFBD)),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              title: Text("Page D'acceuil"),
              leading: Icon(
                Icons.home,
                color: Color(0xFF21BFBD),
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
              leading: Icon(Icons.calendar_today_sharp, color: Color(0xFF21BFBD))),
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
              leading: Icon(Icons.event_note , color: Color(0xFF21BFBD))),
        ),
       
        InkWell(
          onTap: () {},
          child: ListTile(
              title: Text("Mes offrandes"),
              leading: Icon(Icons.dashboard, color:Color(0xFF21BFBD))),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              title: Text("Mon Compte"),
              leading: Icon(Icons.favorite, color: Color(0xFF21BFBD))),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
               context,
               MaterialPageRoute(
                  builder: (context) => Contact()
                
               ));},
          child: ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.contact_phone , color: Color(0xFF21BFBD))),
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
