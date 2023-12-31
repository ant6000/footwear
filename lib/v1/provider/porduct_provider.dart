import 'package:flutter/material.dart';
import 'package:footwear/v1/data/model/catagory_model.dart';
import 'package:footwear/v1/data/model/products_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productListP => _productList;

  final List<ProductModel> _favouriteProductList = [];
  List<ProductModel> get favouriteProductList => _favouriteProductList;

  final List<ProductModel> _cartList = [];
  List<ProductModel> get cartlist => _cartList;

  List<ProductModel> _filteredProductList = getProductListM;
  List<ProductModel> get filteredProductList => _filteredProductList;

  List<ProductModel> defaultProductList = [];
  List<CatagoryModel> categoriesList = getCategoriesList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isCartOpen = true;
  bool get isCartOpen => _isCartOpen;

  String dropDownValue = 'default';

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
      if (_productList[index].isFavorite) {
        addToFavlist(index);
      } else {
        removeFromFavlist(index);
      }
      notifyListeners();
    }
  }

  void addToFavlist(int index) {
    _favouriteProductList.add(productListP[index]);
  }

  void removeFromFavlist(int index) {
    _favouriteProductList.remove(productListP[index]);
  }

  bool toggleCart() {
    _isCartOpen = !_isCartOpen;
    notifyListeners();
    return _isCartOpen;
  }

  void addToCart(int index) {
    _cartList.add(filteredProductList[index]);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartList.remove(filteredProductList[index]);
    notifyListeners();
  }

  void quantityIncrement(int index) {
    _cartList[index].quantity++;
    notifyListeners();
  }

  quantityDecrement(int index) {
    _cartList[index].quantity--;
    notifyListeners();
  }

  double getTotalPriceForCartItem(ProductModel product) {
    return product.quantity * product.price;
  }

  double totalPrice() {
    double totalprice = 0.0;
    for (var element in cartlist) {
      totalprice += element.quantity * element.price;
    }
    return totalprice;
  }

  void onCategorySelected(int index) {
    int selectedCategoryIndex = index;
    if (index == 0) {
      _filteredProductList = productListM;
    } else {
      _filteredProductList = productListM
          .where((product) =>
              product.catagory == categoriesList[selectedCategoryIndex].name)
          .toList();
    }
    notifyListeners();
  }

  void categoriesSelect(int index) {
    for (int i = 0; i < categoriesList.length; i++) {
      categoriesList[i].isSelected = (i == index);
      notifyListeners();
    }
  }

  void sorting(String value) {
    if (value == 'high') {
      _filteredProductList.sort((a, b) => b.price.compareTo(a.price));
    } else if (value == 'low') {
      _filteredProductList.sort((a, b) => a.price.compareTo(b.price));
    } else {}
    notifyListeners();
  }

  void search(String value) {
    _filteredProductList = productListP
        .where((product) =>
            product.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
