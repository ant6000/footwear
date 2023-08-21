import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  Example({super.key});

  // Reference the root of the database
  final ref = FirebaseDatabase.instance.ref('ProductModel');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
            height: 200,
            width: 200,
            child: Image.network('https://firebasestorage.googleapis.com/v0/b/test-flutter-a0656.appspot.com/o/snikers1.png?alt=media&token=ca105ac7-ce50-435d-a540-e0f6b65a093e'),
          )
    );
  }
}
