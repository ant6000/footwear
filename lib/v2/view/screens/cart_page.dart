import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(builder: (context, cartProvider, _) {
          return cartProvider.cartlist.isNotEmpty
              ? ListView.builder(
                  itemCount: cartProvider.cartlist.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        //style: ,
                        textColor: Colors.white,
                        tileColor: Colors.amber,
                        title: Text(
                            cartProvider.cartlist[index].productModel.title,
                            style: const TextStyle(fontSize: 25)),
                        subtitle: Text(
                            cartProvider.cartlist[index].productModel.price
                                .toString(),
                            style: const TextStyle(fontSize: 20)),
                        leading: Container(
                            height: 200, width: 100, color: Colors.black),
                        trailing: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                
                              },
                                child: const Icon(
                              Icons.add,
                              size: 15,
                            )),
                            const Text('1',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                            InkWell(
                              onTap: () {
                                
                              },
                                child: const Icon(
                              Icons.remove,
                              size: 15,
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                  'Dont have any products added',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ));
        }),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
        color: Colors.green,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        ),
      ),
    );
  }
}
