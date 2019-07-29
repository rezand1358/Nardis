import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nardis/bloc/register/register.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/listeners/soap_actions.dart';

class SoapSaveCustomer extends SoapCall {
 SoapCall soapCall;
 BuildContext context; 
 SoapOpers soapOpers;
  
  SoapSaveCustomer({this.context})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_SAVECUSTOMER);
  }

  void call(String method,String inputJson) async
  {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" >
     <inputStringJson>${inputJson}</inputStringJson> 
    </${method}>
  </soap:Body>
</soap:Envelope>
''';

action= SoapConstants.SOAP_ACTION_SAVE_CUSTOMER;
requestBody= envelope;
 responseTag='SaveCustomerResponse';
resultTag= 'SaveCustomerResult';
 List<dynamic> result=await applySoap(method, SoapTypes.SAVECUSTOMER);
  //soapCall=new SoapCall(action: SoapConstants.SOAP_ACTION_SAVE_CUSTOMER,requestBody: envelope, responseTag:'SaveCustomerResponse',resultTag: 'SaveCustomerResult');
  
 // List<dynamic> result=await soapCall.runSoap(SoapConstants.METHOD_SAVE_CUSTOMER,this);
  // List<dynamic> jsonResult=jsonDecode(result[0]);
  // soapOpers.doAction(jsonResult);
  }

  @override
  void doActions(List result) {
    if(result!=null &&
     result.length>0 &&
     result[0]!=null) {
      try {
        List<dynamic> jsonResult = jsonDecode(result[0]);
        if(jsonResult!=null && jsonResult.length>0)
          {
            soapOpers.doAction(jsonResult);
          }
      }
      catch(error){
        Navigator.pushReplacementNamed(context, '/login');
      }
    //soapOpers.doAction(jsonResult);
     }
     else{
       //BlocProvider.of<RegisterBloc>(context).dispatch(new RegisteredEvent());
        Navigator.pushReplacementNamed(context, '/login');
     }
  }
}