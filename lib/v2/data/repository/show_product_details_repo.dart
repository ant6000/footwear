
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:footwear/v2/data/model/product_details_model.dart';

class ShowProductDetailsRepo{
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String productCollection = 'Products Data';

  static Future<List<ProductDetailsModel>> showData()async{
    try {
      var snapshot = await _database.collection(productCollection).get();
      return snapshot.docs.map((docSnapshot) => ProductDetailsModel.fromSnapsot(docSnapshot)).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  
}