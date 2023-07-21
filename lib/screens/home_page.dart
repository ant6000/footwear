import 'package:flutter/material.dart';
import 'package:footwear/widgets/categories_widgets.dart';
import '../widgets/Items_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  Widget activePage = const HomePage();

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      'Sort by',
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 40,
                      ),
                      onTap: () {
                        print('sortby');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          const MyWidgets(),
          const Itemswidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/favourite');
        break;
      case 2:
        //Navigator.pushNamed(context, '/settng');
        break;
      case 3:
        Navigator.pushNamed(context, '/settng');
        break;
      default:
        Navigator.pushNamed(context, '/');
        break;
    }
  }
}
