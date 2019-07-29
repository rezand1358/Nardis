
import 'dart:collection';

import 'package:nardis/models/shopcart_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';

 class ShoppingCartProductVM extends ProductSummary
{
  ShoppingCartProductVM(int count, String name, String code, String allt, String priceB, String priceC, String description) : super(name: name,code: code,allt: allt,priceB: priceB,priceC: priceC,description: description)
  {
    Map<int, int> countList = new HashMap<int,int>();
    int index=1;
        for (int i = 1; i <= 30; i++)
        {


            countList.putIfAbsent(i, () => i);
        }
        shoppingCartCounts=countList;
        this.count=count;
  }
  
  int shoppingCartCount;
  int count;
  String catKey;

  Map<int,int> shoppingCartCounts;


  //int get ShoppingCartCount => shoppingCartCount;
  //int get Count => count;


ShoppingCartProductVM.map(dynamic obj)
  {
    //var map = new Map<String, dynamic>();
    this.name=obj["Name"];
    this.code=obj["Code"];
    this.priceB=obj["PriceB"];
    this.priceC=obj["PriceC"];
    this.description=obj["Description"];
    this.allt=obj["Allt"];
    this.count=0;
  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Name"]=this.name;
    map["Code"]=this.code;
    map["PriceB"]=this.priceB;
    map["PriceC"]=this.priceC;
    map["Description"]=this.description;
    map["Allt"]=this.allt;
    map['Count']=this.count;
   
   return map;

  }

  Map<String, dynamic> toShopCartMap() {
    var map = new Map<String, dynamic>();
    //map["Name"]=this.name;
    map["Code"]=this.code;
    map["Amount"]=this.priceB;
    //map["PriceC"]=this.priceC;
    //map["Description"]=this.description;
    map["CatKey"]=this.catKey;
    map['Count']=this.count;

   return map;

  }
 
  factory ShoppingCartProductVM.fromShopCartModel(ShopCartModel model)
  {
    return new ShoppingCartProductVM(model.count, '', model.code, '', model.amount.toString(), '', '');
  }
  ShopCartModel toShopCartModel()
  {
    ShopCartModel res=new ShopCartModel.map(this.toShopCartMap());
    return res;
  }

   String getNameFromMap(String categorykey,String code)
   {
     List<ProductSummary> fpList=repository.getMapOfProductsInCategory()[categorykey].where((p) => p.code==code).toList();
     if(fpList!=null && fpList.length>0 && fpList[0]!=null)
       return fpList[0].name;
     else
     {
       fpList=repository.getMapOfProductsInCategory()[categorykey];
       if(fpList!=null &&
           fpList.length>0)
       {
         List<ProductSummary> productFiltered=fpList.where((p)=> p.code==code).toList();
         if(productFiltered!=null &&
             productFiltered.length>0)
         {
           return productFiltered[0].name;
         }
       }
     }
     return '';
   }

Map<String, dynamic> toJson() => {
 'Name': this.name,
 'Code': this.code,
  'PriceB': this.priceB,
  'PriceC': this.priceC,
  'Allt': this.allt,
  'Description':this.description,
};

}