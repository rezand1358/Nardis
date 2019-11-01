import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';

import 'package:nardis/bloc/shopcart/shoppingcart.dart';
import 'package:nardis/data/database_helper.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_save_order.dart';
import 'package:nardis/models/shopcart_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/models/viewmodels/shopping_cart_product_vm.dart';
import 'package:nardis/repository/order/order_repository.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/repository/search/search_provider.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc implements BlocBase {
  static const String TAG = "SearchBloc";
   SearchProvider _searchProvider;// = new SearchProvider();
  String query='';

  /// Sinks
  Sink<String> get addition => itemAdditionController.sink;
  final itemAdditionController = StreamController<String>();

  Sink<ProductSummary> get product => getProductController.sink;
  final getProductController = StreamController<ProductSummary>();

  Sink<List<ProductSummary>> get products => getProductsController.sink;
  final getProductsController = StreamController<List<ProductSummary>>();

  /// Streams
  Stream<String> get queryStream => _search.stream;
  Stream<List<ProductSummary>> get productsStream => _searchProducts.stream;
  Stream<ProductSummary> get productStream => _searchProduct.stream;

  final _search = BehaviorSubject<String>();
  final _searchProducts = BehaviorSubject<List<ProductSummary>>();
  final _searchProduct = BehaviorSubject<ProductSummary>();


  SearchBloc() {
    _searchProvider=new SearchProvider();
    itemAdditionController.stream.listen(handleSearch);
    getProductsController.stream.listen(handleSearchProducts);
    getProductController.stream.listen(handleSearchProduct);
  }

  ///
  /// Logic for search query
  ///
  void handleSearch(String query) {
    Logger(TAG).info("Add product to the shopping cart");
    this._searchProvider.search(query,this,null);
    return;
  }

  void handleSearchProducts(List<ProductSummary> products) {
    Logger(TAG).info("Search Products Loaded");
    // products.addAll(products);
    _searchProducts.add(products);
    return;
  }


  void handleSearchProduct(ProductSummary product) {
    Logger(TAG).info("Search Products Loaded");
    _searchProduct.add(product);
    return;
  }

  ///
  /// Clears the shopping cart
  ///
  void clearQuery() {
    query='';
  }




  @override
  void dispose() {
    itemAdditionController.close();
    getProductController.close();
    getProductsController.close();
  }
}