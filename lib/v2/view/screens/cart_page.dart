import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/cart_provider.dart';
import 'package:footwear/v2/view/widgets/cart_list_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            ElevatedButton(
                onPressed: cartProvider.cartlist.isEmpty ? null : () {},
                child: const Row(
                  children: [
                    Text('Checkout'),
                    Icon(Icons.shopping_cart_checkout)
                  ],
                )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: cartProvider.cartlist.isNotEmpty
              ? ListView.builder(
                  itemCount: cartProvider.cartlist.length,
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Dismissible(
                        background: Container(
                          color: Colors.green,
                        ),
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        secondaryBackground: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(Icons.delete),
                        ),
                        onDismissed: (direction) {
                          cartProvider
                              .removeFromCart(cartProvider.cartlist[index]);
                        },
                        child: CartListTile(
                          imageUrl: cartProvider
                              .cartlist[index].productModel.imageUrl,
                          title:
                              cartProvider.cartlist[index].productModel.title,
                          price:
                              cartProvider.cartlist[index].productModel.price,
                          quantity: cartProvider.cartlist[index].quantity,
                          qunatityIncrease: () {
                            cartProvider.increseQuantity(index);
                          },
                          qunatityDecrease: () {
                            cartProvider.decreseQuantity(index);
                          },
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                  'Cart is empty',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                )),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Total Price:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                cartProvider.totalPriceCalculate().toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
    });
  }
}
