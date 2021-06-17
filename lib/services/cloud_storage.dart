import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:apparche/models/user.dart';
import 'package:apparche/services/firestore.dart';

class CloudStorageService {
  FirestoreService firestoreService = FirestoreService();
  FirebaseStorage storage = FirebaseStorage.instance;

  Future uploadImageToFirebase(UserData user, File _imageFile) async {
    String fileExtention = extension(_imageFile.path);

    Reference storageRef =
        storage.ref().child('uploads/${user.uid}/avatar/avatar$fileExtention');

    UploadTask uploadTask = storageRef.putFile(_imageFile);

    try {
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      await firestoreService.updateUser(uid: user.uid, data: {
        'imageUrl': downloadURL,
      });

      print("Done: $downloadURL");
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
