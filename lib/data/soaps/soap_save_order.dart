
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/bloc/basic/bloc_provider.dart';
import 'package:nardis/bloc/basic/global_bloc.dart';
import 'package:nardis/data/database_helper.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/listeners/soap_actions.dart';
import 'package:nardis/models/message.dart';
import 'package:uuid/uuid.dart';

class SoapSaveOrder extends SoapCall {
  SoapCall soapCall;
 BuildContext context; 
  SoapOpers soapOpers;
  
  SoapSaveOrder({this.context})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_SAVEORDER);
  }

  void call(String method,String inputJson) async
  {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" >
     <inputStringJson>${inputJson}</inputStringJson> 
    </${method}>
  </soap:Body>
</soap:Envelope>
''';

action= SoapConstants.SOAP_ACTION_SAVE_ORDER;
requestBody= envelope;
 responseTag='SaveOrderOrFactorResponse';
 resultTag= 'SaveOrderOrFactorResult';
List<dynamic> result=await applySoap(method, SoapTypes.SAVEORDER);
  //soapCall=new SoapCall(action: SoapConstants.SOAP_ACTION_SAVE_ORDER,requestBody: envelope, responseTag:'SaveOrderOrFactorResponse',resultTag: 'SaveOrderOrFactorResult');
  
  //List<dynamic> result=await soapCall.runSoap(SoapConstants.METHOD_NAME_SAVE_ORDER,this);
  // List<dynamic> jsonResult=jsonDecode(result[0]);
  // soapOpers.doAction(jsonResult);
  }

  
  @override
  void doActions(List result) {
    if(result!=null &&
    result.length>0 &&
    result[0]!=null) {
      String jsonResult = result[0];
      var uuid = new Uuid();
      try {
        var uuid_temp = uuid.parse(jsonResult);
        if(uuid_temp!=null)
          {
            databaseHelper.deleteShopCart();
            BlocProvider.of<GlobalBloc>(context)
                .messageBloc
                .addition
                .add(Message("ORDER_SAVED", "success"));
                List<dynamic> res=new List();
                res.add(jsonResult);
                soapOpers.doAction(res);

          }
      }
      catch (error) {
        BlocProvider.of<GlobalBloc>(context)
            .messageBloc
            .addition
            .add(Message("ORDER_NOT_SAVED", "faild"));
            RxBus.post(ChangeEvent(message: "ORDER_SAVED_ERROR"));
      }
      }

  }
}