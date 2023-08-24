import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:footwear/model/user_model.dart';

class FirebaseAuthRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'User Data';

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseAuth get authh => _auth;
  static User? get user => _auth.currentUser;
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
          phone: credential.user?.phoneNumber ?? '',
          profilePic: credential.user?.photoURL ?? '');

      addDetails(addmodel);
      return addmodel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      //print(e.toString());
      return false;
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

  static Future<UserModel> getUserDetails(String email) async {
    try {
      final snapshot = await _database
          .collection(collectionUser)
          .where('email', isEqualTo: email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        // Assuming you have only one document per email
        return UserModel.fromMap(snapshot.docs.first.data());
      } else {
        throw Exception('User data not found');
      }
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }
}
