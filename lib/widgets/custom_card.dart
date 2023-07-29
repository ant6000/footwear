import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/screens/product_details.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  final int index;
  const CustomCard({super.key, required this.index});
  void _addToFavourites(ProductProvider provider, int productId) {
    provider.addToFavourites(productId);
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    final ProductModel product = provider.productListP[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 5,
                spreadRadius: 2,
                blurStyle: BlurStyle.normal,
                offset: Offset(7, 10),
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '-50%',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          _addToFavourites(provider,product.productId);
                        },
                        child: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              product.isFavorite ? Colors.pink : Colors.black,
                        )),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: Colors.amber,
                    ),
                  ),
                  Image.asset(
                    product.imageUrl,
                    width: 220,
                    height: 150,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Comfortable and felxible',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                product.price.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
