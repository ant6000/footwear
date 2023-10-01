import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context,cartProvider,_) {
        return Scaffold(
          appBar: AppBar(
            title:const Text('Cart'),
            actions: [
              ElevatedButton(onPressed: cartProvider.cartlist.isEmpty? null 
              :() {},
               child: const Row(
                children: [
                  Text('Checkout'),
                  Icon(Icons.shopping_cart_checkout)
                ],
              )),
              const SizedBox(width: 10,),
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
                            horizontal: 10, vertical: 10),
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            cartProvider.removeFromCart(cartProvider.cartlist[index]);
                            cartProvider.toggleIsAdded();
                            
                          },
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
                            leading: Image.network(cartProvider.cartlist[index].productModel.imageUrl),
                            trailing: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    cartProvider.increseQuantity(index);
                                  },
                                    child: const Icon(
                                  Icons.add,
                                  size: 15,color: Colors.green,
                                )),
                                Text(cartProvider.cartlist[index].quantity.toString(),
                                    style:const TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                InkWell(
                                  onTap: () {
                                    cartProvider.decreseQuantity(index);
                                  },
                                    child: const Icon(
                                  Icons.remove,
                                  size: 15,color: Colors.red,
                                )),
                              ],
                            ),
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Total Price:',style: TextStyle(fontSize: 20),),
                Text(cartProvider.totalPriceCalculate().toString(),style: const TextStyle(fontSize: 20),),
              ],
            ),
          ),
        );
      }
    );
  }
}
