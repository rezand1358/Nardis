import 'dart:convert';

import 'package:nardis/data/soap_constants.dart';
import 'package:http/http.dart' as http;
import 'package:nardis/data/soaps/base_soap.dart';
import 'package:nardis/models/listeners/soap_actions.dart';
import 'package:xml/xml.dart' as xml;

abstract class BaseCall<T> {

  T call;
  List<dynamic> itemsList=new List();
  Future<List<dynamic>> runSoap(String method,SoapActions listener);

  Future _parsing(var _response,String responseTag,String resultTag) async {
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

}