import 'package:flutter/material.dart';
import 'package:apparche/screen//drawer.dart';

class Homek extends StatefulWidget {
  @override
  _HomekState createState() => _HomekState();
}

class _HomekState extends State<Homek> {
  @override
  Widget build(BuildContext context) {
    Color primarycolor = Color.fromRGBO(255, 82, 48, 1);
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Color(0xFF21BFBD),
          elevation: 0,
          title: Text(
            "Arche apps",
            style: TextStyle(fontSize: 33, color: Colors.white10),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
              onPressed: null,
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primarycolor,
                    border: Border.all(
                      color: primarycolor,
                    )),
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          iconSize: 36.0,
                          onPressed: null),
                      IconButton(
                          icon: Icon(Icons.person),
                          color: Colors.white,
                          iconSize: 36.0,
                          onPressed: null),
                    ],
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomPathClipper(),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: primarycolor,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('2000.00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 15.0),
                            Text('2000.00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Material(
                          elevation: 1.0,
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.blue[300],
                          child: MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: Text(
                              'Top up',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 370.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.home),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        color: Colors.purple,
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        color: Colors.red,
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'send',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        color: Colors.purple,
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'send',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        color: Colors.purple,
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'send',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        color: Colors.purple,
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'send',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.purple.withOpacity(0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        color: Colors.purple,
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'send',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Divider(),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  "lorem ipsum fjjfjjfjfkfjfdjdd",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                )),
                                Material(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.blueAccent.withOpacity(0.1),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                      ),
                                      onPressed: () {}),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                  child: Text("ffffff")),
              Padding(
                padding: EdgeInsets.only(left: 35.0, bottom: 25.0),
                child: Container(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 200, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
