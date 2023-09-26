import 'package:flutter/material.dart';
import 'package:footwear/v2/data/model/cart_model.dart';

class CartProvider extends ChangeNotifier{
  List <CartModel> cartlist = [];

  addToCart(CartModel model){
    cartlist.add(model);
    print('added ${cartlist.length}');
    notifyListeners();
  }
  removeFromCart(CartModel model){
    cartlist.add(model);
    notifyListeners();
  }
}
