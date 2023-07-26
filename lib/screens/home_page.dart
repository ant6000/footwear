import 'package:flutter/material.dart';
import 'package:footwear/screens/favourites.dart';
import 'package:footwear/screens/homefeed.dart';
import 'package:footwear/screens/settings.dart';
import 'package:footwear/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  Widget activePage = const HomeFeed();

  @override
  Widget build(BuildContext context) {
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
        leading: const Icon(Icons.electric_bolt, color: Colors.amber),
        actions: [
          Row(
            children: [
              const Text(
                'Nike',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: ItemSearchBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 10),
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
              ),
            ],
          ),
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
