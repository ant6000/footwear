import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footwear/utility/shared_pref.dart';
import 'package:footwear/v2/controller/provider/auth_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AuthProvider>(context,listen: false);
    Timer(Duration(seconds: 3), () { 
    checkUserStatus(provider);
    });
  }
  
  void checkUserStatus(AuthProvider provider) async {
    var pref = SharedPref();
    var value = await pref.readUserData();
    //print(value);
    if (value != '') {
    provider.checkedLoginorNot(value);
    }
    value != '' ? navigateToHomePage() : navigaTologinpage();
  }

  navigateToHomePage() => Navigator.pushReplacementNamed(context, '/homePage');
  navigaTologinpage() => Navigator.pushReplacementNamed(context, '/loginPage');

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
