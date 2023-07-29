class ProductModel {
  String productId;
  String title;
  double price;
  String imageUrl;
  bool isFavorite;
  ProductModel(
      {required this.productId, required this.title, required this.price, required this.imageUrl, this.isFavorite = false});
}

final List<ProductModel> productList = [
  ProductModel(productId: '1122', title: 'Snikers1', price: 1000.00, imageUrl: 'images/snikers1.png'),
  ProductModel(productId: '1122', title: 'Snikers2', price: 2000.00, imageUrl: 'images/snikers5.png'),
  ProductModel(productId: '1122', title: 'Snikers3', price: 3000.00, imageUrl: 'images/snikers3.png'),
  ProductModel(productId: '1122', title: 'Snikers5', price: 4000.00, imageUrl: 'images/snikers5.png'),
  ProductModel(productId: '1122', title: 'Snikers6', price: 5000.00, imageUrl: 'images/snikers6.png'),
  ProductModel(productId: '1122', title: 'Snikers7', price: 6000.00, imageUrl: 'images/snikers7.png'),
  ProductModel(productId: '1122', title: 'Snikers4', price: 7000.00, imageUrl: 'images/snikers4.png'),
];

List<ProductModel> get getProductList{
  return [...productList];
}
