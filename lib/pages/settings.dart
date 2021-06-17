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
        decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/bg2.jpg'), fit: BoxFit.cover),
        ),
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
            buildAccountOptionRow(context, "Evaluer l'application", "", ""),
            buildAccountOptionRow(context, "Partager l'application", "", ""),
            Divider(
              color: Colors.white60,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.security,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Aide et Security ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: Colors.white60,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Politique de Confidentialité",
                "ne pas encore disponible", ""),
            buildAccountOptionRow(context, "Condition d'utilisation",
                "ne pas encore disponible", ""),
            buildAccountOptionRow(
                context, "Aide", "Veuillez contatez les administrateur", ""),
            buildAccountOptionRow(
                context, "Infos de l'application", "version", "1.0.1"),
            SizedBox(
              height: 50,  ),
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

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, String contenue, String contenue1) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(contenue),
                    Text(contenue1),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Fermer")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
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


