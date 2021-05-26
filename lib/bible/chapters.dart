import 'package:flutter/material.dart';

import 'package:apparche/models/bible_list.dart';
import 'package:apparche/bible/versets.dart';

class ChaptersScreen extends StatelessWidget {
  ChaptersScreen({this.bibleListItem});
  final BibleListItem bibleListItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bibleListItem.name),
        centerTitle: true,
        //backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/img/bg2.jpg'), fit: BoxFit.cover)),
        child: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 70,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: bibleListItem.chapters.length,
          itemBuilder: (BuildContext ctx, index) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                side: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VersetsScreen(
                    bibleListItem: bibleListItem,
                    chapter: index,
                  );
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (index + 1).toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'Chapitre',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
