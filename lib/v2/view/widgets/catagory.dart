import 'package:flutter/material.dart';
import 'package:footwear/v2/controller/provider/show_details_provider.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final int index;
  const CategoryButton({required this.text, required this.index, super.key});
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ShowProductDetailsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        print('clicked $index');
        provider.onCategorySelected(index);
      },
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
        child: Center(child: Text('   $text   ')),
      ),
    );
  }
}
