import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';
import 'package:footwear/widgets/image_slider.dart';
import 'package:footwear/widgets/size_selector.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel model;
  const ProductDetails({required this.model, super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductModel pmodel = widget.model;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nike'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      //double screenWidth = MediaQuery.of(context).size.width;
      // double screenHeight = MediaQuery.of(context).size.height;
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ImageSlider(model:pmodel),
              const SizedBox(height: 10),
              Text(
                pmodel.title,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Built for natural motion, the Nike flex shoes',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Size: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  // for (int i = 1; i < 5; i++)
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 10),
                  //   child: Selector(),
                  // ),
                  Selector(),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Available Colors: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: colors[i],
                      ),
                    )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: ${pmodel.price}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        Text('Add to Cart')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
