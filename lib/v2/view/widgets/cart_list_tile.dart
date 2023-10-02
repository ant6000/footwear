import 'package:flutter/material.dart';

class CartListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final Function() qunatityIncrease;
  final Function() qunatityDecrease;

  const CartListTile(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.quantity,
      required this.qunatityIncrease,
      required this.qunatityDecrease,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(imageUrl),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                ),
                Text(price.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04)),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                  onPressed: qunatityIncrease,
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                  )),
              Text(quantity.toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04)),
              IconButton(
                  onPressed: qunatityDecrease,
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
