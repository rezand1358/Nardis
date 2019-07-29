import 'dart:io';

import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';

class ShoppingCart {
  List<ShoppingCartProductVM> products = [];
  double priceNet;
  //double priceGross;
  double countAmount;

  void addProduct(ShoppingCartProductVM p) {
    bool exist=false;
    if(products!=null &&
    products.length>0)
    {
       List<ShoppingCartProductVM> item_in_cart=products.where((s) => s.code==p.code).toList();
        if(item_in_cart!=null &&
        item_in_cart.length>0)
        {
          int indx=products.indexOf(item_in_cart[0]);
          if(indx>-1)
          {
            products[indx].count=/*products[indx].count+*/p.count;
            repository.getListOfProductsInShoppingList()[indx].count=/*repository.getListOfProductsInShoppingList()[indx].count+*/p.count;
            exist=true;
          }
          else{
            exist=false;
          }
        }
        else{
          exist=false;
        }
    }
    else{
      exist=false;
    }
    if(!exist){
      if(p.name.isEmpty)
        {

        }
          products.add(p);
          repository.getListOfProductsInShoppingList().add(p);

    }

  }

  void remProduct(ShoppingCartProductVM p) {
    if(products!=null &&
    products.length>0)
    {
       List<ShoppingCartProductVM> item_in_cart=products.where((s) => s.code==p.code).toList();
        if(item_in_cart!=null &&
        item_in_cart.length>0)
        {
          int indx=products.indexOf(item_in_cart[0]);
          if(indx>-1)
          {
            if(products[indx].count>0){
              products[indx].count=p.count;
              repository.getListOfProductsInShoppingList()[indx].count=p.count;
            }
            else{
              products.removeAt(indx);
              repository.getListOfProductsInShoppingList().removeAt(indx);
            }
          }
          else{
            //products.remove(p);
          }      
       }
    }
    //products.remove(p);
  }

  void calculate() {
    priceNet = 0;
    
    countAmount = 0;
    products.forEach((p) {
      priceNet +=((num.parse( p.priceB).toDouble())*p.count);
      countAmount += p.count;
    });
  }

  void clear() {
    products = [];
    priceNet = 0;
    //priceGross = 0;
    countAmount = 0;
  }
}