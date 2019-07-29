import 'package:flutter/widgets.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/models/viewmodels/product_list_vm.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/ui/product/products_list.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class SearchResultScreen extends StatefulWidget {


  @override
  SearchResultState createState() {
    return SearchResultState();
  }
}

class SearchResultState extends State<SearchResultScreen> {

  List<ProductSummary> products=new List();
  ProductListVM productListVM=new ProductListVM();
  @override
  void initState() {
    super.initState();
    productListVM.products=repository.getSearchProductsListFromCategoryMap();
    productListVM.isFromCart=false;
    productListVM.catItem=new CategoryItem('', '', '', SoapOpersConstants.SEARCHDONE, '');
  }

  @override
  Widget build(BuildContext context) {
    return ProductsList(item: this.productListVM);
  }

}