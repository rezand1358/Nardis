
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/listeners/soap_actions.dart';

class SoapMessage extends SoapCall {
  SoapCall soapCall;
  SoapOpers soapOpers;
  BuildContext context;

  SoapMessage()
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_MESSAGE);

  }

  void call(String method) async
  {
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

action=SoapConstants.SOAP_ACTION_GET_MESSAGE;
requestBody= envelope;
responseTag= 'GetMessageResponse';
resultTag='GetMessageResult';
List<dynamic> result=await applySoap(method,SoapTypes.MESSAGE);
  // soapCall=new SoapCall(action:SoapConstants.SOAP_ACTION_GET_MESSAGE,requestBody: envelope,responseTag: 'GetMessageResponse',resultTag:'GetMessageResult');
 
  // List<dynamic> result=await soapCall.runSoap(SoapConstants.METHOD_NAME_GET_MESSAGE,this);
  // if(result!=null &&
  // result.length>0 &&
  // result[0]!=null){
  // List<dynamic> jsonRes=jsonDecode(result[0]);
  // soapOpers.doAction(jsonRes);
  // }
  // else{
  //   RxBus.post(ChangeEvent(message: 'MESSAGE_LOADED'));
  // }
  }

 

  @override
  void doActions(List result) {
    if(result!=null &&
    result.length>0 &&
    result[0]!=null) {
    List<dynamic> jsonRes=jsonDecode(result[0]);
  soapOpers.doAction(jsonRes);
    }
    else{
      RxBus.post(ChangeEvent(message: 'MESSAGE_LOADED'));
    }
  }
}