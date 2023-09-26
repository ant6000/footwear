import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:footwear/model/product_details_model.dart';

class ShowProductDetailsRepo{
  static final FirebaseFirestore _databses = FirebaseFirestore.instance;

  static String productCollection = 'Products Data';

  static Future<List<ProductDetailsModel>> showData()async{
    try {
      var snapshot = await _databses.collection(productCollection).get();
      return snapshot.docs.map((docSnapshot) => ProductDetailsModel.fromSnapsot(docSnapshot)).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  
}