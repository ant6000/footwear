import 'package:flutter/material.dart';
import 'package:footwear/v1/data/model/catagory_model.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';
import 'package:footwear/v2/data/model/product_details_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String title;
  final double price;
  const ProductCard(
      {required this.index,
      required this.imageUrl,
      required this.title,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowProductDetailsProvider>(
        builder: (context, provider, _) {
      return GestureDetector(
        onTap: () {
          provider.index = index;
          Navigator.pushNamed(context, '/detailsPage');
        },
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(244, 67, 54, 1)),
                      child: const Text('-30%'),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.index = index;
                        String productId =
                            provider.filteredProductList[index].productId;
                            provider.toggleLike(productId); // Toggle favorite status
                      },
                      child: Icon(
                        provider.isProductLiked(provider.filteredProductList[index].productId)
                            ? Icons
                                .favorite // If the item is in the favorite list, show the filled heart icon
                            : Icons
                                .favorite_border_outlined, // If not, show the outlined heart icon
                        color: provider.isProductLiked(provider.filteredProductList[index].productId)
                            ? Colors
                                .pink // If the item is in the favorite list, use the pink color
                            : Colors.black, // If not, use the black color
                      ),
                    )
                  ],
                ),
                Expanded(
                    flex: 2,
                    child: CircleAvatar(
                        radius: 100,
                        child: imageUrl.isNotEmpty
                            ? Image.network(imageUrl)
                            : const CircularProgressIndicator())),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            letterSpacing: 1,
                            height: 1),
                      ),
                      Text(
                        '$price \$',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
