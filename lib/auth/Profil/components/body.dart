import 'package:flutter/material.dart';
import 'package:apparche/auth/Profil/components/background.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';

import 'package:apparche/services/cloud_storage.dart';

import 'package:apparche/auth/components/button_widget.dart';
import 'package:apparche/auth/components/profile_widget.dart';
import 'package:apparche/auth/components/textfield_widget.dart';
import 'package:apparche/auth/components/textfield_widget_phone.dart';
import 'package:apparche/auth/components/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:apparche/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:apparche/models/user.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_viewer/image_viewer.dart';

class Body extends StatefulWidget {
  Body({this.user});
  final UserData user;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _image;
  String _phoneCode;

  final _usernameControler = TextEditingController();
  final _statutControler = TextEditingController();
  final _phoneControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _phoneFormKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  final cloudStorageService = CloudStorageService();
  final firestoreService = FirestoreService();

  _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    print('pickedFile ${pickedFile.path}');
    setState(() {
      if (pickedFile != null) {
        cloudStorageService.uploadImageToFirebase(
            widget.user, File(pickedFile.path));
        _image = File(pickedFile.path);
      }
    });
  }

  _imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    print('pickedFile ${pickedFile.path}');
    setState(() {
      if (pickedFile != null) {
        cloudStorageService.uploadImageToFirebase(
            widget.user, File(pickedFile.path));
        _image = File(pickedFile.path);
      }
    });
  }

  _saveForm(UserData user) async {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    try {
      await firestoreService.updateUser(uid: user.uid, data: {
        'username': _usernameControler.value.text,
        'statut': _statutControler.value.text,
      });
    } catch (e) {
      print(e);
    }

    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    UserData user = widget.user;

    return Container(
      width: double.infinity,
      child: user != null
          ? Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                children: [
                  ProfileWidget(
                    imagePath: user.imageUrl ?? '',
                    isEdit: true,
                    onClicked: () async {
                      showImageOptionsDialog(context);
                    },
                  ),
                  const SizedBox(height: 50),
                  TextFieldWidget(
                    label: 'Nom',
                    icon: Icons.account_circle,
                    validator: (String text) {
                      if (text.isEmpty) {
                        return 'Veillez renseigner ce champ !';
                      }
                      return null;
                    },
                    text: user.username ?? '',
                    controller: _usernameControler,
                    onChanged: (username) {},
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    label: 'Email',
                    icon: Icons.mail,
                    text: user.email ?? '',
                    readOnly: true,
                    onChanged: (email) {},
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    label: 'Actu',
                    icon: Icons.info,
                    text: user.statut ?? '',
                    controller: _statutControler,
                    maxLines: 2,
                    onChanged: (statut) {},
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    label: 'Téléphone',
                    icon: Icons.phone,
                    text: '${user.phoneCode} ${user.phone}' ?? '',
                    readOnly: true,
                    onChanged: (phone) {},
                    onPress: () {
                      showPhoneDialog(context, user);
                    },
                  ),
                  const SizedBox(height: 40),
                  ButtonWidget(
                    text: 'Modifier',
                    onClicked: () {
                      _saveForm(user);
                    },
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  void showPhoneDialog(BuildContext context, UserData user) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modifier mon numero'),
          content: SingleChildScrollView(
            child: Form(
              key: _phoneFormKey,
              child: ListBody(
                children: <Widget>[
                  TextFieldWidgetPhone(
                    label: 'Téléphone',
                    text: user.phone ?? '',
                    controller: _phoneControler,
                    initialCode:
                        CountryCode.fromDialCode(user.phoneCode ?? '+243')
                            .dialCode,
                    onPhoneChanged: (CountryCode code) {
                      _phoneCode = code.dialCode;
                    },
                    onChanged: (phone) {},
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Confirmer'),
              onPressed: () async {
                final isValid = _phoneFormKey.currentState.validate();

                if (!isValid) {
                  return;
                }

                try {
                  await firestoreService.updateUser(uid: user.uid, data: {
                    'phone': _phoneControler.value.text,
                    'phoneCode': _phoneCode ?? '+243',
                  });
                } catch (e) {
                  print(e);
                }
                _phoneFormKey.currentState.reset();
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void showImageOptionsDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Changer de photo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                InkWell(
                  child: ListTile(
                    title: Text('Afficher la photo'),
                    leading: Icon(Icons.person),
                    onTap: () {
                      ImageViewer.showImageSlider(
                images: [
                  'https://cdn.eso.org/images/thumb300y/eso1907a.jpg',
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
                ],
                startingPosition: 1,
              );
                      Navigator.pop(context);
                    },
                  ),
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Camera'),
                    leading: Icon(Icons.photo_camera),
                  ),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.pop(context);
                  },
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Galerie'),
                    leading: Icon(Icons.movie),
                  ),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
