import 'package:flutter/material.dart';
import 'package:footwear/widgets/image_slider.dart';
import 'package:footwear/widgets/size_selector.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const ImageSlider(),
              Text(
                'Nike Air Max 200',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Size: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  for (int i = 1; i < 5; i++)
                  SizeSilector(),
                  // for (int i = 1; i < 5; i++)
                  //   Padding(
                  //     padding: const EdgeInsets.all(2.0),
                  //     child: ElevatedButton(
                  //         onPressed: _toggleSelection,
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor:
                  //               _isSelected ? Colors.blue : Colors.white,
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 20, vertical: 10),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //         ),
                  //         child: Text('US  ${5 + i}')),
                  //   ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Available Colors: ',
                    style: TextStyle(
                      fontSize: 16,
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                      'Price: 500.00\$',
                      style: TextStyle(
                        fontSize: 20,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
