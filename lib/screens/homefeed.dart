import 'package:flutter/material.dart';
import 'package:footwear/model/catagory_model.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/widgets/custom_card.dart';
import 'package:provider/provider.dart';

import '../widgets/categories.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      final provider = Provider.of<ProductProvider>(context, listen: false);
      provider.getAllProductsData();
    });
  }

  List<CatagoryModel> categoriesList = getCategoriesList;
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

        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       for (int i = 0; i < categoriesList.length; i++)
        //         Padding(
        //           padding: const EdgeInsets.all(10.0),
        //           child: CategoriesWidgets(catagoryModel: categoriesList[i]),
        //         ),
        //     ],
        //   ),
        // ),
        Container(
          height: 50,
          child: GridView.builder(
              padding: EdgeInsets.only(bottom: 10,left: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: .25,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              //shrinkWrap: true,
              itemCount: categoriesList.length,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) =>
                  CategoriesWidgets(catagoryModel: categoriesList[index])),
        ),
        Consumer<ProductProvider>(builder: (context, productPorvider, child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            shrinkWrap: true,
            itemCount: productPorvider.getProductList.length,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => CustomCard(
              productModel: productPorvider.getProductList[index],
            ),
          );
        })
      ],
    );
  }
}
