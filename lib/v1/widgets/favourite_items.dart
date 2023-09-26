import 'package:flutter/material.dart';
import 'package:footwear/v1/data/model/products_model.dart';
import 'package:footwear/v1/provider/porduct_provider.dart';
import 'package:provider/provider.dart';

class FavItems extends StatelessWidget {
  final int index;
  const FavItems({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    final List<ProductModel> favoriteProducts = provider.favouriteProductList;
    final ProductModel product = favoriteProducts[index];
    return InkWell(
      onTap: () {
       
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(7, 10),
                )
              ]),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(product.imageUrl),
              ),
              const SizedBox(height: 0),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                product.price.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
