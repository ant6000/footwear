import 'package:footwear/v2/data/model/product_details_model.dart';

class CartModel{
  ProductDetailsModel productModel;
  int size;
  int quantity;
  CartModel(this.productModel, this.size, this.quantity);
}