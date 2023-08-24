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
      return loginResult;
    } catch (e) {
      //print('Login Failed: ${e.toString()}');
      return false;
    }
  }

  Future showProfileInfo() async {
    final email = authModel?.email;
    if (email != null)
      return FirebaseAuthRepo.getUserDetails(email!);
    else
      print('error');
  }
}
