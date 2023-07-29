import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _getProductList = [];
  
  bool isFavorite = false;
  List<ProductModel> get getProductList => _getProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getAllProductsData() {
    _isLoading = true;
    _getProductList = productList;
    _isLoading = false;
    notifyListeners();
  }

  
  void toggleFavourite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
