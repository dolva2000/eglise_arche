import 'package:flutter/material.dart';
import 'package:apparche/auth/Welcome/components/body.dart';
import 'package:apparche/services/firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apparche/auth/Login/login_screen.dart';
import 'package:apparche/auth/Signup/signup_screen.dart';
import 'package:apparche/auth/Profil/edit_profile_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return EditProfileScreen(user: firebaseUser);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Compte'),
      ),
      body: Body(),
    );
  }
}
