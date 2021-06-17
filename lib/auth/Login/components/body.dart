import 'package:flutter/material.dart';
import 'package:apparche/auth/Login/components/background.dart';
import 'package:apparche/auth/Login/components/or_divider.dart';
import 'package:apparche/auth/Login/components/social_icon.dart';
import 'package:apparche/auth/Signup/signup_screen.dart';
import 'package:apparche/auth/components/already_have_an_account_acheck.dart';
import 'package:apparche/auth/components/rounded_button.dart';
import 'package:apparche/auth/components/rounded_input_field.dart';
import 'package:apparche/auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apparche/services/authentication.dart';
import 'package:provider/provider.dart';

import 'package:loading_overlay/loading_overlay.dart';

Pattern emailPattern =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email = "";
  String _password = "";
  bool _obscureText = true;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  _saveForm(BuildContext context) async {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _loading = true;
    });

    try {
      await context
          .read<AuthenticationService>()
          .signIn(email: _email, password: _password);
    } catch (e) {
      print(e);
    }
    setState(() {
      _loading = false;
    });
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      child: Background(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icon/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Email",
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                  validator: (String value) {
                    RegExp regex = new RegExp(emailPattern);
                    if (!regex.hasMatch(value) || value == null)
                      return 'Entez une adresse email valide !';
                    else
                      return null;
                  },
                ),
                RoundedPasswordField(
                  obscureText: _obscureText,
                  toggleVisibility: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
                RoundedButton(
                  text: "Se Connecter",
                  press: () {
                    _saveForm(context);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
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
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icon/facebook.svg",
                      press: () {
                        context.read<AuthenticationService>().facebookSignIn();
                      },
                    ),
                    SocalIcon(
                      iconSrc: "assets/icon/google-plus.svg",
                      press: () {
                        context.read<AuthenticationService>().googleSignIn();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      isLoading: _loading,
    );
  }
}
