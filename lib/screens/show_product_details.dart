import 'package:flutter/material.dart';
import 'package:footwear/provider/show_product_details_provider.dart';
import 'package:provider/provider.dart';

class ShowProducts extends StatefulWidget {
  const ShowProducts({super.key});

  @override
  State<ShowProducts> createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ShowProductDetailsProvider>(context, listen: false);
    provider.showData();
    return Scaffold(body:
        Consumer<ShowProductDetailsProvider>(builder: (context, provider, _) {
      return provider.productList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: provider.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //crossAxisCount: 2
                crossAxisCount: 2,
                childAspectRatio: .7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('tapped');
                  },
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 1,
                    color: Colors.amber,
                    
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                ),
                                child: const Text('-30%'),
                              ),
                              GestureDetector(
                                child: const Icon(Icons.favorite_border_outlined),
                              )
                            ],
                          ),
                           Expanded(
                              flex: 2,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.white,
                                backgroundImage:  NetworkImage(provider.productList[index].imageUrl),
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  provider.productList[index].title,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  provider.productList[index].details!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  provider.productList[index].price.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    }));
  }
}