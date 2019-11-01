import 'dart:convert';

import 'package:nardis/data/base_call.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:http/http.dart' as http;
import 'package:nardis/data/soaps/base_soap.dart';
import 'package:nardis/data/soaps/soap_types.dart';
import 'package:nardis/data/soaps/special_offers.dart';
import 'package:nardis/models/listeners/soap_actions.dart';
import 'package:xml/xml.dart' as xml;
abstract class SoapCall extends BaseSoap 
{

String action;
String requestBody;
String responseTag;
String resultTag;
String requestURL;  
//BaseSoap baseSoap;

 void doActions(List<dynamic> result);
  List<dynamic> itemsList=new List();
  SoapCall({this.action,this.requestBody,this.responseTag,this.resultTag})
  {
    this.requestURL=SoapConstants.URL2;
  }

Future _parsing(var _response) async {
    var _document = xml.parse(_response);
    Iterable<xml.XmlElement> items = _document.findAllElements('${responseTag}');
    items.map((xml.XmlElement item) {
      var _addResult = _getValue(item.findElements('${resultTag}'));
      itemsList.add(_addResult);
    }).toList();


    

  }


  _getValue(Iterable<xml.XmlElement>  items) {
    var textValue;
    items.map((xml.XmlElement node) {
      textValue = node.text;
    }).toList();
    return textValue;
  }


Future<List<dynamic>> runSoap(String method) async {

http.Response response = await http.post(
        requestURL,
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": action,
          
          //"Host": SoapConstants.HOST,
          "cache-control": "no-cache"
          //"Accept": "text/xml"
        },
        body: utf8.encode(requestBody),
      encoding: Encoding.getByName("UTF-8"))
      .then((onValue)
        {
            if(onValue.statusCode==200)
            {
              var response=onValue.body;
              _parsing(onValue.body);
              return onValue;
            }
            else{
              return onValue;
            }
      });
    if(itemsList.length>0)
    {
      //call.applySoap();
      //listener.doAction(await Future.value(itemsList));
      return Future.value(itemsList);
    }
    else{
      return null;
    }
    


 }

  @override
  Future<List<dynamic>> applySoap(String method, SoapTypes type) async {

        switch(type)
      {
        case SoapTypes.CATEGORY:
        
        break;
        case SoapTypes.BRANDS:
        break;
        case SoapTypes.OFFERS:
          break;
        case SoapTypes.MESSAGE:
          break;
        case SoapTypes.SUBCATEGORY:
          break;
        case SoapTypes.SEARCH:
          break;
        case SoapTypes.OBJECTLISt:
          break;
        case SoapTypes.SAVEORDER:
          break;
        case SoapTypes.SAVECUSTOMER:
          break;
        case SoapTypes.APPVERSIOn:
          break;
        case SoapTypes.CUSTOMERLOGIN:
          break;
          case SoapTypes.GETLASTOBJECTCODE:
            break;
          case SoapTypes.SAVENEWOBJECT:
            break;
          case SoapTypes.SAVEIMAGE:
            break;
          case SoapTypes.ADMINCATEGORY:
            break;
          case SoapTypes.ADMINBRANDS:
            break;
        }

    List<dynamic> result=await runSoap(method);
    if(result!=null &&
    result.length>0)
    {
      doActions(result);
    }
    else{
      doActions(result);
    }
     return result;
    
  }

 

}