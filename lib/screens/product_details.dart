import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/widgets/image_slider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final ProductProvider provider;
  final ProductModel model;
  //final bool isfavourite;
  final int index;
  ProductDetails(
      {super.key,
      required this.provider,
      required this.model,
      //required this.isfavourite,
      required this.index});

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  void _addToFavourites(ProductProvider provider, int productId) {
    provider.addToFavourites(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nike'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  _addToFavourites(provider, model.productId);
                },
                icon: Icon(
                  model.isFavorite ? Icons.favorite : Icons.favorite_outline,
                  color: model.isFavorite ? Colors.pink : Colors.black,
                ),
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlider(model: model),
                  const SizedBox(height: 10),
                  Text(
                    model.title,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Built for natural motion, the Nike flex shoes',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Size: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      // for (int i = 1; i < 5; i++)
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10),
                      //   child: Selector(),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Available Colors: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      for (int i = 0; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: colors[i],
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: ${model.price}',
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          provider.addToCart(index);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text('Add to Cart')
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
