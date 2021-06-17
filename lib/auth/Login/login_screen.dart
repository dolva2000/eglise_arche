import 'package:flutter/material.dart';
import 'package:apparche/auth/Login/components/body.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigo,
        title: Text('Connexion'),
      ),
      body: Body(),
    );
  }
}
