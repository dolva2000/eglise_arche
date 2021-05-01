import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class Vision extends StatefulWidget {
  @override
  _VisionState createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vision et Historique"),
          backgroundColor: Color(0xFF21BFBD),
          elevation: 11,

      ),
         body: Container(
          child: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onPageChanged: (int page, int total) {
          print('page change: $page/$total');
        },
          ).fromAsset('asset/pdf/Historique.pdf'),
           ),
        
    );
  }
}

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
          backgroundColor: Color(0xFF21BFBD),
          elevation: 11,

      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,

            children: [
              SizedBox(height: 12,),
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
                      height: 250,
                    width: double.infinity,
                        
                           decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                       boxShadow: [
                          BoxShadow(
                            color:Colors.black.withOpacity(0.3),
                            offset: Offset(1.0, 3.0),
                            blurRadius: 19.0
                          )
                       ],
                     ),
                        child: Padding(
                          
                          padding: const EdgeInsets.all(1.0),
                          
                            child: ListView(children: [
                              Row(
                                
                                children: [
                                  Container(
                                    height: 200,
                                      child: Image.asset("asset/img/pasteur.png") ,
                                  ),
                                  Column(
                                    children: [
                                      Text("Pasteur Bwango ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF21BFBD)),),
                                      Text("Pasteur titulare ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal,color: Colors.black),)
                                    ],
                                  ),
                                ],
                              ),
                             
                             

                           
                            ],),
                          ),
                        ),
              
                    
                   
                    ],
                  )
                  )
                  ),
            ],
        ),
      ),
      
    );
  }
}