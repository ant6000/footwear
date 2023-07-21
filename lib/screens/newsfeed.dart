import 'package:flutter/material.dart';

import '../widgets/Items_widget.dart';
import '../widgets/categories_widgets.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
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
    );
  }
}
