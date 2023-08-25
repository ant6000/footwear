import 'package:flutter/material.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/repository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _authModel;
  UserModel? get authModel => _authModel;

  Future<bool> registerAccount(
      String name, String email, String password) async {
    try {
      final auth = await FirebaseAuthRepo.signUp(name, email, password);
      if (auth != null) {
        _authModel = auth;
        notifyListeners();
        return true;
      } else {
        //print('Registration failed');
        return false;
      }
    } catch (e) {
      //print(e.toString());
      return false;
    }
  }

  Future<bool> loginAccount(String email, String password) async {
    try {
      bool loginResult = await FirebaseAuthRepo.signIn(email, password);
      var userData = showProfileInfo(email);
      _authModel = await userData;
      notifyListeners();
      return loginResult;
    } catch (e) {
      //print('Login Failed: ${e.toString()}');
      return false;
    }
  }

  Future<void> logOut() async {
    FirebaseAuthRepo.signOut();
    _authModel = null; // Clear the authenticated user data
    notifyListeners();
  }

  Future<UserModel?> showProfileInfo(String email) async {
    // final email = authModel?.email;
    // print(email);
    // if (email != null) {
      try {
        UserModel userDetails = await FirebaseAuthRepo.getUserDetails(email);
        return userDetails;
      } catch (e) {
        print('Error fetching user details: $e');
        return null;
      }
    // } else {
    //   print('No email available.');
    //   return null;
    // }
  }
}
