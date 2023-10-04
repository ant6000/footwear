import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footwear/v2/data/model/cart_model.dart';
import 'package:footwear/v2/controller/provider/cart_provider.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int value = 0;

  Widget customRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      style: OutlinedButton.styleFrom(
          backgroundColor:
              (value == index) ? Colors.green : Colors.transparent),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final productDetailsProvider =
    //     Provider.of<ShowProductDetailsProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Consumer<ShowProductDetailsProvider>(
        builder: (context, productDetailsProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                String productId = productDetailsProvider
                    .filteredProductList[productDetailsProvider.index]
                    .productId;
                    
                productDetailsProvider.toggleLike( productId);
              },
              child: Icon(
                productDetailsProvider.isProductLiked(productDetailsProvider
                        .filteredProductList[productDetailsProvider.index]
                        .productId)
                    ? Icons
                        .favorite // If the item is in the favorite list, show the filled heart icon
                    : Icons
                        .favorite_border_outlined, // If not, show the outlined heart icon
                color: productDetailsProvider.isProductLiked(
                        productDetailsProvider
                            .filteredProductList[productDetailsProvider.index]
                            .productId)
                    ? Colors
                        .pink // If the item is in the favorite list, use the pink color
                    : Colors.black, // If not, use the black color
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                        ),
                        child: productDetailsProvider
                                .filteredProductList.isNotEmpty
                            ? Image.network(productDetailsProvider
                                .filteredProductList[
                                    productDetailsProvider.index]
                                .imageUrl)
                            : const CircularProgressIndicator(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        productDetailsProvider
                            .filteredProductList[productDetailsProvider.index]
                            .title,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        productDetailsProvider
                            .filteredProductList[productDetailsProvider.index]
                            .details
                            .toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          const Text(
                            'Size: ',
                            style: TextStyle(fontSize: 30),
                          ),
                          customRadioButton('5', 1),
                          const SizedBox(width: 5),
                          customRadioButton('6', 2),
                          const SizedBox(width: 5),
                          customRadioButton('7', 3),
                          const SizedBox(width: 5),
                          customRadioButton('8', 4),
                          const SizedBox(width: 5),
                          customRadioButton('9', 5),
                          const SizedBox(width: 5),
                          customRadioButton('10', 6),
                          const SizedBox(width: 5),
                          customRadioButton('11', 7),
                          const SizedBox(width: 5),
                          customRadioButton('12', 8),
                          const SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ${productDetailsProvider.filteredProductList[productDetailsProvider.index].price}\$',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          Consumer<ShowProductDetailsProvider>(
                              builder: (context, provider, _) {
                            return SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  bool result = cartProvider.addToCart(
                                      CartModel(
                                          provider.filteredProductList[
                                              productDetailsProvider.index],
                                          value,
                                          1));
                                  if (result) {
                                    Fluttertoast.showToast(
                                        msg: 'Added',
                                        backgroundColor: Colors.amber,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_SHORT);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Alreaded added',
                                        backgroundColor: Colors.amber,
                                        textColor: Colors.white,
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.shopping_cart),
                                    Text('Add to Cart')
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    });
  }
}
