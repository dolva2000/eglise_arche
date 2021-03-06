import 'dart:async';

import 'package:apparche/programme/programme.dart';
import 'package:apparche/screen/home.dart';
import 'package:apparche/youtube/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlerteNothification extends StatefulWidget {
  @override
  _AlerteNothificationState createState() => _AlerteNothificationState();
}

class _AlerteNothificationState extends State<AlerteNothification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Programme();
    }));
  }

  bool exe = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert !'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Veuillez activer les notifications'),
            Text('Pour être alerté de nos differents programmes'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Accepter'),
          onPressed: () async {
            await flutterLocalNotificationsPlugin.periodicallyShow(
              0,
              'Arche Makala: Nos Culte mardi et jeudi 16h',
              "et dimanche 6h A 9h & 9h A 13h ",
              RepeatInterval.daily,
              const NotificationDetails(
                  android: AndroidNotificationDetails('your channel id',
                      'your channel name', 'your channel description',
                      priority: Priority.max, fullScreenIntent: true)),
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
              ModalRoute.withName('/'),
            );
          },
        ),
      ],
    );
  }
}
