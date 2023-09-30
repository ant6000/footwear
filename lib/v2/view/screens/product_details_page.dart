import 'package:flutter/material.dart';
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
    final productDetailsProvider =
        Provider.of<ShowProductDetailsProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          GestureDetector(
            onTap: () {
              
            },
            child: const Icon(Icons.favorite_outline)),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                      //child: provider.productList.isNotEmpty ? Image.network(provider.productList[provider.index].imageUrl) : const CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      productDetailsProvider.filteredProductList[productDetailsProvider.index].title,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    
                    Text(
                      productDetailsProvider.filteredProductList[productDetailsProvider.index].details.toString(),
                      //textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Size: ',
                          style: TextStyle(fontSize: 20),
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
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: ${productDetailsProvider.filteredProductList[productDetailsProvider.index].price}\$',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Consumer<ShowProductDetailsProvider>(
                          builder: (context, provider,_) {
                            return ElevatedButton(
                              onPressed: !provider.filteredProductList[productDetailsProvider.index].isAdded
                                  ? () {
                                      provider.toggleIsAdded();
                                      cartProvider.addToCart(CartModel(
                                          provider.filteredProductList[productDetailsProvider.index],
                                          value));
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  const Icon(Icons.shopping_cart),
                                  !productDetailsProvider.filteredProductList[productDetailsProvider.index].isAdded
                                      ? const Text('Add to Cart')
                                      : const Text('Already Added')
                                ],
                              ),
                            );
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
