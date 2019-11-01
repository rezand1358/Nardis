import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';

class SoapAddProduct extends SoapCall {
  SoapCall soapCall;
  BuildContext contex;
  SoapOpers soapOpers;
  SoapAddProduct({this.contex})
  {
    soapOpers=new SoapOpers(context: contex,type:10,oper:SoapOpersConstants.OPERS_SAVENEWOBJECT);
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

    action= SoapConstants.SOAP_ACTION_SAVE_NEW_OBJECT;
    requestBody= envelope;
    responseTag='SaveNewObjectResponse';
    resultTag= 'SaveNewObjectResult';
    List<dynamic> result=await applySoap(method, SoapTypes.SAVENEWOBJECT);

  }

  @override
  void doActions(List result) {
    if(result!=null &&
        result.length>0 &&
        result[0]!=null) {
      try {
        String jsonResult = result[0];
        if(jsonResult.isNotEmpty)
        {
          RxBus.post(new ChangeEvent(message: 'OBJECT_SAVED'));
        }
      }
      catch(error){
        Scaffold.of(contex).showSnackBar(new SnackBar(content: Text(result[0])));

      }
      //soapOpers.doAction(jsonResult);
    }
    else{
      //BlocProvider.of<RegisterBloc>(context).dispatch(new RegisteredEvent());

    }
  }
}