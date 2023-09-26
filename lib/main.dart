import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'v1/provider/auth_provider.dart';
import 'v1/provider/porduct_provider.dart';
import 'v1/screens/login_screen.dart';
import 'v1/screens/register_screen.dart';
import 'v2/provider/show_details_provider.dart';
import 'v2/provider/upload_provider.dart';
import 'v2/screens/cart_page.dart';
import 'v2/screens/home_feed.dart';
import 'v2/provider/cart_provider.dart';
import 'v2/screens/product_details_page.dart';


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
        '/': (context) => const HomeFeed(),
        '/detailsPage': (context) => const ProductDetailsPage(),
        '/cartPage': (context) => const CartPage(),
        '/login':(context) => const LogIn(),
        '/register':(context) => const Register(),

        //'/homepage':(context) =>const HomePage(),
      },
    );
  }
}
