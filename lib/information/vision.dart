import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apparche/galleryimg/home_page.dart';

class Vision extends StatefulWidget {
  @override
  _VisionState createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  CarouselOptions carouselSlider;
  List imglist = [
    "asset/img/mardi.jpg",
    "asset/img/jeudi.jpg",
    "asset/img/dimanche.jpg"
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vision et Historique"),
          //backgroundColor: Colors.indigo,
          elevation: 11,
        ),
        body: Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/bg2.jpg'), fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            children: [
             
              Text(
                "HISTORIQUE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "L'eglise Arche de l’alliance Makala fait partie de la communauté des assemblées de Dieu (AD) et, c’est l'une des extensions de l'eglise Arche de l'alliance Masina (Centrale) qui appartient à la grande famille Laborne ; Conduit par Dieu au travers de son serviteur le Pasteur BWANGO TABA Miracle.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey.shade100),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "L'Arche de l’alliance Makala a commencé ses cultes le 01 Avril 2007 à l’immeuble Vodacom dans la commune de Makala ; après un moment passé à chercher un endroit pour son emplacement qu'il a plu au Seigneur de nous conduire à Makala où Dieu nous permis de voir sa gloire et de bâtir son œuvre pour le progrès Ngaba et Makala, d’où nous parlons depuis lors de « Arche de l'alliance Makala notre REHOBOTH ».",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey.shade100),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Après 5 ans à fonctionner à l’immeuble Vodacom que Dieu par sa grâce nous a permis d’avoir un endroit propre à l’église (une parcelle) ; où du premier vu n’avait rien pour attirer mais c’est là que l’œuvre de Dieu fut bâtie : .... C’est ce que Dieu a fait avec son église, son peuple de Ngaba et Makala.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey.shade100),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Aujourd’hui encore, après 14 années de fonctionnement sans arrêt, Dieu nous a mis au large et nous fait prospérer à Ngaba et Makala en faisant de nous une église de référence dans le lieu où il nous placé... QUE DIEU BÉNISSE ENCORE DAVANTAGE SON ŒUVRE.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey.shade100),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "VISION",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Là où Dieu marcher avec un peuple, il leur donne une vision qui fera l’objet de leur alliance avec lui et la nôtre à l’Arche de l’alliance Makala c'est : « UNE EGLISE EN BONNE SANTE SPIRITUELLE QUI INFLUENCE SON MILIEU. »",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey.shade100),
              ),
             
               CarouselSlider(
                  options: carouselSlider = CarouselOptions(
                      height: MediaQuery.of(context).size.height - 480,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlayInterval: Duration(
                        seconds: 4,
                      ),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                      // autoPlay: false,
                      ),
                  items: imglist.map((imgAsset) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width + 88,
                        height: MediaQuery.of(context).size.height + 88,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.asset(
                          imgAsset,
                          height: 550,
                          fit: BoxFit.contain,
                        ),
                      );
                    });
                  }).toList()),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Gallery(),
                        ));
                  },
                  child: Text(
                    "Voir plus des photos",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  )),
            ],
          ),
        ));
  }
}
