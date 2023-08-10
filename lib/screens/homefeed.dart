import 'package:flutter/material.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/widgets/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:footwear/widgets/categories.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<ProductProvider>(context, listen: false);
      provider.getAllProductsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, productPorvider, Widget? child) {
        return Column(
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
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Sort by',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton<String>(
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        icon: const Icon(Icons.sort),
                        value: productPorvider.dropDownValue,
                        onChanged: (String? value) {
                          productPorvider.dropDownValue = value!;
                          productPorvider.sorting(value);
                        },
                        items: const [
                          DropdownMenuItem<String>(
                              value: 'default', child: Text('Default')),
                          DropdownMenuItem<String>(
                              value: 'high',
                              child: Text(
                                'Price:High-low',
                              )),
                          DropdownMenuItem<String>(
                              value: 'low',
                              child: Text(
                                'Price:Low-High',
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: .25,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: productPorvider.categoriesList.length,
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) => CategoriesWidgets(
                  catagoryModel: productPorvider.categoriesList[index],
                  oncategorySelected: productPorvider.onCategorySelected,
                  index: index,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                itemCount: productPorvider.filteredProductList.length,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) => CustomCard(
                    product: productPorvider.filteredProductList[index],
                    index: index),
              ),
            )
          ],
        );
      },
    );
  }
}
