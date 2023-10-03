import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:footwear/v2/data/model/category_model.dart';
import 'package:footwear/v2/data/model/product_details_model.dart';
import 'package:footwear/v2/data/repository/show_product_details_repo.dart';

class ShowProductDetailsProvider extends ChangeNotifier {
  List<ProductDetailsModel> productList = [];
  int index = -1;
  String productId = '';

  List<ProductDetailsModel> favriteList = [];

  List<CategoryModel> categoryList = [];

  List<ProductDetailsModel> filteredProductList = [];

  int selectedCategoryIndex = 0;

  Set<String> favoriteProductIds = Set<String>();

  // data comess from firebase
  Future showData() async {
    productList = await ShowProductDetailsRepo.showData();
    filteredProductList = productList;
    notifyListeners();
  }

  // data comess from firebase
  Future showCategoryList() async {
    categoryList = await ShowProductDetailsRepo.showCategory();
    categoryList.sort((a, b) => a.index.compareTo(b.index));
    notifyListeners();
  }

  onCategorySelected(int index) {
    selectedCategoryIndex = index;
    if (selectedCategoryIndex == 0) {
      filteredProductList = productList;
    } else {
      filteredProductList = productList
          .where((product) =>
              product.category == categoryList[selectedCategoryIndex].name)
          .toList();
    }
    notifyListeners();
  }

  // searching items on favourite list
  void searchItems(String value) {
    filteredProductList = productList
        .where((product) =>
            product.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // Toggle favorite status for a product by its productId
  void toggleFavorite(String productId) {
    if (favoriteProductIds.contains(productId)) {
      // If the product is already in favorites, remove it
      favoriteProductIds.remove(productId);
      removeFromFavoriteList(index);
    } else {
      // If the product is not in favorites, add it
      favoriteProductIds.add(productId);
      addToFavoriteList();
    }
    notifyListeners();
  }

  // Check if a product is in favorites by its productId
  bool isProductFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  addToFavoriteList() {
    favriteList.add(filteredProductList[index]);
    notifyListeners();
  }

  removeFromFavoriteList(int index) {
    favriteList.remove(favriteList[index]);
    notifyListeners();
  }

  int detailsPageFromFavlist(int index) {
    //final id = favriteList[index].productId ;
    final targetIndex = filteredProductList.indexWhere(
        (element) => element.productId == favriteList[index].productId);
    notifyListeners();
    return targetIndex;
  }
}
