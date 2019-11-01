
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/constants/constants.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/listeners/soap_actions.dart';
import 'package:nardis/models/product_category_model.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';

class SoapSubCategory extends SoapCall{
  SoapCall soapCall;
  BuildContext context;
  SoapOpers soapOpers;
  String productCode='';
  SoapSubCategory({this.context,this.productCode})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_SUBCATEGORY,productCode: this.productCode);
  }

  List<ProductCategoryModel> productinCategory=null;

  Future call(String method,String productCode,BuildContext context)
  async {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" >
    <ProductCode>${productCode}</ProductCode>
    </${method}>
  </soap:Body>
</soap:Envelope>
''';

action=SoapConstants.SOAP_ACTION_OBJECT;
requestBody= envelope;
responseTag= 'GetObjectListResponse';
resultTag= 'GetObjectListResult';
List<dynamic> result=await applySoap(method,SoapTypes.SUBCATEGORY);
  // soapCall=new SoapCall(action:SoapConstants.SOAP_ACTION_OBJECT,requestBody: envelope,responseTag: 'GetObjectListResponse',resultTag: 'GetObjectListResult');
  // List<dynamic> result=await soapCall.runSoap(SoapConstants.METHOD_NAME_OBJECTLIST,this);
  // // if(result!=null &&
  // result.length>0){
  // List<dynamic> jsonResult=jsonDecode(result[0]);
  // soapOpers.doAction( jsonResult);
  // }
  // else{
  //   RxBus.post(ChangeEvent(message: 'SUBPRODUTCS_LOADED'));

  // }
}



  @override
  void doActions(List result) {
     if(result!=null &&
  result.length>0){
  List<dynamic> jsonResult=jsonDecode(result[0]);
  soapOpers.doAction( jsonResult);
  }
  else{
    RxBus.post(ChangeEvent(message: 'SUBPRODUCTS_LOADED'));

  }
  }
}
