import 'package:flutter/material.dart';

class Pastorale extends StatefulWidget {
  @override
  _PastoraleState createState() => _PastoraleState();
}

class _PastoraleState extends State<Pastorale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Corps Pastorale"),
        backgroundColor: Colors.indigo,
        elevation: 11,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 12,
            ),
            InkWell(
                onTap: () {},
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(1.0, 3.0),
                              blurRadius: 19.0)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 200,
                                  child: Image.asset("asset/img/pasteur.png"),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Pasteur Bwango ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF21BFBD)),
                                    ),
                                    Text(
                                      "Pasteur titulare ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
          ],
        ),
      ),
    );
  }
}
