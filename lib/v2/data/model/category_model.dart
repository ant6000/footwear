import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String name;
  String imageUrl;
  int index;
  CategoryModel({required this.name, required this.imageUrl, required this.index});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
    name: map['name'] ?? '',
    imageUrl: map['imageUrl'] ?? '',
    index: map['index'] ?? '',);
  }

  factory CategoryModel.fromSnapsot(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      CategoryModel(
        name: document['name'] ?? '',
        imageUrl: document['imageUrl'] ?? '',
        index: document['index'] ?? '');
}
