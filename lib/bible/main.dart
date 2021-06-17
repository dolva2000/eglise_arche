import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:apparche/bible/chapters.dart';

import 'package:apparche/models/bible_list.dart';

class BibleView extends StatefulWidget {
  BibleView({Key key}) : super(key: key);

  @override
  _BibleViewState createState() => _BibleViewState();
}

class _BibleViewState extends State<BibleView> {
  BibleList _bibleList;

  loadJson() async {
    String data = await rootBundle.loadString('assets/json/bible_data.json');

    setState(() {
      //_data = json.decode(data).map((x) => BibleListItem.fromJson(x));
      _bibleList = bibleListFromJson(data);
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF1F4061),
          title: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.amberAccent,
            tabs: [
              Tab(
                child: Text("Ancien Testament",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )),
              ),
              Tab(
                child: Text("Nouveau Testament",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
        body: _bibleList != null
            ? TabBarView(
                children: [
                  ChaptersList(bibleList: _bibleList, index: 0),
                  ChaptersList(bibleList: _bibleList, index: 1),
                ],
              )
            : Container(),
      ),
    );
  }
}

class ChaptersList extends StatelessWidget {
  ChaptersList({this.bibleList, this.index});
  final BibleList bibleList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/bg2.jpg'), fit: BoxFit.cover),
      ),
      child: ListView.builder(
        itemCount: index == 0
            ? bibleList.data.sublist(0, 39).length
            : bibleList.data.sublist(39).length,
        itemBuilder: (BuildContext context, int idx) {
          BibleListItem bibleListItem = index == 0
              ? bibleList.data.sublist(0, 39)[idx]
              : bibleList.data.sublist(39)[idx];

          return Column(
            children: [
              InkWell(
                child: ListTile(
                  trailing: Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    bibleListItem.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChaptersScreen(bibleListItem: bibleListItem);
                    }));
                  },
                ),
              ),
              Divider(
                height: 0,
                color: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
