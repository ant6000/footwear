import 'package:flutter/material.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:provider/provider.dart';

class FavItems extends StatefulWidget {
  const FavItems({super.key});

  @override
  State<FavItems> createState() => _FavItemsState();
}

class _FavItemsState extends State<FavItems> {
  @override
  Widget build(BuildContext context) {
  ProductProvider provider =Provider.of<ProductProvider>(context, listen: false);
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
                  offset: Offset(7, 10),
                )
              ]),
          child: const Column(
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/snikers1.png'),
              ),
              SizedBox(height: 0),
              Text(
                'provider',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '1000.00',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
