import 'package:flutter/material.dart';

class MyWidgets extends StatelessWidget {
  const MyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 10; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(5, 5))
                    ]),
                child: GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Image.asset(
                        'images/snikers1.png',
                        height: 40,
                        width: 40,
                      ),
                      const Text(
                        'Sniker',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
