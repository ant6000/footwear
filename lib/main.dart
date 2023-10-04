import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'v2/view/screens/home_page.dart';
import 'v2/view/screens/register_screen.dart';
import 'v2/controller/provider/auth_provider.dart';
import 'v2/controller/provider/show_details_provider.dart';
import 'v2/controller/provider/upload_provider.dart';
import 'v2/view/screens/cart_page.dart';
import 'v2/controller/provider/cart_provider.dart';
import 'v2/view/screens/login_screen.dart';
import 'v2/view/screens/product_details_page.dart';
import 'v2/view/screens/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UploadProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ShowProductDetailsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/loginPage': (context) => const  LogInPage(),
        '/registerPage': (context) => const  RegisterPage(),
        '/homePage': (context) => const HomePage(),
        '/detailsPage': (context) => const ProductDetailsPage(),
        '/cartPage': (context) => const CartPage(),
      },
    );
  }
}
