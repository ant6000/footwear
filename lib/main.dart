import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footwear/screens/home_page.dart';
import 'package:footwear/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/porduct_provider.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => LogIn(),
        '/homepage':(context) =>const HomePage(),
        '/register':(context) => Register(),
         '/login':(context) => LogIn(),
      },
    );
  }
}
