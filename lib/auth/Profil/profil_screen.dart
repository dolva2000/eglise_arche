import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:apparche/auth/components/appbar_widget.dart';
import 'package:apparche/auth/components/button_widget.dart';
import 'package:apparche/auth/components/numbers_widget.dart';
import 'package:apparche/auth/components/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:apparche/auth/Profil/components/background.dart';
import 'package:apparche/auth/Profil/edit_profile_screen.dart';

import 'package:apparche/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:apparche/models/user.dart';
import 'package:apparche/services/authentication.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.firebaseUser});
  final User firebaseUser;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = widget.firebaseUser;

    Stream<DocumentSnapshot<Object>> userStream =
        firestoreService.getUserStream(firebaseUser);

    return SingleChildScrollView(
      child: Background(
        child: 
        StreamBuilder<DocumentSnapshot<Object>>(
          stream: userStream,
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Object>> snapshot) {
            if (snapshot.hasError) {
              return Container();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            UserData user = UserData.fromJson(snapshot.data.data());

            if (user == null) {
              return Container();
            }

            return new ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imageUrl ?? '',
                  onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen(user: firebaseUser)),
                    );
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                Center(
                  child: buildUpgradeButton(context),
                ),
                //const SizedBox(height: 24),
                //NumbersWidget(),
                const SizedBox(height: 48),
                Center(
                  child: buildAbout(user),
                ),
              ],
            );
          },
        ),
     
      ),
    );
  }

  Widget buildName(UserData user) => Column(
        children: [
          Text(
            user.username ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email ?? '',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton(BuildContext context) => ButtonWidget(
        text: 'Se déconnecter',
        onClicked: () {
          context.read<AuthenticationService>().signOut();
        },
      );

  Widget buildAbout(UserData user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.statut ?? '',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
