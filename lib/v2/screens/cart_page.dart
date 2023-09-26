import 'package:flutter/material.dart';
import 'package:footwear/v2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            return ListView.builder(
              itemCount: cartProvider.cartlist.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder:(context, index) {
              return cartProvider.cartlist.isEmpty ? const Center(child: Text('Dont have any products added')) :  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: ListTile(
                  textColor: Colors.white,
                  tileColor: Colors.amber,
                  title: Text(cartProvider.cartlist[index].productModel.title),
                  subtitle: Text(cartProvider.cartlist[index].productModel.price.toString()),
                ),
              );
            }, );
          }
        ),
      ),
    );
  }
}