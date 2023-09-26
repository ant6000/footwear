import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footwear/repository/upload_repo.dart';

class UploadProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> uploadData(String imageUrl, String productId, String title,
      String details, double price, String catagory) async {
    try {
      isLoading = true;
      notifyListeners();
      FirebaseUploadRepository.uploadProduct(
          imageUrl, productId, title, details, price, catagory);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('error form provider ${e.toString()}');
      return false;
    }
  }
}
