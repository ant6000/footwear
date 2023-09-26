import 'package:flutter/material.dart';
import 'package:footwear/utility/shared_pref.dart';
import 'package:footwear/v1/data/model/user_model.dart';
import 'package:footwear/v1/data/repository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _authModel;
  UserModel? get authModel => _authModel;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginpPasswordController =
      TextEditingController();

  Future<bool> registerAccount(
      String name, String email, String password) async {
    try {
      final auth = await FirebaseAuthRepo.signUp(name, email, password);
      if (auth != null) {
        SharedPref().writeUserData(email);
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
      //var userData = showProfileInfo(email);
      SharedPref().writeUserData(email);
      //_authModel = await userData;
      //notifyListeners();
      return loginResult;
    } catch (e) {
      //print('Login Failed: ${e.toString()}');
      return false;
    }
  }

  Future<void> logOut() async {
    FirebaseAuthRepo.signOut();
    _authModel = null; // Clear the authenticated user data
    SharedPref().clearUserData();
    notifyListeners();
  }

  Future<UserModel?> showProfileInfo(String email) async {
    try {
      UserModel userDetails = await FirebaseAuthRepo.getUserDetails(email);
      return userDetails;
    } catch (e) {
      print('Error fetching user details: $e');
      return null;
    }
  }

  Future<void> checkedLoginorNot() async {
    final pref = SharedPref();
    final String email = await pref.readUserData();
    if (email != '') {
      var userData = showProfileInfo(email);
      _authModel = await userData;
      notifyListeners();
    }
  }
}
