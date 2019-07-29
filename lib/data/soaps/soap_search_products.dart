
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/bloc/search/SearchBloc.dart';
import 'package:nardis/bloc/search/index.dart' as searchbloc2;
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/listeners/soap_actions.dart';

class SoapSearchProducts<T> extends SoapCall{
  SoapCall soapCall;
  SoapOpers soapOpers;
  BuildContext context;
  SearchBloc searchBloc;
  searchbloc2.SearchBloc searchBloc2;
  SoapSearchProducts({this.context,this.searchBloc,this.searchBloc2})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_SEARCH,searchBloc: searchBloc,searchBloc2: searchBloc2);
  }

  void call(String method,String objectName) async
  {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" >
    <ObjectName>${objectName}</ObjectName>
    </${method}>
  </soap:Body>
</soap:Envelope>
''';

action= SoapConstants.SOAP_ACTION_GET_SEARCH_LIST;
requestBody= envelope;
 responseTag= 'GetObjectSearchListResponse';
 resultTag='GetObjectSearchListResult';
  List<dynamic> result=await applySoap(method, SoapTypes.SEARCH);

  //soapCall=new SoapCall(action: SoapConstants.SOAP_ACTION_GET_SEARCH_LIST,requestBody: envelope, responseTag: 'GetObjectSearchListResponse',resultTag:'GetObjectSearchListResult');
  //List<dynamic> result=await soapCall.runSoap(SoapConstants.METHOD_NAME_SEARCH,this);
  // List<dynamic> jsonResult=jsonDecode(result[0]);
  // soapOpers.doAction(jsonResult);
  }

  

  @override
  void doActions(List result) {
   List<dynamic> jsonResult=jsonDecode(result[0]);
  soapOpers.doAction(jsonResult);
  }
}