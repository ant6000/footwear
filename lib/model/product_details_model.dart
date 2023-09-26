import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsModel{
  String imageUrl;
  String title;
  String? details;
  double price;
  bool isFav;
  ProductDetailsModel({ required this.imageUrl, required this.title, this.details, required this.price, this.isFav = false, });
  
  toJson(){
    return{
      'imageUrl':imageUrl,
      'Title':title,
      'Details':details,
      'Price':price,
    };
  }

  Map<String, dynamic>toMap(){
    return{
      'imageUrl':imageUrl,
      'Title':title,
      'Details':details,
      'Price':price,
    };
  }

  factory ProductDetailsModel.fromMap(Map<String, dynamic>map)=>ProductDetailsModel(
    imageUrl: map['imageUrl'] ?? '',
    title: map['Title'] ?? '',
    details: map['Details'] ?? '',
    price: map['Price'] ?? '');

  factory ProductDetailsModel.fromSnapsot(DocumentSnapshot <Map<String, dynamic>> document) => ProductDetailsModel(
    imageUrl: document['imageUrl'] ?? '',
    title: document['Title'] ?? '',
    details: document['Details'] ?? '',
    price: document['Price'] ?? '');

}