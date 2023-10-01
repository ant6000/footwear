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

  Future showData() async {
    productList = await ShowProductDetailsRepo.showData();
    filteredProductList = productList;
    notifyListeners();
  }

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

  void searchItems(String value) {
    filteredProductList = productList
        .where((product) =>
            product.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // showImage(index) {
  //   try {
  //     var url = productList[index].imageUrl;
  //     return url;
  //   } catch (e) {
  //     debugPrint("Error loading image: $e");
  //   }
  // }



  toggleFavorite() {
    // when user clicked to like button item isFavourite will true and item will add to favorite list
    //and when user clicked to like button if the item isFavourite is true then item isfav will false and item will remove from favorite list
    if (index >= 0 && index < productList.length) {
      // Get the product at the specified index
      var product = productList[index];

      // Toggle the isFav property
      product.isFav = !(product.isFav ?? false);

      // Check if the product is now marked as a favorite
      if (product.isFav == true) {
        // Add the product to the favorite list
        favriteList.add(product);
      } else {
        // Remove the product from the favorite list
        favriteList.remove(product);
      }
      notifyListeners();
    }
  }

  addToFavoriteList() {
    favriteList.add(productList[index]);
    notifyListeners();
  }

  removeFromFavoriteList() {
    favriteList.remove(productList[index]);
    notifyListeners();
  }


  int detailsPageFromFavlist(int index){
   final id = favriteList[index].productId ;
   final targetIndex = filteredProductList.indexWhere((element) => element.productId == id);
   notifyListeners();
   return targetIndex;
  }
}
