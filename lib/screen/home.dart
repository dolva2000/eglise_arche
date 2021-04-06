import 'package:apparche/information/information.dart';
import 'package:flutter/material.dart';
import 'package:apparche/screen//drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      drawer: Menu(),
      appBar: AppBar(
         backgroundColor: Color(0xFF21BFBD),
         elevation: 0,
         title: Text("Arche Apps", style:TextStyle(fontSize: 22,color: Colors.white), ),
        centerTitle: true,
      
         actions: [
           IconButton(icon: Icon(Icons.account_circle ,color:  Colors.white,size: 30,), onPressed:null, )
         ],
      
      ),
  
      body:  Stack(
         
          children: <Widget>[
          
            new Container(
                        
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage("asset/img/bg.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54,BlendMode.luminosity )
              )),
              child: Center(
              child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            //le button de home de notre application 1
            Card(
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(35),
              ),
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    
                    children: [
                     
                     Image.asset("asset/img/Actua.png",width: 80,height: 80,),
                     
                      Text(
                        "Actualite",
                        style: TextStyle(fontSize: 17.0),
                      )
                    ],
                  ))),
            ),
            //la fin
            //le button de home de notre application
            Card(
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(35),
              ),
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("asset/img/med.png",width: 80,height: 80,),
                      Text(
                        "Predication",
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],
                  ))),
            ),
            //la fin
            //le button de home de notre application
            Card(
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(35),
              ),
              margin: EdgeInsets.all(20),
              child: InkWell(
                  onTap: ()=> launch("https://www.youtube.com/channel/UC4iAUWw2dftIjJCZyzBYENQ",statusBarBrightness: Brightness.dark,enableDomStorage: true,universalLinksOnly: true ,forceWebView: true,forceSafariVC: true, headers: <String, String> {'header_key':'header_value'}),
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Image.asset("asset/img/video.png",width: 80,height: 80,),
                      Text(
                        "Videos",
                        style: TextStyle(fontSize: 17.0,color: Colors.red),
                      )
                    ],
                  ))),
            ),
            //la fin
            //le button de home de notre application
            Card(
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(35),
              ),
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Home(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.event_note,
                        size: 70,
                        color: Colors.red,
                      ),
                      Text(
                        "Programme",
                        style: TextStyle(fontSize: 15.0,color: Colors.red),
                      )
                    ],
                  ))),
            ),
            //la fin
            //le button de home de notre application
            Card(
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(35),
              ),
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("asset/img/par.png",width: 110,height: 70,),
                     
                      Text(
                        "Parametres",
                        style: TextStyle(fontSize: 17.0 ,color:Colors.lightBlue),
                      )
                    ],
                  ))),
            ),
            //la fin
            //le button de home de notre application
            Card(
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(35),
              ),
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Information(),
                        ));
                  },
                  splashColor: Colors.green,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 70,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        "Information",
                        style: TextStyle(fontSize: 17.0,color: Colors.lightBlue),
                      )
                    ],
                  )
                  )
                  )
                  ),
        
            //la fin
          ],
        ),
            )
            )
          ],
        )
    );
  }
}

