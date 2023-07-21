import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _getProductList = [];
  List<ProductModel> get getProductList => _getProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getAllProductsData() {
    _isLoading = true;
    _getProductList = productList;
    _isLoading = false;
    notifyListeners();
  }
}
