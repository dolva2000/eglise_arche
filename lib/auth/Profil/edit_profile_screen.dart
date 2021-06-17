import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:apparche/auth/components/appbar_widget.dart';
import 'package:apparche/auth/Profil/components/body.dart';
import 'package:apparche/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apparche/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:apparche/services/authentication.dart';

import 'package:loading_overlay/loading_overlay.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({this.user});
  final User user;

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot<Object>> userStream =
        firestoreService.getUserStream(widget.user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () => context.read<AuthenticationService>().signOut(),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot<Object>>(
        stream: userStream,
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Object>> snapshot) {
          if (snapshot.hasError) {
              Navigator.pop(context);
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingOverlay(
              child: Container(),
              isLoading: snapshot.connectionState == ConnectionState.waiting,
            );
          }

          UserData user = UserData.fromJson(snapshot.data.data());

          if (user == null) {
            Navigator.pop(context);
          }

          return Body(user: user);
        },
      ),
    );
  }
}
