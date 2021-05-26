import 'package:flutter/material.dart';

import 'package:apparche/models/bible_list.dart';

class VersetsScreen extends StatefulWidget {
  VersetsScreen({this.bibleListItem, this.chapter});

  final BibleListItem bibleListItem;
  final int chapter;

  @override
  _VersetsScreenState createState() => _VersetsScreenState();
}

class _VersetsScreenState extends State<VersetsScreen> {
  int _chapter;

  @override
  void initState() {
    super.initState();
    _chapter = widget.chapter;
  }

  void incrementChapter() {
    if (widget.bibleListItem.chapters.length  > _chapter+1){
      setState(() {
        _chapter++;
      });
    }
  }

  void decrementChapter() {  
    if (_chapter > 0){
      setState(() {
        _chapter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.fast_rewind_rounded),
          onPressed: decrementChapter,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.fast_forward_rounded),
            color: Colors.white,
            onPressed: incrementChapter,
          ),
        ],
        title: Column(
          children: [
            Text(widget.bibleListItem.name, style: TextStyle(fontSize: 14)),
            Text(
              'Chapitre ' +
                  (_chapter + 1).toString() +
                  '/' +
                  widget.bibleListItem.chapters.length.toString(),
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ],
        ),

        centerTitle: true,
        //backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/img/bg2.jpg'), fit: BoxFit.cover)),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          itemCount: widget.bibleListItem.chapters[_chapter].length,
          itemBuilder: (BuildContext context, int idx) {
            String versets = widget.bibleListItem.chapters[_chapter][idx];

            return Column(
              children: [
                InkWell(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: (idx + 1).toString() + '. ',  style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 17,
                              ),),
                        TextSpan(
                          text: versets,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                               fontSize: 16,
                              color: Colors.grey.shade100),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => {},
                ),
                widget.bibleListItem.chapters[_chapter].length != idx + 1
                    ? Divider(
                        height: 10,
                        color: Colors.white,
                      )
                    : Divider(height: 0)
              ],
            );
          },
        ),
      ),
    );
  }
}
