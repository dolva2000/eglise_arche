import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show File, Platform;
import 'package:share_plus/share_plus.dart';

String text = 'partagez les liens de l application';
String subject = '';
List<String> imagePaths = [];

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('launch_background');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramétres"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            InkWell(
              onTap: text.isEmpty ? null : () => _onShare(context),
              child: ListTile(
                  title: Text("Partager l'application",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: Icon(
                    Icons.share,
                    color: Colors.indigo,
                  )),
            ),
            Divider(
              height: 15,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
               onTap: (){},
              child: ListTile(
                  title: Text("Evaluer l'application",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.indigo,
                  )),
            ),
            Divider(
              height: 15,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                  title: Text("Securite",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  leading: Icon(
                    Icons.security,
                    color: Colors.indigo,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }
}
