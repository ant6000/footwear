import 'package:flutter/material.dart';

class ItemSearchBar extends StatefulWidget {
  const ItemSearchBar({super.key});

  @override
  State<ItemSearchBar> createState() => _ItemSearchBarState();
}

class _ItemSearchBarState extends State<ItemSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          contentPadding: const EdgeInsets.only(top: 1,left: 10),
        ),
      ),
    );
  }
}
