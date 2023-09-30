import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';
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
    final provider =
        Provider.of<ShowProductDetailsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        provider.index = index;
        Navigator.pushNamed(context, '/detailsPage');
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
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
                      provider.toggleFavorite();
                    },
                    child: Icon(
                      provider.filteredProductList[index].isFav == true
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: provider.filteredProductList[index].isFav == true
                          ? Colors.pink
                          : Colors.black,
                    ),
                  )
                ],
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(365),
                        color: Colors.lightBlue),
                    child: imageUrl.isNotEmpty
                        ? Image.asset('images/snikers1.png')
                        : Image.network(imageUrl),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '$price \$',
                      style: const TextStyle(fontSize: 20),
                    ),
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
