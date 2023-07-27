import 'package:flutter/material.dart';
import 'package:footwear/model/catagory_model.dart';

class CategoriesWidgets extends StatelessWidget {
  final CatagoryModel catagoryModel;
  const CategoriesWidgets({required this.catagoryModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: GestureDetector(
        onTap: () {
          print('hello');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
  }
}
