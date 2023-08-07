class ProductModel {
  int productId;
  int quantity;
  double price;
  String title;
  String catagory;
  String imageUrl;
  bool isFavorite;
  ProductModel(
      {required this.productId,
      this.quantity = 1,
      required this.price,
      required this.catagory,
      required this.title,
      required this.imageUrl,
      this.isFavorite = false});
}

final List<ProductModel> productListM = [
  ProductModel(
      productId: 112,
      price: 1000.00,
      title: 'Snikers1',
      catagory: 'Snikers',
      imageUrl: 'images/snikers1.png'),
  ProductModel(
      productId: 113,
      price: 2000.00,
      title: 'Snikers2',
      catagory: 'Sports',
      imageUrl: 'images/snikers5.png'),
  ProductModel(
      productId: 114,
      price: 3000.00,
      title: 'Snikers3',
      catagory: 'Loper',
      imageUrl: 'images/snikers8.png'),
  ProductModel(
      productId: 115,
      price: 4000.00,
      title: 'Snikers4',
      catagory: 'Snikers',
      imageUrl: 'images/snikers4.png'),
  ProductModel(
      productId: 116,
      price: 5000.00,
      title: 'Snikers5',
      catagory: 'LifeStyle',
      imageUrl: 'images/snikers5.png'),
  ProductModel(
      productId: 117,
      price: 6000.00,
      title: 'Snikers6',
      catagory: 'Boots',
      imageUrl: 'images/snikers9.png'),
  ProductModel(
      productId: 118,
      price: 7000.00,
      title: 'Snikers7',
      catagory: 'Loper',
      imageUrl: 'images/snikers7.png'),
  ProductModel(
      productId: 119,
      price: 7000.00,
      title: 'Walking',
      catagory: 'Walking',
      imageUrl: 'images/snikers5.png'),
  ProductModel(
      productId: 120,
      price: 7000.00,
      title: 'Loper',
      catagory: 'Loper',
      imageUrl: 'images/snikers7.png'),
  ProductModel(
      productId: 121,
      price: 7000.00,
      title: 'Snikers',
      catagory: 'Snikers',
      imageUrl: 'images/snikers1.png'),
  ProductModel(
      productId: 122,
      price: 7000.00,
      title: 'Sandals',
      catagory: 'Sandals',
      imageUrl: 'images/snikers2.png'),
  ProductModel(
      productId: 123,
      price: 7000.00,
      title: 'Snikers',
      catagory: 'Snikers',
      imageUrl: 'images/snikers4.png'),
  ProductModel(
      productId: 124,
      price: 7000.00,
      title: 'Boots',
      catagory: 'Boots',
      imageUrl: 'images/snikers9.png'),
  ProductModel(
      productId: 125,
      price: 7000.00,
      title: 'Running',
      catagory: 'Running',
      imageUrl: 'images/snikers3.png'),
  ProductModel(
      productId: 126,
      price: 7000.00,
      title: 'Basketball',
      catagory: 'Basketball',
      imageUrl: 'images/snikers6.png'),
  ProductModel(
      productId: 127,
      price: 7000.00,
      title: 'Loper',
      catagory: 'Loper',
      imageUrl: 'images/snikers7.png'),
  ProductModel(
      productId: 128,
      price: 7000.00,
      title: 'Sandals',
      catagory: 'Sandals',
      imageUrl: 'images/snikers2.png'),
];

List<ProductModel> get getProductListM {
  return [...productListM];
}
