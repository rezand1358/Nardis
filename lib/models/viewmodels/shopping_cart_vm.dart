

import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';

 class ShoppingCartVM {

  List<ShoppingCartProductVM> products=new List();

  ShoppingCartVM({this.products})
  {
    products=new List();
  }

  double totalPrice;
  double discountPrice;
  double amountPayable;

   
}