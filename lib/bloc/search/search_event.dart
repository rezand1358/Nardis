import 'dart:async';
import 'package:nardis/bloc/search/index.dart';
import 'package:meta/meta.dart';
import 'package:nardis/repository/search/search_provider.dart';

@immutable
abstract class SearchEvent<T> {
  Future<SearchState> applyAsync(
      {SearchState currentState, T bloc});
  final SearchProvider _searchProvider = new SearchProvider();
}


class InitSearchEvent extends SearchEvent<SearchBloc> {

  InitSearchEvent();
  @override
  String toString() => 'InitSearchEvent';

  @override
  Future<SearchState> applyAsync(
      {
        SearchState currentState, SearchBloc bloc}) async {
    try {
      return new UnSearchState();
    } catch (_, stackTrace) {
      //print('$_ $stackTrace');
      return new ErrorSearchState(_?.toString());
    }
  }
}


class LoadSearchEvent extends SearchEvent<SearchBloc> {
  String searchText;

  LoadSearchEvent(this.searchText);
  @override
  String toString() => 'LoadSearchEvent';

  @override
  Future<SearchState> applyAsync(
      {
        SearchState currentState, SearchBloc bloc}) async {
    try {
      
       
      this._searchProvider.search(searchText,null,bloc);
      return new InSearchState();
    } catch (_, stackTrace) {
      //print('$_ $stackTrace');
      return new ErrorSearchState(_?.toString());
    }
  }
}

class LoadedSearchEvent extends SearchEvent<SearchBloc> {
  @override
  String toString() => 'LoadedSearchEvent';

  @override
  Future<SearchState> applyAsync(
      {
        SearchState currentState, SearchBloc bloc}) async {
    try {
      //await Future.delayed(new Duration(seconds: 2));
      
      return new DoneSearchState();
    } catch (_, stackTrace) {
      //print('$_ $stackTrace');
      return new ErrorSearchState(_?.toString());
    }
  }
}

