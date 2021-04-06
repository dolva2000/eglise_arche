import 'package:flutter/material.dart';
import 'vision.dart';
class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("INFORMATION"),
          backgroundColor: Color(0xFF21BFBD),
          elevation: 11,
        ),
        body: Container(
          color: Color(0xff130502),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
             
                    InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Vision(),
                        ));
                  },
                  child: Center(
                      child: Column(
                    children: [
                       Container(
                        height: 200,
                    width: double.infinity,
                        color: Colors.white70,
                        child: Center(
                          child: ListView(children: [
                            Container(
                              height: 150,
                                child: Image.asset("asset/img/hhh.png") ,
                            ),
                            Center(
                              child:  Text("Vision et Historique", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.yellow),),
                            )
                           

                         
                          ],),
                        ),
                      )
                    
                   
                    ],
                  )
                  )
                  ),
                  
              InkWell(
             
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Pastorale(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Container(
                        height: 200,
                    width: double.infinity,
                        color: Colors.white,
                        child: Center(
                          child: ListView(children: [
                            Container(
                              height: 150,
                                child: Icon(Icons.person_rounded , size: 150,color: Colors.blue,) ,
                            ),
                            Center(
                              child:  Text("Corps pastorale", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),),
                            )
                           

                         
                          ],),
                        ),
                      )
                    ],
                  )
                  )
                  
                  ),
                  
              InkWell(
             
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Information(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Container(
                        height: 200,
                    width: double.infinity,
                        color: Colors.white70,
                        child: Center(
                          child: ListView(children: [
                            Container(
                              //local_fire_department_sharp
                              height: 150,
                                child: Icon(Icons.home_work_rounded,size: 150,color: Colors.white,) ,
                            ),
                            Center(
                              child:  Text("Retrouve-Nous", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.yellow),),
                            )
                           

                         
                          ],),
                        ),
                      )
                    ],
                  )
                  )
                  
                  ),
                  
            ],
          ),
        ));
  }
}

