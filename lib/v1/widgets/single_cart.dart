import 'package:flutter/material.dart';
import 'package:footwear/v1/data/model/products_model.dart';
import 'package:footwear/v1/provider/porduct_provider.dart';
import 'package:provider/provider.dart';

// class SingleCart extends StatelessWidget {
//   final int index;
//   const SingleCart({required this.index, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ProductProvider provider =
//         Provider.of<ProductProvider>(context, listen: false);
//     final ProductModel productModel = provider.cartlist[index];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         height: 130,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.amber,
//           borderRadius: BorderRadius.circular(40),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black45,
//               blurRadius: 5,
//               spreadRadius: 2,
//               offset: Offset(5, 7),
//             )
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Image.asset(productModel.imageUrl),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   productModel.title,
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 Text(provider.increamentPrice(productModel).toString(),
//                     style: const TextStyle(fontSize: 20)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       provider.increaseQuantity(index);
//                     },
//                     icon: const Icon(Icons.add)),
//                 Text(
//                   provider.quantity.toString(),
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       provider.decreaseQuantity();
//                     },
//                     icon: const Icon(Icons.remove)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class SingleCart extends StatelessWidget {
  final int index;
  const SingleCart({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Consumer<ProductProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          final ProductModel productModel = provider.cartlist[index];
          return Container(
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
                      productModel.title.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(provider.getTotalPriceForCartItem(productModel).toString(),
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          provider.quantityIncrement(index);
                        },
                        icon: const Icon(Icons.add)),
                    Text(
                      productModel.quantity.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          provider.quantityDecrement(index);
                        },
                        icon: const Icon(Icons.remove)),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
