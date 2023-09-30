import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear/v2/data/model/product_upload_model.dart';

class FirebaseUploadRepository {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static String productCollection = 'Products Data';

  static Future uploadProduct(String imageUrl, String productId, String title,
      String details, double price, String catagory) async {
    try {
      final addModel = UploadModel(
          imageUrl: imageUrl,
          productId: productId,
          title: title,
          details: details,
          price: price,
          catagory: catagory,);

      _firebaseFirestore
          .collection(productCollection)
          .doc(productId)
          .set(addModel.toMap())
          .onError((error, stackTrace) =>
              debugPrint("Error writing document: $error"));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
