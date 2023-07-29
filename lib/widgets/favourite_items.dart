import 'package:flutter/material.dart';

class FavItems extends StatefulWidget {
  const FavItems({super.key});

  @override
  State<FavItems> createState() => _FavItemsState();
}

class _FavItemsState extends State<FavItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  spreadRadius: 2,
                  //blurStyle: BlurStyle.normal,
                  offset: Offset(7, 10),
                )
              ]),
          child: const Column(
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/snikers1.png'),
              ),
              SizedBox(height: 10),
              Text('Snikers1',style: TextStyle(
                fontSize: 20,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
