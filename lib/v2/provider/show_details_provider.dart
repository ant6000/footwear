import 'package:flutter/material.dart';
import 'package:footwear/v2/data/model/product_details_model.dart';
import 'package:footwear/v2/data/repository/show_product_detailsRepo.dart';

class ShowProductDetailsProvider extends ChangeNotifier{

  List<ProductDetailsModel> productList = [];
  int index = -1;

  Future showData()async {
    productList = await ShowProductDetailsRepo.showData();
    notifyListeners();
  }

  showImage(index){
    try {
        var url = productList[index].imageUrl;
        return url;
    } catch (e) {
        print("Error loading image: $e");
    }
  }


}