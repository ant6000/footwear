import 'package:flutter/material.dart';
import 'package:footwear/screens/favourites.dart';
import 'package:footwear/screens/homefeed.dart';
import 'package:footwear/screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeFeed();
    if (currentIndex == 1) {
      activePage = const Favourites();
    }
    if (currentIndex == 2) {
      activePage = const HomeFeed();
    }
    if (currentIndex == 3) {
      activePage = const Settings();
    }
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text("Nike"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Badge(
              label: const Text('3'),
              backgroundColor: Colors.green,
              child: InkWell(
                onTap: () {
                  print('badge');
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.purple,
                ),
              ),
            ),
          )
        ],
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
