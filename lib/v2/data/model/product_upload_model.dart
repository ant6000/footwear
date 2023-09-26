class UploadModel {
  String imageUrl;
  String productId;
  String title;
  String details;
  double price;
  String catagory;
  UploadModel(
      {required this.imageUrl,
      required this.productId,
      required this.title,
      required this.details,
      required this.price,
      required this.catagory});

  tojson() {
    return {
      'imageUrl': imageUrl,
      'ProductId': productId,
      'Title': title,
      'Details': details,
      'Price': productId,
      'categoty': catagory,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'ProductId': productId,
      'Title': title,
      'Details': details,
      'Price': price,
      'categoty': catagory,
    };
  }

    factory UploadModel.fromMap(Map<String, dynamic>map)=> UploadModel(
  
    imageUrl: map['imageUrl'] ?? '',
    productId: map['ProductId'] ?? '',
    title: map['Title'] ?? '',
    details: map['Details'] ?? '',
    price: map['Price'] ?? '',
    catagory: map['categoty'] ?? '',
    );

}
