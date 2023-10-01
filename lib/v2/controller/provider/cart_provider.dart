import 'package:flutter/material.dart';
import 'package:footwear/v2/data/model/cart_model.dart';

class CartProvider extends ChangeNotifier{
  List <CartModel> cartlist = [];
  bool isAdded = false;

  addToCart(CartModel model){
    cartlist.add(model);
    totalPriceCalculate();
    notifyListeners();
  }
   removeFromCart(CartModel model){
     cartlist.remove(model);
    notifyListeners();
  }
    toggleIsAdded() {
    isAdded = !isAdded;
    notifyListeners();
  }

  increseQuantity(int index){
    if(cartlist[index].quantity < 10){
    cartlist[index].quantity++;
    totalPriceCalculate();
    }
    notifyListeners();
  }
  decreseQuantity(int index){
    if(cartlist[index].quantity > 1){
    cartlist[index].quantity--;
    totalPriceCalculate();
    }
    notifyListeners();
  }
  double totalPriceCalculate(){
  double totalPrice = 0.0;
    for(var element in cartlist){
      totalPrice += element.quantity * element.productModel.price;
    }
    return totalPrice;
  }
}
