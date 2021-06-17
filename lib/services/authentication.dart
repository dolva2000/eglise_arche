import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:apparche/services/firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  final FirestoreService firestoreService = FirestoreService();

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      FacebookLogin facebookLogin = FacebookLogin();
      await googleSignIn.signOut();
      await facebookLogin.logOut();
      await _firebaseAuth.signOut();
      debugPrint('signOut');
    } catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint("Signed in");
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signUp(
      {String email, String password, String phone, String phoneCode, String username}) async {
    try {
      final UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await firestoreService.addUser(
          uid: credential.user.uid,
          username: username,
          email: email,
          phone: phone,
          phoneCode: phoneCode,
          imageUrl: credential.user.photoURL);

      debugPrint("Signed up");
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }

  Future googleSignIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        await firestoreService.addUser(
            uid: userCredential.user.uid,
            username: userCredential.user.displayName,
            email: userCredential.user.email,
            phone: "",
            phoneCode: "",
            imageUrl: userCredential.user.photoURL);

        debugPrint("Signed up");
        return "Signed up";
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }

  Future facebookSignIn() async {
    try {
      FacebookLogin facebookLogin = FacebookLogin();
      final FacebookLoginResult result = await facebookLogin.logIn(['email']);

      if (result.status == FacebookLoginStatus.loggedIn) {
        final FacebookAccessToken accessToken = result.accessToken;
        AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        await firestoreService.addUser(
            uid: userCredential.user.uid,
            username: userCredential.user.displayName,
            email: userCredential.user.email,
            phone: "",
            phoneCode: "",
            imageUrl: userCredential.user.photoURL);

        debugPrint("Signed up");
        return "Signed up";
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }
}
