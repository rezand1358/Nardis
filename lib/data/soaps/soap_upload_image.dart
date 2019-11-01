import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_actions.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/models/change_event.dart';

class SoapUploadImage extends SoapCall {
  SoapCall soapCall;
  BuildContext context;
  SoapOpers soapOpers;
  SoapUploadImage({this.context})
  {
    soapOpers=new SoapOpers(context: context,type:10,oper:SoapOpersConstants.OPERS_UPLOAD_IMAGE);
  }

  void call(String method,String inputJson,String inputJson2) async
  {
    var envelope = '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <${method} xmlns="http://tempuri.org/" >
     <ImgStr>${inputJson}</ImgStr>
     <ImgName>${inputJson2}</ImgName>
      
    </${method}>
  </soap:Body>
</soap:Envelope>
''';

    action= SoapConstants.SOAP_ACTION_SAVE_IMAGE;
    requestBody= envelope;
    responseTag='SaveImageResponse';
    resultTag= 'SaveImageResult';
    List<dynamic> result=await applySoap(method, SoapTypes.SAVEIMAGE);

  }

  @override
  void doActions(List result) {
    if(result!=null &&
        result.length>0 &&
        result[0]!=null) {
      try {
        String jsonResult = result[0];
        if(jsonResult=='true')
        {
          //soapOpers.doAction(jsonResult);
          RxBus.post(new ChangeEvent(message: 'UPLOAD_SUCCESS'));
        }
      }
      catch(error){
        Scaffold.of(context).showSnackBar(new SnackBar(content: Text('آپلود عکس با مشکل مواجه شد...')));

      }
      //soapOpers.doAction(jsonResult);
    }
    else{
      //BlocProvider.of<RegisterBloc>(context).dispatch(new RegisteredEvent());

    }
  }
}