import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  final String? uid;
  final String? email;
  final String? name;
  final String? password;

  UserModel({this.uid, this.email, this.name, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json["uid"],
        email: json["Email"],
        name: json["name"],
        password: json["Pass"]);
  }
}
