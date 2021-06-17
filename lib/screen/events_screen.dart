import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key, this.url}) : super(key: key);
  final String url;
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://cef-arche-makala.vercel.app/',
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        //backgroundColor: Colors.indigo,
        title: const Text('Actualités'),
      ),
      appCacheEnabled: true,
      withZoom: true,
      withLocalStorage: true,
      withLocalUrl: true,
      scrollBar: false,
      hidden: true,
      initialChild: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img/undraw_online_articles_79ff.png")
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: const Icon(Icons.autorenew),
          onPressed: () {
            flutterWebViewPlugin.reload();
          },
        ),
      ),
    );
  }
}
