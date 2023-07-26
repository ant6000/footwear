class ProductModel {
  String productId ;
  String title;
  double price;
  String imageUrl;

  ProductModel(
      {this.productId = '', required this.title, required this.price, required this.imageUrl});
}

final List<ProductModel> productList = [
  ProductModel(title: 'Snikers1', price: 1000.00, imageUrl: 'images/snikers1.png'),
  ProductModel(title: 'Snikers2', price: 1000.00, imageUrl: 'images/snikers5.png'),
  ProductModel(title: 'Snikers3', price: 1000.00, imageUrl: 'images/snikers3.png'),
  ProductModel(title: 'Snikers5', price: 1000.00, imageUrl: 'images/snikers5.png'),
  ProductModel(title: 'Snikers6', price: 1000.00, imageUrl: 'images/snikers6.png'),
  ProductModel(title: 'Snikers7', price: 1000.00, imageUrl: 'images/snikers7.png'),
  ProductModel(title: 'Snikers4', price: 1000.00, imageUrl: 'images/snikers4.png'),
];

List<ProductModel> get getProductList{
  return [...productList];
}
