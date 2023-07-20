import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //for (int i = 1; i < 10; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/snikers1.png',
                    height: 40,
                    width: 50,
                  ),
                  const Text(
                    'Sniker',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
