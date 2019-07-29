
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/listeners/soap_actions.dart';

class SoapAppVersion extends SoapCall{
  SoapCall soapCall;
  SoapOpers soapOpers;
  BuildContext context;

  SoapAppVersion({this.context})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_APPVERSION);
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

action= SoapConstants.SOAP_ACTION_GET_APP_VERSION;
requestBody= envelope;
responseTag= 'GetApplication_VersionResponse';
resultTag= 'GetApplication_VersionResult';
List<dynamic> result=await applySoap(method, SoapTypes.APPVERSIOn);
  // soapCall=new SoapCall(action: SoapConstants.SOAP_ACTION_GET_APP_VERSION,requestBody: envelope,responseTag: 'GetApplication_VersionResponse',resultTag: 'GetApplication_VersionResult');
  
  // List<dynamic> result= await soapCall.runSoap(SoapConstants.METHOD_NAME_GET_APP_VERSION,this);
  // // List<dynamic> jsonResult=jsonDecode(result[0]);
  // soapOpers.doAction(jsonResult);
  }

  

  @override
  void doActions(List result) {
    List<dynamic> jsonResult=result;
  soapOpers.doAction(jsonResult);
  }
}