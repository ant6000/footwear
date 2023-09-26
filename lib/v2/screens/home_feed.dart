import 'package:flutter/material.dart';
import 'package:footwear/v2/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:footwear/v2/provider/show_details_provider.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _TestState();
}

class _TestState extends State<HomeFeed> {
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
    final provider =
        Provider.of<ShowProductDetailsProvider>(context, listen: false);

    provider.showData();
    return Scaffold(
      appBar: AppBar(
        title:const Text('Footware',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Badge(
                  label: Text(cartProvider.cartlist.length.toString()),
                  child: IconButton(onPressed: () {
                    Navigator.pushNamed(context,'/cartPage');
                  }, icon:const Icon(Icons.shopping_cart)),
                ),
              );
            }
          )
        ],
      ),
      body:
        Consumer<ShowProductDetailsProvider>(builder: (context, provider, _) {
      return provider.productList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: provider.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    provider.index = index;
                    Navigator.pushNamed(context, '/detailsPage');
                  },
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 5,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red),
                                child: const Text('-30%'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/favouritePage');
                                },
                                child:
                                    const Icon(Icons.favorite_border_outlined),
                              )
                            ],
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(360),
                                    color: Colors.black26),
                                child: provider
                                        .productList[index].imageUrl.isNotEmpty
                                    ? Image.asset('images/snikers1.png')
                                    : Image.network(
                                        provider.showImage(index).toString()),
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  provider.productList[index].title,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                // Text(
                                //   provider.productList[index].details!,
                                //   style: const TextStyle(fontSize: 15),
                                // ),
                                Text(
                                  '${provider.productList[index].price.toString()} Tk',
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
