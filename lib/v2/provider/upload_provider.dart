import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footwear/repository/upload_repo.dart';

class UploadProvider extends ChangeNotifier {
  Future<bool> uploadData(String imageUrl, String productId, String title,
      String details, double price, String catagory) async {
    try {
      FirebaseUploadRepository.uploadProduct(
          imageUrl, productId, title, details, price, catagory);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
