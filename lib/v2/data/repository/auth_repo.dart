import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footwear/v2/data/model/user_model.dart';

class FirebaseAuthRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'User Data';

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseAuth get auth => _auth;
  static User? get user => auth.currentUser;
  static String userUid = '';

  static Future<UserModel?> signUp(
      String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final addmodel = UserModel(
          uid: credential.user?.uid ?? '',
          name: name,
          email: email,
          password: password,
          phone: credential.user?.phoneNumber ?? '',
          profilePic: credential.user?.photoURL ?? '');

      addDetails(addmodel);
      return addmodel;
    } catch (e) {
      //print(e.toString());
      throw Exception(e.toString());
      //return null;
    }
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      //print(e.toString());
      throw Exception(e.toString());
      //return false;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> addDetails(UserModel userModel) async {
    _database
        .collection(collectionUser)
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  static Future<UserModel?> getUserDetails(String email) async {
  try {
    final  querySnapshot = await _database
        .collection(collectionUser)
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot userDocument = querySnapshot.docs.first;
      final Map<String, dynamic> userData = userDocument.data() as Map<String, dynamic>;
      return  UserModel.fromMap(userData);
    } else {
      return null;
    }
  } catch (e) {
    debugPrint('repo Error fetching user data: $e');
    return null;
  }
}
}
