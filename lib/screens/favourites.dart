import 'package:flutter/material.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/widgets/favourite_items.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, favprovider, child) {
        return ListView.builder(
            itemCount: favprovider.favouriteProductList.length,
            itemBuilder: (context, index) {
              return FavItems(index: index);
            });
      },
    );
  }
}
