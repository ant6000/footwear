import 'package:flutter/material.dart';
import 'package:footwear/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'provider/porduct_provider.dart';

  void main() {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
    ], child: const MainApp()));
  }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}
