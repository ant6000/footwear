import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footwear/v2/controller/provider/auth_provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController loginEmailController = TextEditingController();

  final TextEditingController loginpPasswordController =
      TextEditingController();

  @override
  void dispose() {
    loginEmailController.dispose();
    loginpPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    navigateRoute() => Navigator.pushReplacementNamed(context, '/homePage');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<AuthProvider>(builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Shop your\nDream shoe from\nLargest collection',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
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
                          Navigator.popAndPushNamed(context, '/registerPage');
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
                    controller: loginEmailController,
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
                      controller: loginpPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          hintText: 'Enter Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.remove_red_eye)),
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
                            style: TextStyle(color: Colors.red, fontSize: 20),
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
                            loginEmailController.text,
                            loginpPasswordController.text);
                        const CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.amber,
                        );
                        if (result) {
                          await provider
                              .showProfileInfo(loginEmailController.text);
                          navigateRoute();
                        } else {
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
