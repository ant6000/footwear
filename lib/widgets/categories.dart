import 'package:flutter/material.dart';

class CategoriesWidgets extends StatelessWidget {
  const CategoriesWidgets({super.key});

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
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'images/snikers1.png',
              height: 40,
              width: 40,
            ),
            const Text(
              'Sniker',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
