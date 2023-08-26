import 'package:flutter/material.dart';

class ItemSearchBar extends StatelessWidget {
  //final ProductProvider provider;
  ItemSearchBar({super.key, /*required this.provider*/});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          //provider.search(value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search here',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          contentPadding: const EdgeInsets.only(top: 1, left: 10),
        ),
      ),
    );
  }
}
