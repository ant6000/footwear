import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footwear/provider/show_product_details_provider.dart';
import 'package:footwear/provider/upload_provider.dart';
import 'package:footwear/screens/home_page.dart';
import 'package:footwear/screens/homefeed.dart';
import 'package:footwear/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/porduct_provider.dart';
import 'firebase_options.dart';
import 'screens/admin_page.dart';
import 'screens/login_screen.dart';
import 'screens/show_product_details.dart';
import 'screens/splash_screen.dart';

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
    ChangeNotifierProvider(
      create: (context) => UploadProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ShowProductDetailsProvider(),
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
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const UploadPage(),
        '/login':(context) => const LogIn(),
        '/register':(context) => const Register(),
        '/homepage':(context) =>const HomePage(),
      },
    );
  }
}
