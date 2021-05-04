import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:apparche/programme/nothifaction.dart';


class Programme extends StatefulWidget {
   String payload;

  Programme({
    @required this.payload,
  });
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  @override
  void initState() {
    super.initState();
    
    
  }
  @override
  int _current = 0;
  final list = [
    "QUAND TU T' ABSENTES AU CULTE , NE PENSES PAS QUE CELA AFFECTE LE PASTEUR . NON . C'EST PAR CONTRE TOI QUI EST AFFECTÉ ET A RATÉ UNE OCCASION D'ÊTRE VISITÉ PAR LE SAINT-ESPRIT. ",
    "LORSQUE TU REFUSES DE SERVIR SELON LA GRACE QUE TU AS , DIEU TE  REMPLACE SUR LE CHAMPS PAR QUELQU'UN D'AUTRE POUR QUE TU NE TE CONSIDÈRES PAS COMME IRREMPLAÇABLE OU INDISPENSABLE. ",
    "LORSQUE TU REFUSES DÉLIBÉRÉMENT DE SOUTENIR LES PROJETS DE L'ÉGLISE , DIEU SUSCITE D'AUTRES MEILEURS ET SERIEUX DONNATEURS . ",
    "DÈS QUE TU COMMENCES A COMBATTRE TON ÉGLISE OU TON PASTEUR , DIEU TE CONSIDÈRE COMME SON ENNEMI A LUI.",
    "LORSQUE TU QUITTES TON ÉGLISE OU TON PASTEUR , DIEU ENVOIE D'AUTRES PLUS SERIEUX QUE TOI . ",
    "LORSQUE TU REFUSES DE PRELEVER TES DIMES , DE  DONNER TES OFFRANDES ET TOUTES SORTES DE DONS ET ACTIONS DE GRACES , SACHE QUE LA GRÂCE DE TON EGLISE ET DE TON PASTEUR CESSE DE COULER SUR TOI ET DE FONCTIONNER EN TA FAVEUR . ",
    "SI TU TE METS A PARLER  EN MAL DE TON EGLISE ET DE TON PASTEUR , TU APPELLES LA MALÉDICTION SUR TA VIE ET SUR TOUT CE QUI T'APPARTIENT . PARCE QUE TU ES DEVENU REBELLE ET DELOYAL. ",
    "TON PASTEUR A UN APPEL OU UNE VOCATION DE LA PART DE DIEU. IL A ÉTÉ MANDATÉ POUR EXERCER CE MINISTERE . SACHE QU'AVEC TOI OU SANS TOI L'ŒUVRE AVANCERA . ALORS CONSIDÈRE TA PRESENCE DANS L'ÉGLISE ET SOUS LE LEADERSHIP DE TON PASTEUR COMME UN PRIVILÈGE.",
    "CEUX QUI COMBATTENT L'ÉGLISE OU LE PASTEUR  FINISSENT TOUJOURS MAL A MOINS QU'ILS S'AMANDENT. ",
    "TON PASTEUR EST AUSSI UNE AME QUI EST AU SERVICE DE SON MAITRE ET QUI ATTEND LA RÉCOMPENSE DE LA PART DE SON MAITRE. ",
  ];

  CarouselOptions carouselSlider;
  List imglist = [
    "asset/img/mardi.jpg",
    "asset/img/jeudi.jpg",
    "asset/img/dimanche.jpg"
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programmes'),
        backgroundColor: Colors.yellow.shade800,
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: Color.fromRGBO(240, 240, 253, 1),
            image: DecorationImage(
                image: AssetImage('asset/img/bg2.jpg'), fit: BoxFit.cover)),
        child: ListView.builder(
            itemCount: list.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
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
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Image.asset(
                                imgAsset,
                                height: 550,
                                fit: BoxFit.contain,
                              ),
                            );
                          });
                        }).toList()),
                    ListTile(
                      title: Text(
                        "PAROLES D'ENCOURAGEMENT POUR VOUS FAMILLE ROYALE :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "VOICI CE QUE LES CHRETIENS OU MEMBRES DE L'ÉGLISE LOCALE DOIVENT COMPRENDRE ABSOLUMENT \n",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              } else {
                return ListTile(
                  autofocus: true,
                  title: Text(
                    index.toString() + ".   " + list[index - 1],
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                );
              }
            }),
      ),
    );
  }
}

// Sermont ou predicatons


 