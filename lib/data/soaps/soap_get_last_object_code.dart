import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/bloc/values/notify_value.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/message.dart';

class SoapLastObjectCode extends SoapCall {
  SoapCall soapCall;
  SoapOpers soapOpers;
  BuildContext context;
  NotyBloc<Message> noty;
  SoapLastObjectCode({this.context,this.noty})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_LAST_OBJECT_CODE_ACTIONS);
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

    action = SoapConstants.SOAP_ACTION_GET_LAST_OBJECT_CODE;
    requestBody = envelope;
    responseTag = 'GetLastObjectCodeResponse';
    resultTag = 'GetLastObjectCodeResult';
    List<dynamic> result = await applySoap(method, SoapTypes.GETLASTOBJECTCODE);
  }

  @override
  void doActions(List result) {
    if(result!=null &&
        result.length>0 &&
        result[0]!=null) {
      String res=result[0];

      Message event=new Message(text: res,type: 'OBJECT_CODE');
      noty.updateValue(event);
      RxBus.post( ChangeEvent(message: 'OBJECT_CODE_LOADED',value: res));
      //soapOpers.doAction(jsonRes);
    }
    else{
      RxBus.post(ChangeEvent(message: 'OBJECT_CODE_FAILED'));
    }
  }


}