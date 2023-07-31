import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:provider/provider.dart';

class SingleCart extends StatelessWidget {
  int index;
  SingleCart({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    final ProductModel productModel = provider.cartlist[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(5, 7),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(productModel.imageUrl),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(provider.increamentPrice(productModel).toString(),
                    style: TextStyle(fontSize: 20)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      provider.increaseQuantity(productModel.productId);
                    },
                    icon: const Icon(Icons.add)),
                Text(
                  provider.quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      provider.decreaseQuantity();
                    },
                    icon: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
