import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/widgets/appbar_collapse.dart';

class ProductListVM {

  CategoryItem catItem;
  List<ProductSummary> products=new List();
  bool isFromCart=false;

  ProductListVM({this.products,this.catItem,this.isFromCart});
}