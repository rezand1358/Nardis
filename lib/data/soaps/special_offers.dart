
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
import 'package:nardis/models/viewmodels/product_summary_vm.dart';

class SpecialOffers extends SoapCall{
  SoapCall soapCall;
  SoapOpers soapOpers;
  BuildContext context;
  SpecialOffers()
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_SPECIALOFFERS);
  }

  List<dynamic> productOffers=null;

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
action=SoapConstants.SOAP_ACTION;
requestBody= envelope;
responseTag= 'GetSpecial_OfferResponse';
resultTag= 'GetSpecial_OfferResult';
List<dynamic> result=await applySoap(method, SoapTypes.OFFERS);
  // soapCall=new SoapCall(action:SoapConstants.SOAP_ACTION,requestBody: envelope,responseTag: 'GetSpecial_OfferResponse',resultTag: 'GetSpecial_OfferResult');
  // List<dynamic> result=await soapCall.runSoap(SoapConstants.METHOD_NAME,this);
  // if(result!=null &&
  // result.length>0)
  // {
    
  //   productOffers=jsonDecode(result[0]);
  //   if(productOffers!=null &&
  //     productOffers.length>0)
  //   {
  //       soapOpers.doAction(productOffers);
  //   }
  // }
  // else{ 
  //   RxBus.post(ChangeEvent(message: 'OFFERS_LOADED'));
  // }
  }



  @override
  void doActions(List result) {
    if(result!=null &&
  result.length>0)
  {
    
    productOffers=jsonDecode(result[0]);
    if(productOffers!=null &&
      productOffers.length>0)
    {
        soapOpers.doAction(productOffers);
    }
  }
  else{ 
    RxBus.post(ChangeEvent(message: 'OFFERS_LOADED'));
  }
  }
  
}