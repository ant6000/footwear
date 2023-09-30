import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:footwear/v2/data/model/category_model.dart';
import 'package:footwear/v2/data/model/product_details_model.dart';

class ShowProductDetailsRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String productCollection = 'Products Data';
  static String categoryCollection = 'Catagory';

  static Future<List<ProductDetailsModel>> showData() async {
    try {
      var snapshot = await _database.collection(productCollection).get();
      return snapshot.docs
          .map((docSnapshot) => ProductDetailsModel.fromSnapsot(docSnapshot))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static Future<List<CategoryModel>> showCategory() async {
    try {
      var snapshot = await _database.collection(categoryCollection).get();
      return snapshot.docs
          .map((docSnapshot) => CategoryModel.fromSnapsot(docSnapshot))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
