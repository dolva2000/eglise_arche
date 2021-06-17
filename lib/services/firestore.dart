import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:apparche/models/user.dart';

class FirestoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Stream<DocumentSnapshot<Object>> getUserStream(User user) {
    return users.doc(user.uid).snapshots();
  }

  Future<UserData> getUserInfo(User user) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(user.uid).get();
      if (documentSnapshot.exists) {
        print('documentSnapshot: ${documentSnapshot.data()}');
        return UserData.fromJson(documentSnapshot.data());
      }
      return null;
    } catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  Future<void> addUser(
      {String uid,
      String phone,
      String phoneCode,
      String email,
      String username,
      String imageUrl}) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      if (!documentSnapshot.exists) {
        await users.doc(uid).set({
          "uid": uid,
          "email": email,
          "username": username,
          "phone": phone,
          "phoneCode": phoneCode,
          "createdAt": DateTime.now().toIso8601String(),
          "attribute": "A3",
          "imageUrl": imageUrl,
          "genre": "",
          "status": "",
        });
      }
      debugPrint("Signed up");
      return "Signed up";
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }

  Future<void> updateUser({
    String uid,
    Object data,
  }) async {
    try {
      await users.doc(uid).update(data);
      debugPrint("Signed up");
      return "Signed up";
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return e.message;
    }
  }
}
