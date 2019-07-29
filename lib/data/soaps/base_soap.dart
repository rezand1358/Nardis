import 'package:nardis/data/soaps/soap_types.dart';

abstract class BaseSoap {

Future<List<dynamic>> applySoap(String method,SoapTypes type);
  
}