import 'package:flutter/material.dart';
import 'package:footwear/model/product_details_model.dart';
import 'package:footwear/repository/show_product_details_repo.dart';

class ShowProductDetailsProvider extends ChangeNotifier{

  List<ProductDetailsModel> productList = [];


  Future showData()async {
    productList = await ShowProductDetailsRepo.showData();
    notifyListeners();
  }

}