
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/constants/constants.dart';
import 'package:nardis/data/base_call.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/base_soap.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/listeners/soap_actions.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';
import 'package:nardis/repository/product/center_repository.dart';

class SoapAdminCategory extends SoapCall{
  SoapCall soapCall;
  BuildContext context;
  SoapOpers soapOpers;

  SoapAdminCategory({this.context})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_ADMINCATEGORY);
  }

  List<ProductCategoryModel> productOffers=null;

  Future call(String method,BuildContext context)
  async {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" />
  </soap:Body>
</soap:Envelope>
''';

    requestBody=envelope;
    action=SoapConstants.SOAP_ACTION_GetAdminProduct_Group;
    responseTag= 'GetAdminProduct_GroupResponse';
    resultTag= 'GetAdminProduct_GroupResult';
    List<dynamic> result=await applySoap(method, SoapTypes.ADMINCATEGORY);

  }





  Future loadAdminCategory(List<dynamic> data) async
  {
    List<ProductCategoryModel> categories=new List();
    categories=data.map((p) =>
        ProductCategoryModel.fromJson(p)).toList();
    List<ProductCategoryModel> catfiltered=new List();
    catfiltered=categories.where((c) => c.parent_id=='0').toList();
    repository.setListOfAdminCategory(catfiltered);


    //get Sub Category
    List<ProductCategoryModel> subCatfiltered=new List();
    for(ProductCategoryModel pc in catfiltered)
    {
      subCatfiltered=categories.where((c) => c.parent_id==pc.code).toList();
      if(subCatfiltered!=null &&
          subCatfiltered.length>0)
      {
        repository.getMapOfAdminGroupsInCategory().putIfAbsent(pc.name, () => subCatfiltered );
      }
    }
    //Navigator.pushReplacementNamed(context, '/home');
//    server.simulateMessage("CATEGORY_LOADED");
    RxBus.post(ChangeEvent(message: "ADMINCATEGORY_LOADED"));

  }



  @override
  void doActions(List result) {
    if(result!=null &&
        result.length>0) {
      loadAdminCategory(jsonDecode(result[0]));
    }
    else{
      RxBus.post(ChangeEvent(message: 'ADMINCATEGORY_LOADED'));
    }
  }


}
