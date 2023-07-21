import 'package:flutter/material.dart';

import '../widgets/Items_card.dart';
import '../widgets/categories.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                    color: Colors.black,
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
        const CategoriesWidgets(),
        const ItemsCardWidget(),
      ],
    );
  }
}
