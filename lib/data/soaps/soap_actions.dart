import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart' as searchbloc;
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/bloc/register/register.dart';
import 'package:nardis/bloc/search/SearchBloc.dart';
//import 'package:nardis/bloc/search/index.dart' as searchbloc2;
import 'package:nardis/bloc/search/index.dart' as searchindex;
//import 'package:nardis/bloc/search/index.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/server.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
//import 'package:nardis/models/Search_event.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/user.dart';
import 'package:nardis/models/viewmodels/product_list_vm.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';
import 'package:nardis/translation_strings.dart';
import 'package:nardis/ui/login/confirm_login.dart';
import 'package:nardis/widgets/appbar_collapse.dart';
import 'package:nardis/widgets/bottom_sheet_fix.dart';
import 'package:package_info/package_info.dart';

class SoapOpers<T> {
  int type;
  String oper='';
  String productCode='';
  BuildContext context;
  Server server;
  SearchBloc searchBloc;
  searchindex.SearchBloc searchBloc2;
  SoapOpers({this.context,this.type,this.oper,this.server,this.productCode,this.searchBloc,this.searchBloc2})
  {
    if(server==null)
    {
      server=new Server();
    }
  }

  doAction(List<dynamic> data)
  {
    if(data==null || data.length==0)
    {

    }
    else {
    if(this.oper==SoapOpersConstants.OPERS_CUSTOMERLOGIN)
    {
      customerLogin(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_CATEGORY)
    {
      loadCategory(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_SPECIALOFFERS)
    {
      loadOffers(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_APPVERSION)
    {
      _checkVersion(data);    
    }
     if(this.oper==SoapOpersConstants.OPERS_SEARCH)
    {
      loadSearch(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_BRANDGROUPS)
    {
      loadBrandGroups(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_MESSAGE)
    {
      loadMessage(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_SAVECUSTOMER)
    {
      _saveCustomer(data);
    }
     if(this.oper==SoapOpersConstants.OPERS_SAVEORDER)
    {
      _saveOrder(data);
    }
    if(this.oper==SoapOpersConstants.OPERS_SUBCATEGORY)
    {
      loadSubProducts(data);
    }
    if(this.oper==SoapOpersConstants.OPERS_HOME_ACTIONS)
    {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
  Future _checkVersion(List<dynamic> data) async
    {
      String version=data[0];
      if(version.isNotEmpty)
      {
        double verNum=num.tryParse(version)?.toDouble();
        if(verNum!=null)
        {
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          String versionName = packageInfo.version;
          String versionName2 = versionName.substring(0,2);
          if(num.tryParse(versionName2)?.toDouble()==verNum) {
            RxBus.post(ChangeEvent(message: "APP_VERSION_CHECKED_VALID"));
          }
          else
            RxBus.post(ChangeEvent(message: "APP_VERSION_CHECKED_NOT_VALID"));
        }
        else{
          RxBus.post(ChangeEvent(message: "APP_VERSION_CHECKED_NOT_VALID"));
        }
      }
}

Future loadSearch(List<dynamic> data) async
{
  List<ProductSummary> products=new List();
  products=data.map((p)=>
  ProductSummary.fromJson(p)).toList();
  repository.setSearchProducts(products, SoapOpersConstants.SEARCH);
 // RxBus.post(new SearchMessageEvent(message: SoapOpersConstants.SEARCHDONE,value: 0));
  if(searchBloc!=null) {
    (searchBloc).products.add(products);
  }
  else if(searchBloc2!=null)
    {
      searchBloc2.dispatch(new searchindex.LoadedSearchEvent());
    }
  //searchBloc.dispatch(new LoadedSearchEvent());
}
Future loadCategory(List<dynamic> data) async
{
  List<ProductCategoryModel> categories=new List();
      categories=data.map((p) =>
        ProductCategoryModel.fromJson(p)).toList();
      List<ProductCategoryModel> catfiltered=new List();
      catfiltered=categories.where((c) => c.parent_id=='0').toList();
      repository.setListOfCategory(catfiltered);


      //get Sub Category
      List<ProductCategoryModel> subCatfiltered=new List();
      for(ProductCategoryModel pc in catfiltered)
      {
        subCatfiltered=categories.where((c) => c.parent_id==pc.code).toList();
        if(subCatfiltered!=null &&
        subCatfiltered.length>0)
        {
          repository.getMapOfGroupsInCategory().putIfAbsent(pc.name, () => subCatfiltered );
        }
      }
      //Navigator.pushReplacementNamed(context, '/home');
//    server.simulateMessage("CATEGORY_LOADED");
    RxBus.post(ChangeEvent(message: "CATEGORY_LOADED"));

}


Future loadSubProducts(List<dynamic> data) async
{
  List<ProductSummary> products=new List();
      products=data.map((p) =>
        ProductSummary.fromJson(p)).toList();
     
     repository.setSubProducts(products, this.productCode);

     loadProductsList(this.productCode);
    //RxBus.post(ChangeEvent(message: "SUBPRODUCTS_LOADED"));

}


loadProductsList(String catName)
{
 List<ProductSummary> products=repository.getMapOfProductsInCategory()[catName];
ProductListVM productListVM=new ProductListVM(catItem: new CategoryItem('', '', productCode, catName, SoapOpersConstants.SUBCATEGORY),isFromCart: false,products:products );  

 Navigator.pushReplacementNamed(context, '/productslist',arguments: productListVM); 
  
}
Future loadBrandGroups(List<dynamic> data) async
{
  List<ProductCategoryModel> categories=new List();
      categories=data.map((p) =>
        ProductCategoryModel.fromJson(p)).toList();
      List<ProductCategoryModel> catfiltered=new List();
      catfiltered= categories.where((c) => c.parent_id=='0').toList();
      repository.setListOfBrandCategory(catfiltered);

//get Sub Category
      List<ProductCategoryModel> subCatfiltered=new List();
      for(ProductCategoryModel pc in catfiltered)
      {
        subCatfiltered=categories.where((c) => c.parent_id==pc.code).toList();
        if(subCatfiltered!=null &&
        subCatfiltered.length>0)
        {
          repository.getMapOfGroupsInCategory().putIfAbsent(pc.name, () => subCatfiltered );
        }
      }

    RxBus.post(ChangeEvent(message:"BRAND_LOADED"));

}
Future loadOffers(List<dynamic> jsonResult) async
{
  List<ProductSummary> offerItems=new List();
  offerItems=jsonResult.map((o) => 
  ProductSummary.fromJson(o) ).toList();
  repository.setProductOffers(offerItems, SoapOpersConstants.OFFERS);
    //server.simulateMessage("OFFERS_LOADED");
     RxBus.post(ChangeEvent(message: "OFFERS_LOADED"));

}

Future loadMessage(List<dynamic> jsonResult) async
{
  String message=jsonResult.map((data) =>
   data).toString();
   repository.topMessage=message;

   RxBus.post(ChangeEvent(message: "MESSAGE_LOADED"));
}

_saveCustomer(List<dynamic> jsonResult)
{
  //String result=jsonResult.map((data) => data).toString();
   customerLogin(jsonResult);
   RxBus.post(ChangeEvent(message: "CUSTOMER_SAVED"));
}
_saveOrder(List<dynamic> jsonResult)
{
  String result=jsonResult.map((data) => data).toString();
  if(result.isNotEmpty)
    RxBus.post(ChangeEvent(message: "ORDER_SAVED"));
  else
    RxBus.post(ChangeEvent(message: "ORDER_SAVED_ERROR"));
    

}
  customerLogin(List<dynamic> jsonResult)
  {

List<Customer> customer=new List<Customer>();
    customer=jsonResult.map((data) => 
       Customer.fromJson(data)).toList();

       if(customer!=null &&
       customer.length>0)
       {
         Customer user=new Customer();
         user=customer[0];
         if(user!=null &&
         user.mobile.isNotEmpty &&
         user.mobile!=null)
         {
_modalBottomSheet(user);
// showModalBottomSheetApp(context: context,builder: (builder) {
//   ConfirmLogin();
// });
         }
         else{

         }
       }
       else{

       }
  }

customerRegister(List<dynamic> jsonResult)
  {

List<Customer> customer=new List<Customer>();
    customer=jsonResult.map((data) => 
       Customer.fromJson(data)).toList();

       if(customer!=null &&
       customer.length>0)
       {
         Customer user=new Customer();
         user=customer[0];
         if(user!=null &&
         user.mobile.isNotEmpty &&
         user.mobile!=null)
         {
          _modalBottomSheet(user);
         }
         else{
            _modalBottomSheetError(user);
         }
       }
       else{
            _modalBottomSheetError(new Customer());
       }
  }
  void _modalBottomSheet(Customer user){
showModalBottomSheet(
context: context,
builder: (builder){
return ConfirmLogin(user: user);
}
);
}

 void _modalBottomSheetError(Customer user){
    showModalBottomSheet(
context: context,
builder: (builder){
return new Container(
              child: new Center(
            child: new Text(Translations.current.plzlogin()),
          ));
}
);
}
}