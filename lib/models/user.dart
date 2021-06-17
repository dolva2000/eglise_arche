import 'dart:convert';

UserData videosListFromJson(String str) => UserData.fromJson(json.decode(str));

String videosListToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.uid,
    this.email,
    this.username,
    this.phone,
    this.phoneCode,
    this.createdAt,
    this.imageUrl,
    this.genre,
    this.statut,
    this.attribute,
  });

  String uid;
  String email;
  String username;
  String phone;
  String phoneCode;
  DateTime createdAt;
  String imageUrl;
  String genre;
  String statut;
  String attribute;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        uid: json["uid"] ?? '',
        email: json["email"] ?? '',
        username: json["username"] ?? '',
        phone: json["phone"] ?? '',
        phoneCode: json["phoneCode"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
        imageUrl: json["imageUrl"] ?? '',
        genre: json["genre"] ?? '',
        statut: json["statut"] ?? '',
        attribute: json["attribute"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "username": username,
        "phone": phone,
        "phoneCode": phoneCode,
        "createdAt": createdAt.toIso8601String(),
        "imageUrl": imageUrl,
        "genre": genre,
        "statut": statut,
        "attribute": attribute,
      };
}
