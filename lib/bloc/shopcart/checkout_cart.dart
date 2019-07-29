
import 'package:nardis/bloc/shopcart/cart_model.dart';

class CheckOutCart {


  Stream<CartModel> checkOut(Future<CartModel> cartModel)
  {
    return Stream.fromFuture(cartModel);
  }
}