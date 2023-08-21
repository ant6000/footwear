import 'package:flutter/material.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/repository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _authModel;
  UserModel? get authModel => _authModel;

  Future<void> registerAccount(
      String name, String email, String password) async {
    final auth = await FirebaseAuthRepo.signUp(name, email, password);
    if (auth != null) {
      _authModel = auth;
      notifyListeners();
    } else {
      print('Registration failed');
    }
  }

  Future loginAccount(String email, String password) async {
    FirebaseAuthRepo.signIn(email, password);
    print('successfully logedin');
  }
}
