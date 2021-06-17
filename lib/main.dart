import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:apparche/screen/screenplash.dart';
import 'package:apparche/services/authentication.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';

// ...
FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: null,
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: PersistedAppState(
        storage: JsonFileStorage(initialData: {
          'video': '',
        }),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Arche Makala',
            color: Color(0xff123456),
            theme: ThemeData(
              primarySwatch: MaterialColor(
                0xff123456,
                <int, Color>{
                  50: Color(0xff123456),
                  100: Color(0xff123456),
                  200: Color(0xff123456),
                  300: Color(0xff123456),
                  400: Color(0xFF000000),
                  500: Color(0xff123456),
                  600: Color(0xFF000000),
                  700: Color(0xFF000000),
                  800: Color(0xFF000000),
                  900: Color(0xFF000000),
                },
              ),
              appBarTheme: Theme.of(context)
                  .appBarTheme
                  .copyWith(brightness: Brightness.light),
              fontFamily: 'Lato',
            ),
            home: Homepage()),
      ),
    );
  }
}
