import 'package:flutter/material.dart';
import 'package:footwear/widgets/favourite_items.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _itemIncrese(),
        itemBuilder: (context, index) {
          return const FavItems();
        });
  }

  int _itemIncrese() {
    setState(() {
      count += 1;
    });
    return count;
  }
}
