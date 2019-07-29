import 'package:nardis/models/viewmodels/product_summary_vm.dart';

class ProductDetailsVM {

  ProductSummary productSummary;
  int position;

  ProductDetailsVM({this.productSummary,this.position});

  ProductDetailsVM.map(Map<String, dynamic> obj)
 {
    this.position=obj["position"];
 }
 
 Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["position"]=this.position;
    return map;
  }
}