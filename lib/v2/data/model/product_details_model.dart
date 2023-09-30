import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsModel {
  String productId;
  String imageUrl;
  String title;
  String? details;
  double price;
  String category;
  bool? isFav;
  bool isAdded;
  ProductDetailsModel(
      {required this.productId,
      required this.imageUrl,
      required this.title,
      this.details,
      required this.price,
      required this.category,
      this.isFav,
      this.isAdded = false});

  toJson() {
    return {
      'ProductId': productId,
      'imageUrl': imageUrl,
      'Title': title,
      'Details': details,
      'Price': price,
      'category': category,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'ProductId': productId,
      'imageUrl': imageUrl,
      'Title': title,
      'Details': details,
      'Price': price,
      'category': category,
    };
  }

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) =>
      ProductDetailsModel(
          productId: map['ProductId'] ?? '',
          imageUrl: map['imageUrl'] ?? '',
          title: map['Title'] ?? '',
          details: map['Details'] ?? '',
          price: map['Price'] ?? '',
          category: map['category'] ?? '');

  factory ProductDetailsModel.fromSnapsot(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      ProductDetailsModel(
          productId: document['ProductId'] ?? '',
          imageUrl: document['imageUrl'] ?? '',
          title: document['Title'] ?? '',
          details: document['Details'] ?? '',
          price: document['Price'] ?? '',
          category: document['categoty'] ?? '');
}
