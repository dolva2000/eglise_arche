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
       backgroundColor: Color(0xFF21BFBD),
       title: Text("Contact"),
      ),
      body: new Center(
             child: Container(
               child: ListView(
               children: [



                  Padding(padding: const EdgeInsets.only(top: 10),
                  child: Text("Contatez Nous pour prendre Rendez-Vous avec le pasteur",textAlign: TextAlign.center, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22,
                  
                  ),),
                  ),
                  Divider(color:Color(0xFF21BFBD) ,),
                   Padding(padding: const EdgeInsets.only(top: 30, left: 90, right: 90),
                   child:  TextButton.icon(
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(Color(0xFF21BFBD))
                     ),
                     onPressed: ()=> launch("tel://+243817087305"),
                      icon: Icon(Icons.call), label: Text("Appelez-Nous",
                       style: TextStyle(fontSize: 12,color: Colors.white),)
                        ,),
                        
                   
                   ),SizedBox(height: 5),

                    Padding(padding: const EdgeInsets.only(top: 30, left: 90, right: 90),
                   child:  FlatButton.icon(
                     onPressed: ()=> launch("sms:+243817087305"),
                      icon: Icon(Icons.call), label: Text("Envoyez-nous un Sms",
                       style: TextStyle(fontSize: 12,color: Colors.white),)
                        ,color: Color(0xFF21BFBD)),
                        
                   
                   ),SizedBox(height: 5),
                  
                   Padding(padding: const EdgeInsets.only(top: 20,left: 90, right: 90),
                   child:  FlatButton.icon(onPressed: ()=> launch("mailto:dolvaboloko@gmail.com"),
                    icon: Icon(Icons.sms),
                     label: Text("Envoyez-nous un mail", style: TextStyle(fontSize: 12,color: Colors.white),), 
                     color: Color(0xFF21BFBD)),
                   
                   ),SizedBox(height: 6),
                   Padding(padding: const EdgeInsets.only(top: 20, left: 90, right: 90),
                   child:   FlatButton.icon(onPressed: ()=> launch("http://facebook.com"),
                   
                    icon: Icon(Icons.phone_forwarded),
                    label: Text("FACEBOOK", style: TextStyle(fontSize: 16 , color: Colors.white, fontWeight: FontWeight.bold),),
                   color: Color(0xFF21BFBD),),

                   
                   
                   
                   ),Divider(color: Color(0xFF21BFBD)),
                   Padding(padding: const EdgeInsets.only(top: 10),
                  child: Text("Nous Recevons chaque mardi à 12h00 ",textAlign: TextAlign.center, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16,
                  ),),
                  ),
               ],

               
                
               ),
             ),
      ),
    );
  }
}




