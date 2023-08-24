import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String profilePic;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
  });

  tojson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      uid: map["uid"] ?? "",
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      phone: map["phone"] ?? "",
      profilePic: map["profilePic"] ?? "");

  factory UserModel.fromSnapsot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return UserModel(
        uid: document['uid'],
        name: document['name'],
        email: document['email'],
        phone: document['phone'],
        profilePic: document['profilePic']);
  }
}
