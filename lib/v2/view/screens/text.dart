import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image.network(
  'https://firebasestorage.googleapis.com/v0/b/test-flutter-a0656.appspot.com/o/antor.png?alt=media',
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
          : null,
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Text('Error loading image');
  },
)


    );
  }
}