
import 'dart:collection';
import 'dart:convert';

import 'package:nardis/models/order.dart';
import 'package:nardis/models/orderdetails.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/models/viewmodels/shopping_cart_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/repository/user/user_repository.dart';

class OrderRepository {

  static final OrderRepository _repository = new OrderRepository._internal();

  factory OrderRepository(){
    return _repository;
  }

  OrderRepository._internal();

  String topMessage='بدون متن';
   List<ProductCategoryModel> categoryList=new List();
   List<ProductCategoryModel> brandCategoryList=new List();
   HashMap<String,List<ProductSummary>> mapOfProductsInCategory=new HashMap();
   HashMap<String,List<ProductCategoryModel>> mapOfGroupsInCategory=new HashMap();
   HashMap<String,List<ProductSummary>> mapOfProductOffers=new HashMap();
   HashMap<String,List<ProductSummary>> mapOfSubProducts=new HashMap();

  //List<ShoppingCartProductVM> listOfProductsInShoppingList=new List();
  ShoppingCartVM shoppingCartVM=new ShoppingCartVM();

  Future<String> createJsonSaveOrder() async
  {
    UserRepository userRepository=new UserRepository();
    String jsonResult='';
    List<Order> orders=new List();
    Order order=new Order();
    //orders.add(new Order());
    order.customerId=num.parse (await userRepository.getUserCode()).toInt();
    List<ShoppingCartProductVM> products=repository.getListOfProductsInShoppingList();
    products.forEach((sp)   {
      OrderDetails orderDetails=new OrderDetails();
      orderDetails.AllT= sp.count;
      orderDetails.ObjectId=sp.code;
      orderDetails.Price=num.parse( sp.priceB).toDouble();
      order.orderDetails.add(orderDetails);
    
    }
    );

    orders.add(order);
    jsonResult=jsonEncode(orders.map((o) => o.toMap()).toList());
    return Future.value(jsonResult);
  }


  setListOfShoppingCartProductsIntoShoppingCart(List<ShoppingCartProductVM> products)
  {
    this.shoppingCartVM.products=products;
  }

 List<ShoppingCartProductVM> getShoppingListOfProductsInShoppingCart()
  {
    return this.shoppingCartVM.products;
  }

 

 ShoppingCartVM getShoppingCartVM()
 {
   return this.shoppingCartVM;
 }

HashMap<String, List<ProductSummary>>  getListOfProductOffers()
  {
    return this.mapOfProductOffers;
  }

HashMap<String, List<ProductSummary>>  getListOfSubProducts()
  {
    return this.mapOfSubProducts;
  }

  setProductOffers(List<ProductSummary> offers,String key)
  {
      getListOfProductOffers().putIfAbsent(key, () => offers );
      getMapOfProductsInCategory().putIfAbsent(key, () => getListOfProductOffers()[key] );
  }

   setSubProducts(List<ProductSummary> products,String key)
  {
      getListOfSubProducts().putIfAbsent(key, () => products );
      getMapOfProductsInCategory().putIfAbsent(key, () => getListOfSubProducts()[key] );
  }
 Map<String,List<ProductSummary>> getMapOfProductsInCategory()
  {
    return this.mapOfProductsInCategory;
  }

 Map<String,List<ProductCategoryModel>> getMapOfGroupsInCategory()
  {
    return this.mapOfGroupsInCategory;
  }

  setMapOfProductsInCategory(HashMap<String,List<ProductSummary>> mapOfProductsInCategory)
  {
    this.mapOfProductsInCategory=mapOfProductsInCategory;
  }

 List<ProductCategoryModel> getListOfCategory()
  {
    return this.categoryList;
  }

  List<ProductCategoryModel> getListOfBrandCategory()
  {
    return this.brandCategoryList;
  }
  setListOfCategory(List<ProductCategoryModel> categoryList)
  {
    this.categoryList=categoryList;
  }
  setListOfBrandCategory(List<ProductCategoryModel> categoryList)
  {
    this.brandCategoryList=categoryList;
  }


}

OrderRepository orderRepository=new OrderRepository();