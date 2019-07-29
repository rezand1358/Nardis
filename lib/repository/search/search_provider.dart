
import 'package:nardis/bloc/search/SearchBloc.dart';
import 'package:nardis/bloc/search/index.dart' as searchbloc2;
import 'package:nardis/data/rxbus.dart';
import 'package:nardis/data/soap_constants.dart';
import 'package:nardis/data/soaps/soap_opers_constant.dart';
import 'package:nardis/data/soaps/soap_search_products.dart';
import 'package:nardis/models/change_event.dart';
import 'package:nardis/models/viewmodels/product_summary_vm.dart';

class  SearchProvider<T> {


  static final  SearchProvider _repository = new SearchProvider._internal();
  SearchBloc searchBloc;
  searchbloc2.SearchBloc searchBloc2;
  factory SearchProvider() {
   
    return _repository;
  }

  SearchProvider._internal();

  List<ProductSummary> search(String searchText,SearchBloc searchBloc,searchbloc2.SearchBloc searchBloc2)
  {
    SoapSearchProducts soapSearchProducts=new SoapSearchProducts(searchBloc: searchBloc,searchBloc2: searchBloc2);
    soapSearchProducts.call(SoapConstants.METHOD_NAME_SEARCH,searchText);
    return null;
  }
}


SearchProvider searchProvider=new SearchProvider();