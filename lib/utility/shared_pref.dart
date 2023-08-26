import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  Future<String> readUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('user_email') ?? '';
  }

  Future<void> writeUserData(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', email);
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user_email');
  }
}
