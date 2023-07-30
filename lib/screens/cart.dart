import 'package:flutter/material.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/widgets/single_cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (BuildContext context, favprovider, child) {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const SingleCart();
              });
        },
      ),
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
              const Text(
                '1124.00',
                style: TextStyle(fontSize: 30),
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
  }
}