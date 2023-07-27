import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';

class ImageSlider extends StatefulWidget {
  final ProductModel model;
  const ImageSlider({required this.model, super.key});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> images = [
    'images/snikers1.png',
    'images/snikers4.png',
    'images/snikers3.png',
    // Add more image paths here...
  ];

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = widget.model;
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                productModel.imageUrl,
                fit: BoxFit.cover,
              );
            },
            onPageChanged: _onPageChanged,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((image) {
            int index = images.indexOf(image);
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
