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
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
          title: TabBar(
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
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("Leçon 1: La Salut"),
              leading: Icon(
                Icons.event_note,
                color: Colors.indigo,
              )),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("Leçon 2: La Croissance dans la foi"),
              leading: Icon(Icons.event_note, color: Colors.indigo)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("Leçon 3: L'assurance du salut"),
              leading: Icon(Icons.event_note, color: Colors.indigo)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("Leçon 4: Le Saint-esprit"),
              leading: Icon(Icons.event_note, color: Colors.indigo)),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
              title: Text("Leçon 5: L'heritage du salut"),
              leading: Icon(Icons.event_note, color: Colors.indigo)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("Leçon 6: La Foi"),
              leading: Icon(Icons.event_note, color: Colors.indigo)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("Leçon 7: Meditation"),
              leading: Icon(
                Icons.event_note,
                color: Colors.indigo,
              )),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromAsset(
                          pdfAssetPath: 'asset/pdf/AFFERMISSEMENTS.pdf',
                        )));
          },
          child: ListTile(
              title: Text("leçon 8: Les Cieux"),
              leading: Icon(
                Icons.event_note,
                color: Colors.indigo,
              )),
        ),
      ],
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
