class ProductModel {
  String productId ;
  String title;
  double price;
  String imageUrl;

  ProductModel(
      {this.productId = '', required this.title, required this.price, required this.imageUrl});
}

final List<ProductModel> productList = [
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
  ProductModel(title: 'Snikers', price: 1000.00, imageUrl: ''),
];
