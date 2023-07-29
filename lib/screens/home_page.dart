import 'package:flutter/material.dart';
import 'package:footwear/screens/favourites.dart';
import 'package:footwear/screens/homefeed.dart';
import 'package:footwear/screens/test.dart';
import 'package:footwear/widgets/search_bar.dart';

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
      body: _buildBody(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          _onItemTapped(value);},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
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
        return const MyWidget3();
      case 3:
        return const HomeFeed();
      default:
        return const SizedBox.shrink(); // This is just a fallback, you can replace it with any other widget.
    }
  }

  void _onItemTapped(int value) {
    {
      // Check if the widget is still mounted before calling setState
      setState(() {
        currentIndex = value;
      });
    }
  }
}
