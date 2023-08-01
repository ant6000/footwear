import 'package:flutter/material.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/screens/favourites.dart';
import 'package:footwear/screens/homefeed.dart';
import 'package:footwear/screens/cart.dart';
import 'package:footwear/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                child: Consumer<ProductProvider>(
                  builder: (BuildContext context, provider, child) {
                    return Badge(
                      label:
                           Text(provider.cartlist.length.toString()),
                      backgroundColor: Colors.green,
                      child: InkWell(
                        onTap: () {
                          if (provider.toggleCart()) {
                            _closeCart();
                          }
                          if (provider.toggleCart()) {
                            _showCart();
                          }
                        },
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.purple,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: _buildBody(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          _onItemTapped(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeFeed();
      case 1:
        return const Favourites();
      case 2:
        return const CheckOut();
      case 3:
        return const Settings();
      default:
        return const SizedBox
            .shrink(); // This is just a fallback, you can replace it with any other widget.
    }
  }

  void _onItemTapped(int value) {
    {
      setState(() {
        currentIndex = value;
      });
    }
  }

  void _showCart() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Cart(),
        ));
  }

  void _closeCart() {
    Navigator.of(context).pop();
  }
}
