import 'package:flutter/material.dart';
import 'package:footwear/screens/favourites.dart';
import 'package:footwear/screens/settings.dart';
import 'screens/card.dart';
import 'screens/home_page.dart';
import 'widgets/Items_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white70,
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
