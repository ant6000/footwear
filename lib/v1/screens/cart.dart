import 'package:flutter/material.dart';
import 'package:footwear/v1/provider/porduct_provider.dart';
import 'package:footwear/v1/widgets/single_cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('cart'),
            centerTitle: true,
          ),
          body: ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: provider.cartlist.length,
              itemBuilder: (context, index) {
                return SingleCart(index: index);
              }),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(5, 7),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total: ${provider.totalPrice()}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_cart),
                        Text(
                          'Checkout',
                          style: TextStyle(fontSize: 20),
                        )
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
  }
}
