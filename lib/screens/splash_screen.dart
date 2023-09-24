import 'package:flutter/material.dart';
import 'package:footwear/screens/home_page.dart';
import 'package:footwear/utility/shared_pref.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  void checkUserStatus() async {
    var pref = SharedPref();
    var value = await pref.readUserData();
    //navigateToLoginScreen();
    print('pref: $value');
    value != '' ? const HomePage() : navigateToLoginScreen();
  }

  navigateRoute() => Navigator.pushReplacementNamed(context, '/login');

  Future<void> navigateToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Wait for 3 seconds
    print('object');
    navigateRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset('animation/animation_llp5nvl3.json'),
        ),
      ),
    );
  }
}
