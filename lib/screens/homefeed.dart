import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../widgets/custom_card.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(2, 2)),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Sort by',
                    style: TextStyle(
                      fontSize: 20,
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(2, 2)),
                      ],
                    ),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              for (int i = 1; i < 10; i++)
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 10),
                  child: CategoriesWidgets(),
                ),
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: .65,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          children: [
            for (int i = 1; i <= 10; i++)
             const CustomCard(),
          ],
        )
      ],
    );
  }
}
