import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apparche/auth/Login/login_screen.dart';
import 'package:apparche/auth/Signup/signup_screen.dart';
import 'package:apparche/auth/Profil/profil_screen.dart';
import 'package:apparche/auth/Profil/edit_profile_screen.dart';
import 'package:apparche/auth/Welcome/components/background.dart';
import 'package:apparche/auth/components/rounded_button.dart';
import 'package:apparche/auth/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apparche/services/authentication.dart';
import 'package:provider/provider.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BIENVENU DANS ARCHE MAKALA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icon/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "CONNEXION",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "INSCRIPTION",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
