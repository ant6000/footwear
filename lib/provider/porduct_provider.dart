import 'package:flutter/material.dart';
import 'package:footwear/model/products_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productListP => _productList;
  List<ProductModel> _favouriteProductList = [];
  List<ProductModel> get favouriteProductList => _favouriteProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getAllProductsData() {
    _isLoading = true;
    _productList = getProductListM;
    _isLoading = false;
    notifyListeners();
  }

  void addToFavourites(int productId) {
    final index =
        _productList.indexWhere((product) => product.productId == productId);
    if (index != -1) {
      _productList[index].isFavorite = !_productList[index].isFavorite;
      //addToFavlist(index);
      notifyListeners();
    }
    if (_productList[index].isFavorite) addToFavlist(index);
    if (!_productList[index].isFavorite) removeFromFavlist(index);
  }

  void addToFavlist(int index) {
    _favouriteProductList.add(productListP[index]);
  }

  void removeFromFavlist(int index) {
    _favouriteProductList.remove(productListP[index]);
  }

}
