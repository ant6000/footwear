import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footwear/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    navigateRoute() => Navigator.pushReplacementNamed(context, '/homepage');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<AuthProvider>(builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Shop your\nDream shoe from\nLargest collection',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to your account',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text(
                          'Register account',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: provider.loginEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Enter email',
                        hintText: 'Enter your Email',
                        prefixIcon: const Icon(Icons.mail),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: provider.loginpPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          hintText: 'Enter your Password',
                          prefixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            'Forgot Pasword?',
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool result = await provider.loginAccount(
                            provider.loginEmailController.text,
                            provider.loginpPasswordController.text);
                        const CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.amber,
                        );
                        if (result) {
                          navigateRoute();
                        } else {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('login failed')));
                          Fluttertoast.showToast(
                              msg: 'login failed',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Iog In',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
