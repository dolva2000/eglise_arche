import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:apparche/bible/main.dart';

class AffermissementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: TabBar(
            indicatorColor: Colors.amberAccent,
            tabs: [
              Tab(
                child: Text("Affermissement"),
              ),
              Tab(
                child: Text("Bible"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Affermissement(),
            BibleView(),
          ],
        ),
      ),
    );
  }
}

class Affermissement extends StatefulWidget {
  @override
  _AffermissementState createState() => _AffermissementState();
}

class _AffermissementState extends State<Affermissement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/bg2.jpg'), fit: BoxFit.cover),
      ),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "1: La Salut",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(
                  Icons.menu_book_rounded,
                  color: Colors.white,
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "2: La Croissance dans la foi",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.menu_book_rounded, color: Colors.white)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "3: L'assurance du salut",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.menu_book_rounded, color: Colors.white)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "4: Le Saint-esprit",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.menu_book_rounded, color: Colors.white)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "5: L'heritage du salut",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.menu_book_rounded, color: Colors.white)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "6: La Foi",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.menu_book_rounded, color: Colors.white)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "7: Meditation",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(
                  Icons.menu_book_rounded,
                  color: Colors.white,
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) => PDFViewerFromAsset(
                            pdfAssetPath: 'assets/pdf/AFFERMISSEMENTS.pdf',
                          )));
            },
            child: ListTile(
                title: Text(
                  "8: Les Cieux",
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(
                  Icons.menu_book_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}

class PDFViewerFromAsset extends StatelessWidget {
  PDFViewerFromAsset({Key key, @required this.pdfAssetPath}) : super(key: key);
  final String pdfAssetPath;
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leçon'),
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onPageChanged: (int current, int total) =>
            _pageCountController.add('${current + 1} - $total'),
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          final int currentPage = await pdfViewController.getCurrentPage();
          final int pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
      ).fromAsset(
        pdfAssetPath,
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
