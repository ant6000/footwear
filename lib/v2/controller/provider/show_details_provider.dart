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

  Set<String> likedProductIds = <String>{};

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

  void toggleLike(String productId) {
    if (likedProductIds.contains(productId)) {
      likedProductIds.remove(productId);
      removeFromFavList(productId);
    } else {
      likedProductIds.add(productId);
      addToFavoriteList(filteredProductList[index]);
    }
    notifyListeners();
  }

  bool isProductLiked(String productId) {
    return likedProductIds.contains(productId);
  }

  addToFavoriteList(ProductDetailsModel model) {
    favriteList.add(model);
    notifyListeners();
  }

  removeFromFavList(String productId) {
    final targetIndex = favriteList
        .indexWhere((element) => element.productId == productId);
    print(targetIndex);
    favriteList.remove(favriteList[targetIndex]);
    likedProductIds.remove(productId);
    notifyListeners();
  }

  int detailsPageFromFavlist(int index) {
    final targetIndex = filteredProductList.indexWhere(
        (element) => element.productId == favriteList[index].productId);
    notifyListeners();
    return targetIndex;
  }
}
