import 'package:flutter/material.dart';
import 'package:footwear/utility/shared_pref.dart';
import 'package:footwear/v2/data/model/user_model.dart';
import 'package:footwear/v2/data/repository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _authModel;
  UserModel? get authModel => _authModel;


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
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginAccount(String email, String password) async {
    try {
      bool loginResult = await FirebaseAuthRepo.signIn(email, password);
      if(loginResult){
      SharedPref().writeUserData(email);  
        showProfileInfo(email);
      }  
      return loginResult;
    } catch (e) {
      return false;
    }
  }

  Future<void> logOut() async {
    FirebaseAuthRepo.signOut();
    _authModel = null; // Clear the authenticated user data
    SharedPref().clearUserData();
    notifyListeners();
  }

   Future<void> showProfileInfo(String email) async {
    try {
      final userDetails = await FirebaseAuthRepo.getUserDetails(email);
      if(userDetails != null){
        _authModel  = userDetails;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('provider Error fetching user details: $e');
    }
  }

   void checkedLoginorNot(String email)  {
      showProfileInfo(email);    
  }

}
