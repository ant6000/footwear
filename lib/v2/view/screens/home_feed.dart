import 'package:flutter/material.dart';
import 'package:footwear/v2/view/widgets/catagory.dart';
import 'package:footwear/v2/view/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _TestState();
}

class _TestState extends State<HomeFeed> {
  TextEditingController searchString = TextEditingController();
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     final provider = Provider.of<ShowProductDetailsProvider>(context, listen: false);
  //     provider.showData();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final provider1 =
        Provider.of<ShowProductDetailsProvider>(context, listen: false);
    provider1.showData();
    provider1.showCategoryList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextField(
              controller: searchString,
              onChanged: (value) {
                provider1.searchItems(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Search here',
                  alignLabelWithHint: true,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Consumer<ShowProductDetailsProvider>(
            builder: (context, categotyProvider, _) {
              return SizedBox(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categotyProvider.categoryList.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CategoryButton(
                            index: index,
                            text: categotyProvider.categoryList[index].name),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Consumer<ShowProductDetailsProvider>(builder: (context, provider, _) {
            return provider.productList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      itemCount: provider.filteredProductList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          index: index,
                          title: provider.filteredProductList[index].title,
                          price: provider.filteredProductList[index].price,
                          imageUrl:
                              provider.filteredProductList[index].imageUrl,
                        );
                      },
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
