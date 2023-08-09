import 'package:flutter/material.dart';
import 'package:footwear/model/catagory_model.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:provider/provider.dart';

class CategoriesWidgets extends StatelessWidget {
  final CatagoryModel catagoryModel;
  final Function(int) oncategorySelected;
  final int index;
  const CategoriesWidgets(
      {required this.catagoryModel,
      required this.oncategorySelected,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
            color: provider.categoriesList[index].isSelected
                ? Colors.blue
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(3, 5))
            ],
          ),
          child: InkWell(
            onTap: () {
              provider.categoriesSelect(index);
              oncategorySelected(catagoryModel.index);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  catagoryModel.imageUrl,
                  height: 40,
                  width: 40,
                ),
                Text(
                  catagoryModel.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
