
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/customer.dart';
import 'package:nardis/models/listeners/soap_actions.dart';
import 'package:nardis/ui/login/confirm_login.dart';
import 'package:nardis/widgets/bottom_sheet_fix.dart';

class SoapCustomer extends SoapCall{
  SoapCall soapCall;
  BuildContext context; 
  SoapOpers soapOpers;
  
List<Customer> customer=new List<Customer>();

SoapCustomer({this.context})
{
  soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_CUSTOMERLOGIN);
}
  void call(String method,String params,String value) async
  {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" >
    <${params}>${value}</${params}>
    </${method}>
  </soap:Body>
</soap:Envelope>
''';

  action=SoapConstants.SOAP_ACTION_CUSTOMER_LOGIN;
  requestBody= envelope;
  responseTag= 'GetCustomerLoginResponse';
  resultTag='GetCustomerLoginResult';

List<dynamic> result=await applySoap(method, SoapTypes.CUSTOMERLOGIN);
  //soapCall=new SoapCall(action:SoapConstants.SOAP_ACTION_CUSTOMER_LOGIN,requestBody: envelope,responseTag: 'GetCustomerLoginResponse',resultTag:'GetCustomerLoginResult');
  
  //List<dynamic> result= await soapCall.runSoap(SoapConstants.METHOD_NAME_CUSTOMER_LOGIN,this) ;
    // List<dynamic> jsonResult=jsonDecode(result[0]);
    // soapOpers.doAction(jsonResult);
    
    
  }

  List<Customer> parseResults(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Customer>((json) => Customer.fromJson(json)).toList();
}

  @override
  void doActions(List result) {
     List<dynamic> jsonResult=jsonDecode(result[0]);
    soapOpers.doAction(jsonResult);
  }

}
