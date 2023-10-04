import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/cart_provider.dart';
import 'package:footwear/v2/view/screens/favourite_page.dart';
import 'package:footwear/v2/view/screens/home_feed.dart';
import 'package:footwear/v2/view/screens/settings_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Footware',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Consumer<CartProvider>(builder: (context, cartProvider, _) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Badge(
                label: Text(cartProvider.cartlist.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cartPage');
                    },
                    icon: const Icon(Icons.shopping_cart)),
              ),
            );
          })
        ],
      ),

      body: buildBody(currentIndex),
    bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            currentIndex: currentIndex,
            showUnselectedLabels: false,
            items:  [
              BottomNavigationBarItem(icon: currentIndex == 0 ? const Icon(Icons.home):const Icon(Icons.home_outlined),label: 'Homefeed'),
              BottomNavigationBarItem(icon: currentIndex == 1 ? const Icon(Icons.favorite) :const Icon(Icons.favorite_outline),label: 'Favorite'),
              BottomNavigationBarItem(icon: currentIndex == 2 ? const Icon(Icons.settings) : const Icon(Icons.settings_outlined),label: 'Settings'),
            ],
            onTap: (selectedIndex) {
              setState(() {
                currentIndex = selectedIndex;
              });
            },
      ),
    );
  }

  int currentIndex = 0;

  Widget buildBody(int index){
    switch(index){
      case 0: return const HomeFeed();
      case 1: return const FavouritePage();
      case 2: return const SettingsPage();
      default: return const SizedBox.shrink();
    }
  }
}
