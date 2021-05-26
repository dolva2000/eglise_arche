import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:apparche/screen/screenplash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:state_persistence/state_persistence.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';

// ...
FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your a

  @override
  Widget build(BuildContext context) {
    return PersistedAppState(
      storage: JsonFileStorage(initialData: {
        'video': '',
      }),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Arche Makala',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            fontFamily: 'Lato',
          ),
          home: Homepage()),
    );
  }
}
