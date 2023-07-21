import 'package:flutter/material.dart';
import 'package:footwear/screens/favourites.dart';
import 'package:footwear/screens/settings.dart';
import 'package:provider/provider.dart';
import 'provider/porduct_provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ProductProvider(),
  child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const HomePage(),
        '/favourite': (_) => const Favourites(),
        '/settng': (_) => const Settings(),
      },
    );
  }
}
