import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';
import 'package:footwear/provider/porduct_provider.dart';
import 'package:footwear/screens/product_details.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  final ProductModel productModel;
  const CustomCard({
    super.key,
    required this.productModel,
  });
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _gotoDetailsPage() {
    ProductModel mm = widget.productModel;
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(
                    model: mm,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductModel model = widget.productModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: _gotoDetailsPage,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 5,
                spreadRadius: 2,
                blurStyle: BlurStyle.normal,
                offset: Offset(7, 10),
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                        onTap: _toggleFavorite,
                        child: Icon(
                          _isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _isFavorite ? Colors.pink : Colors.black,
                        )),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: Colors.amber,
                    ),
                  ),
                  Image.asset(
                    model.imageUrl,
                    width: 220,
                    height: 150,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                model.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Comfortable and felxible',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '\$${model.price.toString()}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
